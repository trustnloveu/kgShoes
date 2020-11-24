package com.itbank.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.PaymentService;
import com.itbank.vo.OrderListVO;

//2020.08.03 결제

@RestController
public class PaymentController {
	@Autowired PaymentService ps;
	
//	2020.08.03
//	2020.08.06
	@RequestMapping(value="payment/", method = RequestMethod.POST)
	public ModelAndView stockcheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		System.out.println("==="+code+"==="+ammount+"==="+size+"===");
		return ps.stockcheck(request, response);
	}
	
//	2020.08.13
//	결제 넘기기
	@RequestMapping(value="paycomplete/", method = RequestMethod.POST)
	public ModelAndView paymentComplete(HttpServletRequest request,OrderListVO vo, HttpServletResponse response) {
		return ps.paymentComplete(request, vo, response);
	}
	
//	2020.08.13
//	장바구니 상품 결제창으로 넘기기
	@RequestMapping(value="cartPayment/", method=RequestMethod.POST)
	public ModelAndView cartPay(HttpServletRequest request) {
		return ps.cartPayment(request);
	}
	
//	2020.08.13
//	회원주문조회
	@RequestMapping(value="memberOrderLookup/")
	public ModelAndView memberOrderLookup(HttpServletRequest request) {
		return ps.memberOrderLookup(request);
	}
	
//	2020.08.13
//	비회원주문조회
	@RequestMapping(value="memberOrderLookup/", method = RequestMethod.POST)
	public ModelAndView notmemberOrderLookup(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return ps.notmemberOrderLookup(request, response);
	}
}
