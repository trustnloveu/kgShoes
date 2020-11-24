package com.itbank.service;


import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.MerchandiseDAO;
import com.itbank.vo.BrandVO;
import com.itbank.vo.FsParam;


@Service
public class MerchandiseService {

	@Autowired private MerchandiseDAO dao;
	private final String filePath = "/upload/";

	private final int perPage = 6;	// 한 페이지 당 보여지는 목록 갯수
	private FsParam fp;						// sql문에 변수로 쓰기위한 paramVO 선언
	private String brand;			// 넘겨받은 파라미터를 조건에 따라 저장하기 위한 변수 선언
	private String category;
	//private String price2;
	private String sort;
	private String sort2;			// home.jsp의 <span class="filter_Result">에 들어갈 변수
	private int firstPrice = 0;
	private int lastPrice = 0;
	private boolean flag = false;	// 필터 클릭 후 정렬이 나오게 하기위한 boolean변수 (초기값을 false로 줘서 정렬을 숨긴다)

	public void uploadMerchandise(HashMap<String, String> map) {
		dao.registMerchandise(map);
	}

	public ModelAndView listAll(int page, HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("shop");
		
		// 필터 및 정렬 처리
		fp = new FsParam();
		String br = req.getParameter("brand");
		String ca = req.getParameter("category");
		String pr2 = req.getParameter("price");
		String so = req.getParameter("sort");
		
		// 필터를 클릭하면 flag값을 true로 준다
		if(br != null || ca != null || pr2 != null || so != null) {
			flag = true;
		}
		
		// 브랜드 필터 중 하나를 클릭하면
		if(br != null) { 
			brand = br;		// brand에 br의 값을 저장
			if(category != null || sort != null) {	// 만약 브랜드 이외의 값이 각 변수들에 저장되어 있다면 null처리 (브랜드에 대한 필터만 적용될 수 있게)
				category = null;
				
				sort = null;
			}
		}
		else { brand = brand; }	// 페이지 이동 시, 저장되어 있는 brand값을 그대로 사용(br이 null이기 때문) -> 해당 brand내에서 페이징을 하기 위해서
		
		if(ca != null) {
			category = ca;
			if(brand != null || sort != null) {
				brand = null;
				
				sort = null;
			}
		}
		else { category = category; }
		
				
		if(so != null) {
			sort = so;
		}
		
		if(sort != null) {	// home.jsp의 <span class="filter_Result">에 들어갈 값 지정
			switch (sort) {
				case "registDate":		sort2 = "최신 상품";		break;
				case "merchanName":	sort2 = "상품 이름 순";		break;
				case "priceAsc":	sort2 = "가격 낮은 순";		break;
				case "priceDesc":	sort2 = "가격 높은 순";		break;
			}			
		}
		else {	// 정렬이 클릭이 안됬으면 sort2값을 비운다
			sort2 = null;
		}
		
		
		
		//8.4Bong
		int allQuantity = dao.getQuantityAll();
		int leatherQuantity = dao.getQuantityByCategory("Leather");
		int runningQuantity = dao.getQuantityByCategory("Running");
		int lifestyleQuantity = dao.getQuantityByCategory("Life Style");
		int etcQuantity = dao.getQuantityByCategory("ETC");
		
				
		mav.addObject("allQuantity",allQuantity);
		mav.addObject("leatherQuantity",leatherQuantity);
		mav.addObject("runningQuantity",runningQuantity);
		mav.addObject("lifestyleQuantity",lifestyleQuantity);
		mav.addObject("etcQuantity",etcQuantity);
		
		
		
		
		
		// 각 각의 변수 값을 FsParam에 저장
		fp.setBrand(brand);
		fp.setCategory(category);
		fp.setFirstPrice(firstPrice);
		fp.setLastPrice(lastPrice);
		fp.setSort(sort);

		// 해당 param에 대한 페이지 갯수
		int allCount = dao.getCount(fp);	// 해당 param을 dao로 넘겨준다
		
		// 총 페이지 ÷ 페이지 당 목록 갯수  
		int pageCount = allCount / perPage;
		
		// perPage가 allCount보다 작거나 같으면 pageCount에 0을 더하고
		// 아니라면 1씩 더해라(perPage가 all를 초과하면 페이지를 생성)
		pageCount += allCount % perPage == 0 ? 0 : 1;

		// 작은 페이징
		int first = (page - 1) * perPage + 1;
		int last = first + perPage - 1;

		fp.setStart(first);	// 시작 rownum
		fp.setEnd(last);	// 마지막 rownum
		
		// 큰 페이징 (페이지의 화살표)
		int section = (page - 1) / perPage;		// 페이징 구역
		int begin = perPage * section + 1;
		int end = begin + perPage - 1 > pageCount ? pageCount : begin + perPage - 1;
		
		mav.addObject("list", dao.selectMerchandiseAll(fp));
		mav.addObject("begin", begin);	// 페이징에 표시할 시작 페이지
		mav.addObject("end", end);		// 페이징에 표시할 마지막 페이지
		mav.addObject("prev", section != 0);				// 이전 화살표
		mav.addObject("next", allCount > perPage * end);	// 다음 화살표
		mav.addObject("flag", flag);
		mav.addObject("brand", brand);
		mav.addObject("category", category);
		
		mav.addObject("sort2", sort2);
		mav.addObject("page", page);
		
		
		/*8.6,8.7 brand Bong*/
		mav.addObject("brandAtoC", dao.selectAtoC());
		mav.addObject("brandDtoF", dao.selectDtoF());
		mav.addObject("brandGtoI", dao.selectGtoI());
		mav.addObject("brandJtoL", dao.selectJtoL());
		mav.addObject("brandMtoO", dao.selectMtoO());
		mav.addObject("brandPtoR", dao.selectPtoR());
		mav.addObject("brandStoU", dao.selectStoU());
		mav.addObject("brandVtoZ", dao.selectVtoZ());
		
		// 8.13 추천 브랜드 Bong
		
		// 랜덤으로 셔플
		List<BrandVO> recommendedBrand = dao.recommendedBrand();
		Collections.shuffle(recommendedBrand);
		mav.addObject("recommendedBrand", recommendedBrand);
		
		return mav;
	}

	public ModelAndView filterReset(int page) {
		
		ModelAndView mav = new ModelAndView("shop");
		fp = new FsParam();
		
		// 모든 정렬, 필터, boolean값 초기화
		brand = null;
		category = null;
		
		sort = null;
		flag = false;
		
		// 총 페이지 갯수
		int allCount = dao.getCount(fp);
		
		// 총 페이지 ÷ 페이지 당 목록 갯수  
		int pageCount = allCount / perPage;
		
		// perPage가 allCount보다 작거나 같으면 pageCount에 0을 더하고
		// 아니라면 1씩 더해라(perPage가 all를 초과하면 페이지를 생성)
		pageCount += allCount % perPage == 0 ? 0 : 1;

		// 페이징
		int first = (page - 1) * perPage + 1;
		int last = first + perPage - 1;

		fp.setStart(first);
		fp.setEnd(last);
		
		int section = (page - 1) / perPage;
		int begin = perPage * section + 1;
		int end = begin + perPage - 1 > pageCount ? pageCount : begin + perPage - 1;
		
		mav.addObject("list", dao.selectMerchandiseAll(fp));
		mav.addObject("allCount", allCount);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("perPage", perPage);
		mav.addObject("prev", section != 0);				
		mav.addObject("next", allCount > perPage * end);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("flag", flag);
		mav.addObject("page", page);
				
		return mav;
	}

	public int updateGood(HashMap<String, String> jsonData) {
		return dao.updateGood(jsonData);
	}

	

	
}


