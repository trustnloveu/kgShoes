package com.itbank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.CartService;
import com.itbank.service.ClientService;

@Controller
public class ClientController {
	
	@Autowired private CartService cartService;
	@Autowired private ClientService clis;
	
	
//	@RequestMapping("/joinForm/")
//	public void joinForm() {}
	
	@GetMapping("/accountSearch/")
	public void accountSearch() {}

	
	@GetMapping("/cart/")
	public ModelAndView cart(HttpServletRequest req, HttpServletResponse resp) {
		return cartService.view(req, resp);
	}
	
	@GetMapping("/about/")
	public void about() {}
	
	@GetMapping("/contact/")
	public void contact() {}
	
	@GetMapping("/shopSingle/")
	public void shopSingle() {}
	
	@GetMapping("/payment/")
	public void payment() {}
	
	@RequestMapping("/myInfoUpdate/")
	public void myInfoUpdate() {}
	
	@RequestMapping("/sample/")
	public String sample() {
		return "shopSingleSample";
	}
	
	@RequestMapping({"/","/front/"})
	public ModelAndView home() {
		
		return clis.home();
				
	}
	
	

}
