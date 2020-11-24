package com.itbank.dao;

import java.util.HashMap;
import java.util.List;

import com.itbank.vo.CustomerVO;
import com.itbank.vo.OrderListVO;

public interface CustomerDAO {

	CustomerVO login(CustomerVO vo);

	String emailcheck(String email);

	int insertCustomer(CustomerVO vo);

	String searchEmail(CustomerVO vo);
	
	String searchPw(CustomerVO vo);

	void updatePw(HashMap<String, String> map);
	
	CustomerVO checkPassword(CustomerVO vo);

	void updateC(CustomerVO vo);

//	2020.08.19
//	회원 주문 리스트
	List<OrderListVO> getOrderList(int customerCode);

	List<OrderListVO> getOrderList2(int customerCode);

	void deletecustomer(String email);
}
