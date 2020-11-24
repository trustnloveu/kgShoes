package com.itbank.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.BoardDAO;
import com.itbank.dao.ShoesDAO;
import com.itbank.vo.MerchandiseVO;
import com.itbank.vo.ReviewsParam;
import com.itbank.vo.ShoeSizeVO;


@Service
public class LookupService {
	
	@Autowired private ShoesDAO dao;
	private final int perPage = 5;
	@Autowired private BoardDAO boardDao;
	
	// 제품 제고 불러오는 함수
	public List<ShoeSizeVO> getQuantity(String merchanCode) { return dao.getQuantity(merchanCode); }

	// 단일 상품 조회 페이지 이동 함수
	public ModelAndView lookupPage(String merchanCode) {
		ModelAndView mav = new ModelAndView("shopSingle");
		String shoeCode = merchanCode.split("-")[0];	// merchanCode의 -기준 앞자리
		
		// 단일 객체
		MerchandiseVO vo = dao.selectMerchan(merchanCode);	// 해당 상품을 merchanCode를 이용해 객체를 들고 온다.
		
		// 다른 색상의 객체들
		HashMap<String, String> shoeCodeparam = new HashMap<String, String>();
		shoeCodeparam.put("shoeCode", shoeCode);	// shoeCode를 HashMap형태로 DAO로 전달해주기 위한 변수
		List<MerchandiseVO> shoeColorList = dao.shoeColors(shoeCodeparam);	// DB의 반환 값을  list에 담아준다.
		removeThis(merchanCode, shoeColorList);	// 해당 상품을 리스트에서 제거해주는 함수 (아래에 정의되어 있다)
		
		
		
		//8.7Bong		
		// 같은 브랜드의 다른 상품들
		HashMap<String, String> brandParam = new HashMap<String, String>();
		brandParam.put("brand", vo.getBrand());
		brandParam.put("category", vo.getCategory());
		List<MerchandiseVO> brandList = dao.recomendedList(brandParam);
		removeThis(merchanCode, brandList);
		
		Collections.shuffle(brandList);	// list를 섞어주는 기능을 담당한다.
		
		mav.addObject("shoes", vo);
		mav.addObject("shoeColorList", shoeColorList);
		mav.addObject("brandList", brandList);
		
		return mav;
	}
	
	
	// 단일 상품 조회 페이지 이동 함수
		public ModelAndView lookupPage(int page, String merchanCode) {
			ModelAndView mav = new ModelAndView("shopSingle");
			String shoeCode = merchanCode.split("-")[0];	// merchanCode의 -기준 앞자리
			
			// 단일 객체
			MerchandiseVO vo = dao.selectMerchan(merchanCode);	// 해당 상품을 merchanCode를 이용해 객체를 들고 온다.
			
			// 다른 색상의 객체들
			HashMap<String, String> shoeCodeparam = new HashMap<String, String>();
			shoeCodeparam.put("shoeCode", shoeCode);	// shoeCode를 HashMap형태로 DAO로 전달해주기 위한 변수
			List<MerchandiseVO> shoeColorList = dao.shoeColors(shoeCodeparam);	// DB의 반환 값을  list에 담아준다.
			removeThis(merchanCode, shoeColorList);	// 해당 상품을 리스트에서 제거해주는 함수 (아래에 정의되어 있다)
			
			// 같은 브랜드의 다른 상품들
			HashMap<String, String> brandParam = new HashMap<String, String>();
			brandParam.put("brand", vo.getBrand());
			brandParam.put("category", vo.getCategory());
			List<MerchandiseVO> brandList = dao.recomendedList(brandParam);
			removeThis(merchanCode, brandList);
			Collections.shuffle(brandList);	// list를 섞어주는 기능을 담당한다.
			
			
			
			mav.addObject("shoes", vo);
			mav.addObject("shoeColorList", shoeColorList);
			mav.addObject("brandList", brandList);
			
			
			
//			<< 2020년 8월 13일 작업 >>
			// 페이징
			ReviewsParam vo2 = new ReviewsParam();
			vo2.setMerchanCode(merchanCode);			// 해당 상품 코드 저장
			
			// 총 페이지(후기)
			int allCount = boardDao.getCount2(vo2);
			int pageCount = allCount / perPage;													
			pageCount += allCount % perPage == 0 ? 0 : 1;
			
			// 작은 페이징(후기)
			int first = (page - 1) * perPage + 1;
			int last = first + perPage - 1;
			vo2.setStart(first);	// 시작 글 rownum
			vo2.setEnd(last);		// 마지막 글 rownum
			
			// 큰 페이징(후기)
			int section = (page - 1) / perPage;
			int begin = perPage * section + 1;	
			int end = begin + (perPage - 1) > pageCount ? pageCount : begin + (perPage - 1);
			
			// 페이지 변환 시 후기 번호
			int no = (page - 1) * perPage;	// st.count로 후기 번호를 붙일거임 -> 페이지가 넘어가면 st.count가 1로 초기화됨 -> 따라서 page가 증가할 때 마다 증가값(no)을 st.count에 더해줌 -> 이건 그걸 위한 변수
		
			
			System.out.println("shopsingle page - : " + page);
			
			
			// 뷰에 전달(후기)
			mav.addObject("list", boardDao.selectReviewAll(vo2));		// 상품 후기 목록 가져오기
			mav.addObject("allCount", allCount);	// 전체 레코드 개수
			mav.addObject("no", no);
			mav.addObject("begin", begin);
			mav.addObject("end", end);
			mav.addObject("page", page);			// 현재 페이지를 저장 (후기 번호를 매길때 활용)
			mav.addObject("perPage", perPage);		// 한 페이지 당 보여지는 개수
			mav.addObject("prev", section != 0);
			mav.addObject("next", allCount > perPage * end);
			mav.addObject("merchanCode", merchanCode);
			
			return mav;
		}
	
	// list내 해당 상품 제거하기
	public void removeThis(String merchanCode, List<MerchandiseVO> list) {
		for (int i = 0; i < list.size(); i++) {	// 현제 상품을 리스트에서 제거
			if(merchanCode.equals(list.get(i).getMerchanCode()))
				list.remove(i);
		}
	}
}
