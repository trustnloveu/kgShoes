package com.itbank.dao;

import java.util.HashMap;
import java.util.List;

import com.itbank.vo.MerchandiseVO;
import com.itbank.vo.ShoeSizeVO;


public interface ShoesDAO {

	// 개별 상품 조회 시 단일 상품 정보 return
	MerchandiseVO selectMerchan(String merchanCode);
	
	// 해당 상품의 사이즈별 재고 return
	List<ShoeSizeVO> getQuantity(String merchanCode);

	List<MerchandiseVO> shoeColors(HashMap<String, String> shoeCodeparam);

	List<MerchandiseVO> brandList(HashMap<String, String> brandParam);

	List<MerchandiseVO> recomendedList(HashMap<String, String> brandParam);   
	
	// 2020-08-06 추가 (조재일)
	Integer getSingleQuantity(HashMap<String, String> param);

}
