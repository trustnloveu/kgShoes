package com.itbank.dao;

import java.util.HashMap;
import java.util.List;

import com.itbank.vo.BrandVO;
import com.itbank.vo.FsParam;
import com.itbank.vo.MerchandiseVO;


public interface MerchandiseDAO {

	List<MerchandiseVO> selectMerchandiseAll(FsParam fp);

	void registMerchandise(HashMap<String, String> map);

	int getCount(FsParam fp);

	int updateGood(HashMap<String, String> jsonData);

	int getQuantityByCategory(String category);

	int getQuantityAll();

	List<String> selectBrand();

	List<String> selectAtoC();

	List<String> selectDtoF();

	List<String> selectGtoI();

	List<String> selectJtoL();

	List<String> selectMtoO();

	List<String> selectPtoR();

	List<String> selectStoU();

	List<String> selectVtoZ();

	List<BrandVO> recommendedBrand();

}
