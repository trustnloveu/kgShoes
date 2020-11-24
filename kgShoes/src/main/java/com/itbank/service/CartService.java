package com.itbank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.PaymentDAO;
import com.itbank.dao.ShoesDAO;
import com.itbank.vo.CartVO;
import com.itbank.vo.CartViewVO;
import com.itbank.vo.CustomerVO;
import com.itbank.vo.MerchandiseVO;

@Service
public class CartService {

	@Autowired private PaymentDAO pdao;
	@Autowired private ShoesDAO sdao;
	
	public ModelAndView view(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView("cart");
		HttpSession session = req.getSession();
		CustomerVO login = (CustomerVO)session.getAttribute("login");
		List<CartVO> cartList = null;
		int totalPrice = 0;	// 추가
		
		if (login != null) {	// 로그인 계정이 있을때
			HashMap<String, Integer> param = new HashMap<String, Integer>();
			param.put("customerCode", login.getCustomerCode());
			cartList = pdao.selectCartList(param);
			for(int i = 0; i < cartList.size(); i++) {
				for(int j = i + 1; j < cartList.size(); j++) {
					if(cartList.get(i).getMerchanCode().equals(cartList.get(j).getMerchanCode()) && cartList.get(i).getShoeSize() == cartList.get(j).getShoeSize()) {
						int amount = cartList.get(i).getAmount();
						int price = cartList.get(i).getPrice();
						cartList.get(i).setAmount(amount + cartList.get(j).getAmount());
						cartList.get(i).setPrice(price + cartList.get(j).getPrice());
						cartList.remove(j);
					}
				}
			}
			for (CartVO vo : cartList) {
				System.out.println(vo.getMerchanCode() + " : " + vo.getAmount() + ", " + vo.getPrice());
				totalPrice += vo.getPrice();	// 추가
			}
		}
		else {	// 비회원
			cartList = new ArrayList<CartVO>();
			Cookie[] cs = req.getCookies();
			for (Cookie c : cs) {
				if (c.getValue().split("-")[0].equals("Cart")) {
					System.out.println("name : " + c.getName() + ", key : " + c.getValue());
					CartVO vo = new CartVO();
					vo.setMerchanCode(c.getName().split("\\*")[0]);	// 이스케이프 문자 써줘야한다.
					vo.setShoeSize(Integer.parseInt(c.getName().split("\\*")[1]));
					vo.setAmount(Integer.parseInt(c.getValue().split("-")[1]));
					vo.setPrice(Integer.parseInt(c.getValue().split("-")[2]));
					cartList.add(vo);
					
					totalPrice += Integer.parseInt(c.getValue().split("-")[2]);	// 추가
				}  
			}
		}
		
		List<CartViewVO> viewList = setViewList(cartList);
		mav.addObject("viewList", viewList);
		mav.addObject("totalPrice", totalPrice);	// 추가
		
		return mav;
	}

	public List<CartViewVO> setViewList(List<CartVO> cartList) {
		List<CartViewVO> result = new ArrayList<CartViewVO>();
		for (CartVO item : cartList) {
			CartViewVO vo = new CartViewVO();
			MerchandiseVO merchan = sdao.selectMerchan(item.getMerchanCode());

			vo.setAmount(item.getAmount());
			vo.setMerchanCode(item.getMerchanCode());
			vo.setShoeSize(item.getShoeSize());
			vo.setTotalPrice(item.getPrice());
			
			vo.setMerchanName(merchan.getMerchanName());
			vo.setImgUrl(merchan.getImgSrc());
			vo.setSinglePrice(item.getPrice()/item.getAmount());
			
			result.add(vo);
		}
		
		return result;
	}
}
