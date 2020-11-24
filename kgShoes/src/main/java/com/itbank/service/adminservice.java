package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import com.itbank.dao.adminDAO;
import com.itbank.vo.BrandVO;
import com.itbank.vo.CustomerRankVO;
import com.itbank.vo.ItemChangeVO;
import com.itbank.vo.MerchanRankVO;

import com.itbank.vo.OrderListVO;
import com.itbank.vo.PageVO;
import com.itbank.vo.ProductRegistVO;
import com.itbank.vo.SizeQuantityVO;
import com.itbank.vo.putintoVO;

@Service
public class adminservice {
	@Autowired adminDAO dao;
	
	private final String filePath = "D:\\shoes\\";
	private int setpage;
	private List<ItemChangeVO> setmerchanlsit;
	private String setsearchtype;
	private String setsearchWord;
	private String setsortType;
	private String setfilterType;
	
	// 기본키 검사를 위해서 
	// 2020.08.13
	public String[] merchanAllList() {
		return dao.merchanAllList();
	}
	
	// 브랜드 리스트를 상품등록 란으로 보내기 위함
	// 2020.08.14
	public List<BrandVO> brandList() {
		return dao.brandList();
	}
	
	
	// Bong 상품 등록
	@Transactional
	public int merchandiseRegist(ProductRegistVO prVO, MultipartFile mpFile1, MultipartFile mpFile2) throws IllegalStateException, IOException{
		System.out.println("상품 등록 Bong : " + prVO.getMerchanCode());
		joinForm(prVO.getMerchanCode(),prVO.getMerchanName(), prVO.getPrice(), prVO.getBrand(),prVO.getCategory(),mpFile1,mpFile2);
		insertShoeSize(prVO.getMerchanCode(),prVO.getQuantity250(),prVO.getQuantity260(),prVO.getQuantity270(),prVO.getQuantity280(),prVO.getQuantity290(),prVO.getQuantity300());
		return 0;
		
	}

	// Bong shoesize DB 등록을 위한 메소드 
	private int insertShoeSize(String merchanCode ,int quantity250, int quantity260, int quantity270, int quantity280, int quantity290,
			int quantity300) {
		System.out.println("shoeSize DB 저장 : " + merchanCode);
		
		 SizeQuantityVO vo = new SizeQuantityVO();
		 vo.setMerchanCode(merchanCode);
		 vo.setQuantity250(quantity250);
		 vo.setQuantity260(quantity260);
		 vo.setQuantity270(quantity270);
		 vo.setQuantity280(quantity280);
		 vo.setQuantity290(quantity290);
		 vo.setQuantity300(quantity300);
		 
		return dao.joinShoeSize(vo);
	}

	// 상품 등록 (=brand DB)
	// 2020.08.14
	public int joinBrand(String brand, MultipartFile mpFile3) throws IllegalStateException, IOException {
		
		Map<String, String> brandMap = new HashMap<String, String>();
		brandMap.put("name", brand);
		
		// 브랜드 이미지
		if(mpFile3 != null) {
			String originalFileName = mpFile3.getOriginalFilename();
			String extName = ".JPG"; // jpg, png
			System.out.println("extName : " + extName);
			String storedFileName = brand + extName;
			System.out.println("storedFileName2 : " + storedFileName);
			File file = new File(storedFileName);
			mpFile3.transferTo(file);
			System.out.println("detail_src : " + storedFileName);
			
			// map 저장
			brandMap.put("uri", storedFileName);
		}
		else {
			brandMap.put("uri", "");
		}
		return dao.joinBrand(brandMap);
	}
	

	
	
	// 상품 등록 (=shoesize DB)
//	public int joinShoeSize(String merchan_code, String shoe_size, String quantity) {
//		Map<String, String> shoeSizeMap = new HashMap<String, String>();
//		shoeSizeMap.put("merchan_code", merchan_code);
//		shoeSizeMap.put("shoe_size", shoe_size);
//		shoeSizeMap.put("quantity", quantity);
//		return dao.joinShoeSize(shoeSizeMap);
//	}
	
	// 상품 등록 (=merchandise DB)
	public int joinForm(String merchan_code, String merchan_name, int price, String brand, String category, MultipartFile mpFile1, MultipartFile mpFile2) throws IllegalStateException, IOException{
		System.out.println("merchandise DB 저장 : " + merchan_code);
		// vo 저장
		putintoVO putintoVO = new putintoVO();
		
		putintoVO.setBrand(brand);
		// Bong 09.01 putIntoVO price int로 변경
		putintoVO.setPrice(price);
		putintoVO.setCategory(category);
		putintoVO.setMerchanName(merchan_name);
		putintoVO.setMerchanCode(merchan_code);
		
		//  상품 메인 사진
		if(mpFile1.getOriginalFilename() != null && !mpFile1.getOriginalFilename().equals("")) {
			String originalFileName1 = mpFile1.getOriginalFilename();
			String extName1 =  ".JPG"; // jpg, png
			System.out.println("extName1 : " + extName1);
			String storedFileName1 = merchan_code + extName1;
			System.out.println("storedFileName1 : " + storedFileName1);
			File file1 = new File(filePath + storedFileName1);
			mpFile1.transferTo(file1);
			System.out.println("img_src : " + filePath + storedFileName1);

			// vo 저장
			putintoVO.setImgSrc(filePath + storedFileName1);
		}
		else {
			putintoVO.setImgSrc("");
		}
		
		//  상품 구체적인 내용 사진
		if(mpFile2.getOriginalFilename() != null  && !mpFile2.getOriginalFilename().equals("")) {
			String originalFileName2 = mpFile2.getOriginalFilename();
			String extName2 = ".JPG"; // jpg, png
			System.out.println("extName2 : " + extName2);
			String storedFileName2 = "!" + merchan_code + extName2;
			System.out.println("storedFileName2 : " + storedFileName2);
			File file2 = new File(filePath + storedFileName2);
			mpFile2.transferTo(file2);
			System.out.println("detail_src : " + filePath + storedFileName2);
			
			// vo 저장
			putintoVO.setDetailSrc(filePath + storedFileName2);
		}
		else {
			putintoVO.setDetailSrc("");
		}

				
		return dao.admininsert(putintoVO);
	}

	
	// 상품입고 - 전체 상품 리스트 들고오기
	public List<ItemChangeVO> AllList() {
		this.setsearchWord = null;
		this.setsearchtype = null;
		this.setfilterType = null;
		this.setsortType = null;
		this.setmerchanlsit = dao.AllList();		
		
		return this.setmerchanlsit ;
	}

	// 상품입고 - 상품 변경후 리스트
	public List<ItemChangeVO> ChangeAfterList() {
		
		// 검색한 결과가 있을 때, 검색한 결과에서 변경사항이 반영된 리스트 출력함
		if (this.setsearchtype != null && this.setsearchWord != null) {
			List<ItemChangeVO> changeAferList = Search(this.setsearchtype, this.setsearchWord);
			if(this.setfilterType != null && this.setsortType != null) {
				return sortList(this.setsortType, this.setfilterType, changeAferList);
			}
			return changeAferList;
		}
		
		// 정렬기능을 수행했을 때, 정렬기능을 수행한 결과에서 변경사항이 반영된 리스트 출력함
		else if (this.setfilterType != null && this.setsortType != null) {
			return sortList(this.setsortType, this.setfilterType, AllList());
		}
		
		return AllList();
	}
	
	// 상품입고 - 변경이 이루어진 페이지 번호를 반환함
	public int ChangeAfterPage() {		
		return this.setpage;
	}
	
	// 상품입고 - 검색기능 수행
	public List<ItemChangeVO> Search(String searchtype, String searchWord) {
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchtype", searchtype);
		searchMap.put("searchWord", searchWord);
		this.setsearchtype = searchtype;
		this.setsearchWord = searchWord;
		
		// 문자열로 검색하는 경우와 숫자로 검색하는 경우 분리함
		if(searchtype.equals("merchan_code") || searchtype.equals("merchan_name"))
			this.setmerchanlsit = dao.MerchanSearch(searchMap);			
		else 
			this.setmerchanlsit = dao.MerchanSearchNum(searchMap);
		
		return this.setmerchanlsit;
	}

	// 상품입고 - 페이징 수행
	public PageVO pageFilter(int page, int merchanListSize) {
		PageVO pagevo = new PageVO();
		int perPage = pagevo.getPerPage();
		int endpage = (merchanListSize / perPage) + 1;
		
		if((merchanListSize % perPage) == 0)
			endpage = (merchanListSize / perPage);
	
		pagevo.setListStart((page - 1) * perPage);
		pagevo.setListEnd((page * perPage) - 1);
		
		if(page < 4) {
			System.out.println("333333333");
			pagevo.setPageStart(1);
			if (endpage > 5 )
				pagevo.setPageEnd(5);
			else
				pagevo.setPageEnd(endpage);
		}
		
		else if(page >= 4 && (page + 2 <= endpage)) {
			pagevo.setPageStart(page - 2);
			pagevo.setPageEnd(page + 2);
		}
		
		else if(page >= 4 && (page + 2 > endpage)) {
			pagevo.setPageStart(endpage - 4);
			pagevo.setPageEnd(endpage);
		}
		
		this.setpage = page;
		
		return pagevo;
	}

	// 상품입고 - SQL 삽입
	public int ItemsChange(String itemamount, String itemdiscrate, String itemprice, String itemmerchancode) {

		ItemChangeVO itemChangeVO = new ItemChangeVO();
		
		itemChangeVO.setAmount(Integer.parseInt(itemamount));
		itemChangeVO.setDiscrate(Integer.parseInt(itemdiscrate));
		itemChangeVO.setPrice(Integer.parseInt(itemprice));
		itemChangeVO.setMerchanCode(itemmerchancode);
		
		if (itemChangeVO.getDiscrate() != -1 && itemChangeVO.getPrice() != -1) {
			dao.merchanChange(itemChangeVO);
		}
		dao.shoesSizeChange(itemChangeVO);
		
		return dao.ItemChange(itemChangeVO);
	}

	
	// 2020.08.12
	// 매출관리 - 챠트그리기
	public int salesManageChart(String afterTime, String beforeTime) {
		
		
		Map<String, String> salesDate = new HashMap<String, String>();
		
		salesDate.put("afterTime", afterTime);
		salesDate.put("beforeTime", beforeTime);
		
		int chart = 0;
		try {
			chart = dao.salesManageChart(salesDate);
		} catch (BindingException e) {
			chart = 0;
		}
		
		return chart;	
	}

	// 매출관리 - 매출내역
	public List<OrderListVO> orderList() {
		return dao.orderList();
	}

	// 매출관리 - 오늘 판매금액
	public int todaySale(String thisTime) {
		
		int todaySale = 0;
		try {
			todaySale = dao.todaySale(thisTime);			
		} catch (BindingException e) {
			todaySale = 0;
		}
		
		return todaySale;
	}
	
	// 매출관리 - 이번달 판매금액
	public int thisMonthSale(String firstDayMonth) {
		int thisMonthSale = 0;
		
		try {
			thisMonthSale = dao.thisMonthSale(firstDayMonth);
		} catch (Exception e) {
			thisMonthSale = 0;
		}
		
		return thisMonthSale;
	}
	
	
	
	// 2020.08.13
	// LIST 에 담긴 VO 객체를 정렬하는 기능
	public List<ItemChangeVO> sortList(String sortType, String filterType, List<ItemChangeVO> changeAfterList) {
		
		// 상품입고 후에도 정렬기능이 수행되도록 하려고 생성함
		this.setsortType = sortType;
		this.setfilterType = filterType;
		
		if(changeAfterList != null) {
			this.setmerchanlsit = changeAfterList;
		}
		
		switch (filterType) {
		case "amount":
			if(sortType.equals("asc")) {
				Collections.sort(this.setmerchanlsit, new AmountASC());
				for(ItemChangeVO item : this.setmerchanlsit) {
					System.out.println("amountASC : " + item.getAmount());
				}
			}				
			else {
				Collections.sort(this.setmerchanlsit, new AmountDESC());
				for(ItemChangeVO item : this.setmerchanlsit) {
					System.out.println("amountDESC : " + item.getAmount());
				}
			}
			break;
		case "discrate":
			if(sortType.equals("asc")) {
				Collections.sort(this.setmerchanlsit, new DiscrateASC());
				for(ItemChangeVO item : this.setmerchanlsit) {
					System.out.println("discrateASC : " + item.getDiscrate());
				}
			}				
			else {
				Collections.sort(this.setmerchanlsit, new DiscrateDESC());
				for(ItemChangeVO item : this.setmerchanlsit) {
					System.out.println("discrateDESC : " + item.getDiscrate());
				}
			}
			break;
		case "price":
			if(sortType.equals("asc")) {
				Collections.sort(this.setmerchanlsit, new PriceASC());
				for(ItemChangeVO item : this.setmerchanlsit) {
					System.out.println("PriceASC : " + item.getPrice());
				}
			}				
			else {
				Collections.sort(this.setmerchanlsit, new PriceDESC());
				for(ItemChangeVO item : this.setmerchanlsit) {
					System.out.println("priceDESC : " + item.getPrice());
				}
			}
			break;

		default:
			break;
		}
		
		List<ItemChangeVO> sortAfterList = this.setmerchanlsit;
		return sortAfterList;
	}
	
	// 2020.08.14
	// 정렬기능 수행
	
	// 재고갯수 오름차순
	static class AmountASC implements Comparator<ItemChangeVO> {
		@Override
		public int compare(ItemChangeVO o1, ItemChangeVO o2) {
			return o1.getAmount() < o2.getAmount() ? -1 : o1.getAmount() > o2.getAmount() ? 1:0;
		}		
	}
	// 재고갯수 내림차순
	static class AmountDESC implements Comparator<ItemChangeVO> {
		@Override
		public int compare(ItemChangeVO o1, ItemChangeVO o2) {
			return o1.getAmount() > o2.getAmount() ? -1 : o1.getAmount() < o2.getAmount() ? 1:0;
		}		
	}
	// 할인율 오름차순
	static class DiscrateASC implements Comparator<ItemChangeVO> {
		@Override
		public int compare(ItemChangeVO o1, ItemChangeVO o2) {
			return o1.getDiscrate() < o2.getDiscrate() ? -1 : o1.getDiscrate() > o2.getDiscrate() ? 1:0;
		}		
	}
	// 할인율 내림차순
	static class DiscrateDESC implements Comparator<ItemChangeVO> {
		@Override
		public int compare(ItemChangeVO o1, ItemChangeVO o2) {
			return o1.getDiscrate() > o2.getDiscrate() ? -1 : o1.getDiscrate() < o2.getDiscrate() ? 1:0;
		}		
	}
	// 가격 오름차순
	static class PriceASC implements Comparator<ItemChangeVO> {
		@Override
		public int compare(ItemChangeVO o1, ItemChangeVO o2) {
			return o1.getPrice() < o2.getPrice() ? -1 : o1.getPrice() > o2.getPrice() ? 1:0;
		}		
	}
	// 가격 내림차순
	static class PriceDESC implements Comparator<ItemChangeVO> {
		@Override
		public int compare(ItemChangeVO o1, ItemChangeVO o2) {
			return o1.getPrice() > o2.getPrice() ? -1 : o1.getPrice() < o2.getPrice() ? 1:0;
		}		
	}
	
	// 2020.08.14
	// 상품코드별 판매순위
	public List<MerchanRankVO> SalesMerchanRank() {
		return dao.SalesMerchanRank();
	}

	// 2020.08.14
	// 고객코드별 구매순위
	public List<CustomerRankVO> SalesCustomerRank() {
		return dao.SalesCustomerRank();
	}

	

	// 2020.08.14
	// putinto page 기본키검사
	/*
	 * public List<onecodeVO> pkList() { return dao.pkList(); }
	 */

}

