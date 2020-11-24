package com.itbank.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.adminservice;
import com.itbank.vo.BrandVO;
import com.itbank.vo.CustomerRankVO;
import com.itbank.vo.ItemChangeVO;
import com.itbank.vo.MerchanRankVO;
import com.itbank.vo.ProductRegistVO;

@Controller
public class AdminController {
	
	@Autowired adminservice ads;
	
	// 상품입고를 수행하면 POST 방식으로 보내져서 url 창에 페이지번호가 나타나지 않음
	// 이 때문에 jsp 파일에서 페이지 버튼 Active 가 수행되지 않아서 전역변수로 생성함
	// jsp 파일에서 windown.onload 함수와 관련된 부분
	private int ChangedAfterPage;
	
	
	@RequestMapping(value = {"/adminPage/","/adminPage"})
	public void adminPage() {}

	// 상품입고 GET
	@RequestMapping(value = {"/putinto/","/putinto"})
	public ModelAndView putinto() {
		ModelAndView mav = new ModelAndView("putinto");
		List<BrandVO> brandList = ads.brandList();
		mav.addObject("brandList", brandList);
		return mav;
	}	
	
	// 상품입고 POST
	// 상품입력이 정사적으로 완료되면, '상품입력이 완료되었습니다'라는 창이 나타나도록 기능 구현(미구현) 
	@RequestMapping(value = {"/putinto/"}, method = RequestMethod.POST)
	public ModelAndView putform(MultipartHttpServletRequest request, ProductRegistVO prVO) {
		
		System.out.println("컨트롤러 진입은 되냐?");
		
		String merchan_code = request.getParameter("merchan_code");
//		String merchan_name = request.getParameter("merchan_name");
//		String shoe_size = request.getParameter("shoe_size");
//		String quantity = request.getParameter("quantity");
//		String price = request.getParameter("price");
//		String brand = request.getParameter("brand");
//		String category = request.getParameter("category");
		
		System.out.println("상품 코드 제대로 입력되었나 확인 : " + prVO.getMerchanCode() );
		System.out.println("비교군(파라미터 방식) : " + merchan_code);
		
		ModelAndView mav = new ModelAndView("adminPage");
		
		MultipartFile mpFile1 = request.getFile("merchanImage");
		MultipartFile mpFile2 = request.getFile("detailSrc");
		
		MultipartFile mpFile3 = null;
		// brand_icheck -> hidden 으로 숨겨져 있음
		if(!request.getParameter("brand_icheck").equals("off"))
			mpFile3 = request.getFile("brand_image");
	
		// 기본키 오류를 잡기 위해서 생성함
		String[] pkcheck = ads.merchanAllList();
		for (String pk:pkcheck) {
			if(pk.equals(prVO.getMerchanCode())) {
				mav.setViewName("redirect:/putinto/");
				return mav;
			}
		}
		
		
		
		try {
//			ads.joinform(merchan_code, merchan_name, price, brand, category, mpFile1, mpFile2);
//			ads.joinShoeSize(merchan_code, shoe_size, quantity);
			ads.merchandiseRegist(prVO, mpFile1, mpFile2);
			ads.joinBrand(prVO.getBrand(), mpFile3);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		return mav;
	}
	
	
	// 매출관리
	@RequestMapping("/salesmanage/")
	public ModelAndView salesmanage() {
		ModelAndView mav = new ModelAndView("salesmanage");
		
		// Calendar 객체 생성	
		Calendar time = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd");
		
		// 오늘 날짜 구하기
		String thisTime = format.format(time.getTime());
		System.out.println("지금 시간 : " + thisTime);
		
		
		// 7일 전 날짜 구하기
		time.add(time.DAY_OF_MONTH, -7);
		String prevTime7 = format.format(time.getTime());
		System.out.println("7일전 시간 : " + prevTime7);
		
		// 14일 전 날짜 구하기
		time.add(time.DAY_OF_MONTH, -7);
		String prevTime14 = format.format(time.getTime());
		System.out.println("14일전 시간 : " + prevTime14);
		
		// 21일 전 날짜 구하기
		time.add(time.DAY_OF_MONTH, -7);
		String prevTime21 = format.format(time.getTime());
		System.out.println("21일전 시간 : " + prevTime21);

		// 28일 전 날짜 구하기
		time.add(time.DAY_OF_MONTH, -7);
		String prevTime28 = format.format(time.getTime());
		System.out.println("28일전 시간 : " + prevTime28);
		
		// 35일 전 날짜 구하기
		time.add(time.DAY_OF_MONTH, -7);
		String prevTime35 = format.format(time.getTime());
		System.out.println("35일전 시간 : " + prevTime35);
		
		// 최근 5주간 판매내역 확인하는 차트
		String[] sqlInputDate = {thisTime, prevTime7, prevTime14, prevTime21, prevTime28, prevTime35};
		List<Integer> sqlResultData = new ArrayList<Integer>();
		for (int i = 0; i < sqlInputDate.length - 1; i++) {			
			sqlResultData.add(ads.salesManageChart(sqlInputDate[i], sqlInputDate[i + 1]));			
		}
		
		// 상품코드별 판매 순위
		List<MerchanRankVO> sqlMerchanRank = ads.SalesMerchanRank();		
		mav.addObject("sqlMerchanRank", sqlMerchanRank);
		mav.addObject("sqlMerchanRankSize", sqlMerchanRank.size());

		// 고객번호별 구매 순위
		List<CustomerRankVO> sqlCustomerRank = ads.SalesCustomerRank();
		mav.addObject("sqlCustomerRank", sqlCustomerRank);
		mav.addObject("sqlCustomerRankSize", sqlCustomerRank.size());
		
		// 이번달 첫째 날짜 구하기
		Calendar thisMonth = Calendar.getInstance();
		thisMonth.set(thisMonth.DAY_OF_MONTH, 1);
		String firstDayMonth = format.format(thisMonth.getTime());

		
		// 숫자 천다위 만드는 객체
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		String todaySaleDecimal = decimalFormat.format(ads.todaySale(thisTime));
		String thisMonthSaleDecimal = decimalFormat.format(ads.thisMonthSale(firstDayMonth));
		
		mav.addObject("sqlResultData",sqlResultData);
		mav.addObject("orderList", ads.orderList());
		mav.addObject("todaySale", todaySaleDecimal);
		mav.addObject("thisMonthSale", thisMonthSaleDecimal);		
		
		return mav;
	}	
	
	
	
	
	// 2020.08.07	
	// 맨 처음 페이지에 들어오는 경로 및 정렬 기능 수행했을 때 들어오는 경로
	@RequestMapping(value= {"/itemschange/","/itemschange" }, method = RequestMethod.GET )
	public ModelAndView itemschange(HttpServletRequest req,
			@RequestParam(value = "sortType", required = false) String sortType,
			@RequestParam(value = "filterType", required = false) String filterType) {
		ModelAndView mav = new ModelAndView("itemschange");
		
		System.out.println("sortType : " + sortType);
		System.out.println("filterType : " + filterType);
		System.out.println(filterType == null);	// null 이면 true다

		// 일반적으로 들어오는 페이지 경로는 접근하지 못함
		// 정렬기능을 수행할 때만 접근할 수 있음
		if (filterType != null) {
			// 2020.08.13 여기서부터 작업을 시작하시오
			// LIST 에 담긴 VO 객체를 정렬하는 기능
			List<ItemChangeVO> AllListVO = ads.sortList(sortType, filterType, null);
			mav.addObject("merchanList", AllListVO);
			mav.addObject("pageVO", ads.pageFilter(1, AllListVO.size()));
			
			// 2020.08.14
			// url 창에 페이지 번호가 없으면 '0'으로 전역변수 ChangedAfterPage 에 저장함
			mav.addObject("activePage", 1);
			this.ChangedAfterPage = 0;
			return mav;
		}
		
		List<ItemChangeVO> AllListVO = ads.AllList();		
		mav.addObject("merchanList", AllListVO);
		mav.addObject("pageVO", ads.pageFilter(1, AllListVO.size()));

		// 2020.08.14
		// url 창에 페이지 번호가 없으면 '0'으로 전역변수 ChangedAfterPage 에 저장함
		mav.addObject("activePage", 1);
		this.ChangedAfterPage = 0;
		
		return mav;
	}
	
	
	// 페이지를 전송했을 경우
	@RequestMapping(value= {"/itemschange/{page}","/itemschange/{page}/" }, method = RequestMethod.GET )
	public ModelAndView itemschange(HttpServletRequest req, @PathVariable int page) {
		ModelAndView mav = new ModelAndView("itemschange");
				
		List<ItemChangeVO> AllListVO = ads.ChangeAfterList();
		mav.addObject("merchanList", AllListVO);
		mav.addObject("pageVO", ads.pageFilter(page, AllListVO.size()));
		
		// 2020.08.14
		mav.addObject("activePage", page);
		this.ChangedAfterPage = 0;		
		
		return mav;
	}

	
	// 검색 기능
	// 2020.08.08
	public ModelAndView Search(ModelAndView mav, String searchtype, String searchWord) {
		// 검색 유형을 선택으로 했을 때, 바로 전체리스트 보여주는 기능
		if (searchtype.equals("select")) {
			mav.setViewName("redirect:/itemschange/");
			return mav;
		}
		
		// 검색 유형을 아무거나 선택하고, 빈칸으로 검색했을 때 '전체리스트'로 반환
		if (searchWord.equals("") || searchWord == null) {
			List<ItemChangeVO> AllListVO = new ArrayList<ItemChangeVO>();
			mav.addObject("merchanList", AllListVO);
			mav.addObject("pageVO", ads.pageFilter(1, AllListVO.size()));
			
			// 2020.08.14
			mav.addObject("activePage", 1);
						
			return mav;
		}
		
		List<ItemChangeVO> AllListVO = ads.Search(searchtype, searchWord);
		mav.addObject("merchanList", AllListVO);
		mav.addObject("pageVO", ads.pageFilter(1, AllListVO.size()));
		
		// 2020.08.14
		mav.addObject("activePage", 1);		
		
		return mav;
	}
	
	
	// 상품입고 기능
	// 2020.08.11
	public ModelAndView ItemChanging(ModelAndView mav, String itemmerchancode, String itemamount, String itemdiscrate, String itemprice, int prevPage) {

		
		// itemschange.jsp 에서 활성화된 수정폼의 개수만큼 merchancodeSplit 배열이 만들어진다
		String[] merchancodeSplit = itemmerchancode.split(",");
					
		// merchancode 의 경우에는 null 값이 없을 수가 없지만
		// 상품재고, 할인율, 가격 쪽은 빈공간이 넘어올 수 있다
		// 때문에 split 하여 배열로 만들어도 길이가 merchancodeSplit 보다 같거나 작을 수도 있다
		// 이 경우 sql 문을 돌릴 때에 문제가 발생할 수 있으므로 merchancodeSplit 길이와 동일하게 맞추어야 한다
		// 빈칸일 경우에는 '-1'을 넣었다 -> sql 문에서 조건식을 사용하고자 and '0'도 입력할 수 있으니 '-1'로 설정함
		
		List<String> itemamountSplit = new ArrayList<String>();
		String[] split1 =  itemamount.split(",");
		for(int i = 0; i < merchancodeSplit.length; i++) {
			if (i < split1.length) {
				if(split1[i].equals("")) 
					itemamountSplit.add(i, "-1");
				
				else 
					itemamountSplit.add(i, split1[i]);						
			}
			else {
				itemamountSplit.add(i ,"-1");
			}
		}
		
		
		List<String> itemdiscrateSplit = new ArrayList<String>();
		String[] split2 = itemdiscrate.split(",");
		for(int i = 0; i < merchancodeSplit.length; i++) {
			if (i < split2.length) {
				
				if (split2[i].equals(""))
					itemdiscrateSplit.add(i, "-1");
				
				else
					itemdiscrateSplit.add(i, split2[i]);
			}
			else 
				itemdiscrateSplit.add(i, "-1");
			
		}
		
		
		List<String> itempriceSplit = new ArrayList<String>();
		String[] split3 = itemprice.split(",");
		for(int i = 0; i < merchancodeSplit.length; i++) {
			if (i < split3.length) {
				
				if (split3[i].equals(""))
					itempriceSplit.add(i, "-1");
				else
					itempriceSplit.add(i, split3[i]);
			}
			else
				itempriceSplit.add(i, "-1");
			
		}


		// 상품재고, 할인율, 가격의 길이를 상품코드와 동일하게 맞췄으면
		// 상품코드의 길이와 똑같은 숫자만큼 반복문을 돌려서 DB 를 업데이트한다
		
		for (int i = 0; i < merchancodeSplit.length; i++) {

			if(!(itemamountSplit.get(i).equals("") && itemdiscrateSplit.get(i).equals("") && itempriceSplit.get(i).equals(""))) {
				ads.ItemsChange(itemamountSplit.get(i), itemdiscrateSplit.get(i), itempriceSplit.get(i), merchancodeSplit[i]);
			}			
		}
		
		List<ItemChangeVO> ChangeAfterList = ads.ChangeAfterList();
		mav.addObject("merchanList", ChangeAfterList);
		mav.addObject("pageVO", ads.pageFilter(prevPage, ChangeAfterList.size()));
		
		// 2020.08.14
		mav.addObject("activePage",prevPage);
		this.ChangedAfterPage = prevPage;
		
		return mav;
	}
	
	
	// 2020.08.07
	// 검색 및 상품입고 (POST)
		@RequestMapping(value = "/itemschange/", method = RequestMethod.POST)
		public ModelAndView itemschanged(
				@RequestParam(value = "searchtype", required = false) String searchtype, 
				@RequestParam(value = "searchWord", required = false) String searchWord,
				@RequestParam(value = "itemamount", required = false) String itemamount,
				@RequestParam(value = "itemdiscrate", required = false) String itemdiscrate,
				@RequestParam(value = "itemprice", required = false) String itemprice,
				@RequestParam(value = "itemmerchancode", required = false) String itemmerchancode,
				HttpServletRequest request) {
			

			ModelAndView mav = new ModelAndView("itemschange");	
			

			boolean conditionA = (searchtype == null || searchWord == null);
		 
			
			// 관리자 검색 기능을 수행하기 위한 조건문
			if (searchtype != null) {		
				Search(mav, searchtype, searchWord);
				return mav;
			}
						
			
			// 관리자 상품 입고를 수행하기 위한 조건문
			// 보낸 문자열 파라미터를 배열에 담아서 배열의 길이만큼 반복문으로 돌리자
			if (conditionA && (!itemamount.equals("") || !itemdiscrate.equals("") || !itemprice.equals(""))  ) {

				String referer = (String)request.getHeader("REFERER");
				int sliceNum = referer.lastIndexOf('/') + 1;
				System.out.println("referer : " + referer);
				System.out.println("sliceNum : " + sliceNum);
				System.out.println("refererLength : " + referer.length());
				if (referer.length() < sliceNum) {
					System.out.println("slicedPage : " + referer.substring(sliceNum,  sliceNum + 1));
				}
				
				int prevPage = 1;
		
				// referer.length() >= sliceNum
				// 맨 처음 페이지에 들어왔을 때, 상품입고가 완료되고 난 이후
				
				// 정렬기능을 수행
				if (referer.length() > sliceNum) {
					if (!referer.substring(sliceNum, sliceNum + 1).equals("?")) {
						System.out.println("prevPage : " + 	Integer.parseInt(referer.substring(sliceNum)));
						if(!referer.substring(sliceNum).equals("") && this.ChangedAfterPage == 0)
							prevPage = Integer.parseInt(referer.substring(sliceNum));
						else if(this.ChangedAfterPage != 0)
							prevPage = this.ChangedAfterPage;
					}
					else
						prevPage = ads.ChangeAfterPage();
				}
				
				
				if(referer.substring(referer.lastIndexOf('/')).equals(""))
					prevPage = 1;
				
				
				return ItemChanging(mav, itemmerchancode, itemamount, itemdiscrate, itemprice, prevPage);
			}
			else {
				
				List<ItemChangeVO> AllListVO = ads.AllList();
				mav.addObject("merchanList", AllListVO);
				mav.addObject("pageVO", ads.pageFilter(1, AllListVO.size()));
				
				// 2020.08.14
				mav.addObject("activePage", 1);
				
			}
			
			return mav;
		}
		
}
