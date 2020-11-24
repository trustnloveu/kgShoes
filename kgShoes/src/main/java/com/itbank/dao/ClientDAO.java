package com.itbank.dao;

import java.util.List;

import com.itbank.vo.MerchandiseVO;

public interface ClientDAO {
	List<MerchandiseVO> recommendedHomeList();
}
