package com.itbank.dao;


import java.util.List;
import java.util.Map;

import com.itbank.vo.BrandVO;
import com.itbank.vo.CustomerRankVO;
import com.itbank.vo.ItemChangeVO;
import com.itbank.vo.MerchanRankVO;
import com.itbank.vo.OrderListVO;
import com.itbank.vo.SizeQuantityVO;
import com.itbank.vo.putintoVO;

public interface adminDAO {

	int admininsert(putintoVO putintoVO);

	List<ItemChangeVO> AllList();

	List<ItemChangeVO> MerchanSearch(Map<String, String> searchMap);
	
	List<ItemChangeVO> MerchanSearchNum(Map<String, String> searchMap);

	int ItemChange(ItemChangeVO itemChangeVO);

	int salesManageChart(Map<String, String> salesDate);

	List<OrderListVO> orderList();

	int todaySale(String thisTime);

	int thisMonthSale(String firstDayMonth);

	List<MerchanRankVO> SalesMerchanRank();

	List<CustomerRankVO> SalesCustomerRank();

	String[] merchanAllList();

	int joinShoeSize(SizeQuantityVO vo);

	int joinBrand(Map<String, String> brandMap);

	List<BrandVO> brandList();

	int merchanChange(ItemChangeVO itemChangeVO);

	void shoesSizeChange(ItemChangeVO itemChangeVO);


}
