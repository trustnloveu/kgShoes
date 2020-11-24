package com.itbank.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.dao.ShoesDAO;
import com.itbank.service.PaymentService;
import com.itbank.vo.CustomerVO;

@RestController
public class CartRestController {
	
	@Autowired ShoesDAO sdao;
	@Autowired PaymentService payService;
	
	@RequestMapping(value = "getQuantity/{merchanCode}/{shoeSize}/")
	public int checkQuantity(@PathVariable("merchanCode")String merchanCode,
							 @PathVariable("shoeSize")int shoeSize) {
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("merchanCode", merchanCode);
		param.put("shoeSize", shoeSize + "");
		
		return sdao.getSingleQuantity(param);
	}
	
	// 2020-08-06 추가 (조재일)
	@RequestMapping(value = "deleteItem/{merchanCode}/{shoeSize}/")
	public int deleteItem(@PathVariable("merchanCode")String merchanCode,
						  @PathVariable("shoeSize")int shoeSize,
						  HttpServletRequest req, HttpServletResponse resp) {
		int result = 0;
		HttpSession session = req.getSession();
		System.out.println("delete Cart Item : " + merchanCode + shoeSize);
		CustomerVO login = (CustomerVO) session.getAttribute("login");
		if (login != null) {
			result = payService.deleteCart(merchanCode, shoeSize, login);
		}
		else {
			Cookie[] cookies = req.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().equals(merchanCode + "*" + shoeSize)) {
					c.setPath("/main");
					c.setMaxAge(0);
					resp.addCookie(c);
					result = 1;
				}
			}
		}
		return result;
	}
}
