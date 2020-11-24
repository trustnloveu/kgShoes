package com.itbank.controller;


import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.CustomerService;
import com.itbank.vo.CustomerVO;

					// @responseBody : 반환하는 값이 그대로 응답으로 전달되는 것
@RestController		// @ResponseBody를 기본적으로 처리하는 컨트롤러
					// 담당 : 김정미
public class CustomerController {
	
	@Autowired private CustomerService cs;
	
	@RequestMapping(value="checkEmail/", produces="application/text;charset=utf8")
	public String idcheck(HttpServletRequest request) {
		return cs.emailcheck(request);
	}
	
	@GetMapping(value="loginForm/")	// 7.22 bong
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("loginForm");
		return mav;
	}
	
	
	@PostMapping(value="loginForm/")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		return cs.login(request, response);
	}
	
	@RequestMapping("logout/")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/");
//		session.invalidate(); 	// invalidate : session안에 저장 된 모든 값 제거
		System.out.println("logout operate");
		session.removeAttribute("login");
		return mav;
	}
	
	
//	@PostMapping(value="joinForm/")
//	public ModelAndView join(CustomerVO vo) throws NoSuchAlgorithmException {
//		return cs.join(vo);
//	}
	
	
	
	@RequestMapping("joinForm/")	// join 페이지로 이동할 때
	public ModelAndView join() throws IOException {
		return cs.join();
	}
	
	@PostMapping(value="joinForm/")
	public ModelAndView join(CustomerVO vo, HttpServletRequest request) throws NoSuchAlgorithmException {
		return cs.join(request,vo);
	}
	
	@RequestMapping(value="helpEmail/{name}/{phone}/")
	public String helpEmail(HttpServletResponse response, @PathVariable("name") String name, @PathVariable("phone") String phone) throws IOException {
		CustomerVO vo = new CustomerVO();
		vo.setName(name);
		vo.setPhone(phone);
		return cs.helpEmail(vo, response);
	}
	
	@RequestMapping(value = "helpPw/{name}/{email}/{phone}/")
	public String helpPw(HttpServletResponse response, @PathVariable("name") String name,
			@PathVariable("email") String email, @PathVariable("phone") String phone) throws Exception {
		CustomerVO vo = new CustomerVO();
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(phone);
		return cs.helpPw(vo, response);
	}
	
//	@PostMapping(value="helpPw/")
//	public ModelAndView helpPw(CustomerVO vo, HttpServletResponse response) throws Exception {
//		return cs.helpPw(vo, response);
//	}
	
//	2020.07.31
	@RequestMapping("mychange/")
	public ModelAndView mychange(HttpSession session) {
		return cs.mychange(session);
	}
	
	@PostMapping("mychange/")
	public ModelAndView mychange(HttpServletRequest request, HttpServletResponse response, CustomerVO vo) throws NoSuchAlgorithmException, IOException {
		return cs.mychange(request, response, vo);
	}
	
	
	//08.06 Bong
	@RequestMapping("purchasehistory/")
	public ModelAndView purchaseHistory(HttpSession session) {
		return cs.purchasehistory(session);
	}
	
//	2020.08.19+
//	clientController의 myPage 매핑 삭제
	@RequestMapping("/myPage/")
	public ModelAndView myPage(HttpSession session) {
		return cs.myPage(session);
	}
	
	@RequestMapping("withdrawl/")
	public ModelAndView deleteCustomer(HttpSession session) {
		return cs.deleteCustomer(session);
	}
}
