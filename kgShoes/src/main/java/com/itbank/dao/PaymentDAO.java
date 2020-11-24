package com.itbank.dao;

import java.util.HashMap;
import java.util.List;

import com.itbank.vo.CartVO;
import com.itbank.vo.CustomerVO;
import com.itbank.vo.OrderListVO;

public interface PaymentDAO {

	int addCart(CartVO cart);
	
//	2020.08.03 재고 확인
	int stockcheck(HashMap<String, String> report);
	
	// 2020-08-06 장바구니 목록 불러오기 (조재일)
	List<CartVO> selectCartList(HashMap<String, Integer> param);

	// 2020-08-06 추가 (조재일)
	int deleteCart(HashMap<String, String> param);
	
	//	2020.08.07 이름 가져오기
	String getName(String code);

//	2020.08.13
//	회원코드 불러오기
	int getcustomercode(String email);
	
//	회원 주문
	void memberP(OrderListVO vo);
	
//	비회원 주문
	void nonmemberP(OrderListVO vo);
	
//	결제 넘기기
	void payment(OrderListVO vo);
	
//  상품 판매 횟수 업데이트
	int updateSalesRate(OrderListVO vo);
		
//	회원 주문조회
	List<OrderListVO> memberorderlist(int customercode);
	
//	비회원 주문조회
	List<OrderListVO> notmemberorderlist(HashMap<String, String> map);

//	2020.08.19+
//	회원 총주문금액, 포인트 적립
	void updatePoint(CustomerVO cvo);

	void deleteMemberCart(int customerCode);
}

// 2020-07-31 추가된 DAO (조재일)