package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.LookupService;
import com.itbank.service.PaymentService;
import com.itbank.vo.CustomerVO;
import com.itbank.vo.ShoeSizeVO;

@RestController
public class LookupRestController {

	@Autowired private LookupService ls;
	@Autowired private PaymentService ps;
	
	@RequestMapping(value = "getShoesQuantity/{merchanCode}/", produces = "application/json;charset=utf8")
	public String getQuantity(@PathVariable("merchanCode")String merchanCode) {
		String jsonData = null;
		List<ShoeSizeVO> sizeQuantityList = ls.getQuantity(merchanCode);	// ?��?�� ?��?��?�� ?��?��즈별 ?���? List
		
		try {
			jsonData = new ObjectMapper().writeValueAsString(sizeQuantityList);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			System.out.println("json mapping error !!");
		} catch (IOException e) {
			System.out.println("?��출력 ?��?�� !!");
		}
		return jsonData;
	}
	
	// 2020-08-06 수정 (조재일)
	@RequestMapping(value = "addCart/{merchanCode}/")
	public int addCart(@PathVariable("merchanCode")String merchanCode, HttpServletResponse resp, HttpServletRequest req) {
			HttpSession session = req.getSession();
			CustomerVO login = (CustomerVO)session.getAttribute("login");
			
			int ammount = Integer.parseInt(req.getParameter("Ammount"));	// 수량 값넘어오는 거 확인 완료
			String shoesSize = req.getParameter("shoesSize");
			int price = Integer.parseInt(req.getParameter("price"));
			int totalPrice = ammount * price;
			
			if (login != null) {	// 로그인 계정이 있을때
				ps.userAddCart(merchanCode, login.getCustomerCode(), ammount, shoesSize, totalPrice);
			}
			else {	// 로그인 상태가 아니라면
				// 쿠키 생성
				boolean flag = false;
				Cookie[] cs = req.getCookies();
				for (Cookie cookie : cs) {
					if(cookie.getName().equals(merchanCode + "*" + shoesSize)) {
						flag = true;
						String value = cookie.getValue();
						System.out.println("value : " + value);
						value = "Cart-" + ((Integer.parseInt(value.split("-")[1]) + ammount) + "-" + ((Integer.parseInt(value.split("-")[2])) + totalPrice));
						cookie.setValue(value);
						cookie.setPath("/main");
						cookie.setMaxAge(60*60*24*7);
						resp.addCookie(cookie);
					}
				}
				if (!flag) {
					Cookie c = new Cookie(merchanCode + "*" + shoesSize, "Cart-" + ammount + "-" + totalPrice);
					c.setPath("/main");
					c.setMaxAge(60*60*24*7);
					resp.addCookie(c);
				}
			}		
			return 1;
		}
	
}
