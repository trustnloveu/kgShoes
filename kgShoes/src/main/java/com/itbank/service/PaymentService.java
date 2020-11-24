package com.itbank.service;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
//import com.itbank.dao.ShoesDAO;
import com.itbank.vo.CartVO;
import com.itbank.vo.CustomerVO;
import com.itbank.vo.OrderListVO;


@Service
public class PaymentService {
	@Autowired private ShoesDAO sdao;
	@Autowired private PaymentDAO pdao;
	
	
	public void userAddCart(String merchanCode, int customer_code, int ammount, String shoesSize, int totalPrice) {
		System.out.println("cutomer_code : " + customer_code);
		CartVO cart = new CartVO();
		
		cart.setCustomerCode(customer_code);
		cart.setMerchanCode(merchanCode);
		cart.setPrice(totalPrice);
		cart.setAmount(ammount);
		cart.setShoeSize(Integer.parseInt(shoesSize));
		
		pdao.addCart(cart);
	}

	
//	2020.08.03 재고 체크 후 결제창으로 이동
//	2020.08.06
//	파라미터값, 변수값, if문 수정
	public ModelAndView stockcheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView("payment");
		System.out.println("stockcheck!");
		String merchanCode = request.getParameter("merchanCode");
		String code = request.getParameter("code");
		String size = request.getParameter("size");
		String ammount = request.getParameter("itemAmmount");
//		2020.08.13
//		price 변수 추가
		String price = request.getParameter("price");
		
		System.out.println(code + "==========" + size + "==========" + ammount + "=========");
		
//		2020.08.18
//		getname name 수정!
		String getname = pdao.getName(code);	// 상품 이름 가져오기
		System.out.println("==============" + getname + "============");
		String[] name = {getname};	// 상품이름 배열로 만들기
		System.out.println("name : " + name[0]);
//		2020.08.13
//		size 변수명 변경
		HashMap<String, String> report = new HashMap<String, String>();
		report.put("code", code);
		report.put("size", size);
		
		// 사이즈 미 선택 시
		if(size.equals("Size")) {		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당상품의 사이즈를 선택해주세요'); history.go(-1);</script>");		// 입력값이 일치하지 않으면 알림창 출력 후 뒤로가기
			out.flush();	
		}
		// 상품의 재고가 없거나 체크한 수량보다 적을 경우
		else if((pdao.stockcheck(report)-Integer.parseInt(ammount)) < 1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당상품의 재고가 부족합니다'); history.go(-1);</script>");		// 입력값이 일치하지 않으면 알림창 출력 후 뒤로가기
			out.flush();
		// 재고 있을 때 결제 창으로 넘기기
		}else{
			
			
//			2020.08.13
//			쿠키방식 삭제  
			mav.addObject("name", name);
//			2020.08.18
//			배열로 넘기기
			mav.addObject("code", request.getParameterValues("code"));
			mav.addObject("size", request.getParameterValues("size"));
			mav.addObject("ammount", request.getParameterValues("itemAmmount"));


			
			// 2020.08.20
			int totalPrice = Integer.parseInt(price) * Integer.parseInt(ammount);
			int discrate = sdao.selectMerchan(merchanCode).getDiscRate();
			System.out.println("discrate : " + discrate);
			mav.addObject("discratValue", discrate);
			
			if (discrate == 0) {
//				총 금액 계산해서 totalPrice로 보내기
				mav.addObject("price", request.getParameterValues("price"));
				mav.addObject("totalPrice", Integer.parseInt(price) * Integer.parseInt(ammount));
				System.out.println("totalprice : " + Integer.parseInt(price) * Integer.parseInt(ammount));
			}
			else {
				String[] Price = request.getParameterValues("price");
				int discrated = (Integer.parseInt(Price[0]) - ((Integer.parseInt(Price[0])  * discrate) / 100));
				String[] discratedPrice = new String [1];
				discratedPrice[0] = String.valueOf(discrated);
						
				mav.addObject("price", discratedPrice);
				mav.addObject("totalPrice", totalPrice - ((totalPrice * discrate) / 100));
			}	
		
		}
		return mav;
	}
	
	// 2020-08-07 추가(조재일)
	public int deleteCart(String merchanCode, int shoeSize, CustomerVO login) {
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("merchanCode", merchanCode);
		param.put("shoeSize", shoeSize + "");
		param.put("customerCode", login.getCustomerCode() + "");
		return pdao.deleteCart(param);
	}

//	2020.08.13
//	결제 넘기기
	public ModelAndView paymentComplete(HttpServletRequest request, OrderListVO vo, HttpServletResponse response) {
		String cartchk = request.getParameter("cartcheck");
//		ordercodename 중복 방지를 위한 임의의 숫자값
		int ordercodenumber = 0;
		ordercodenumber += 1;
		
		ModelAndView mav = new ModelAndView("payComplete");
		
		String checkmember = request.getParameter("checkmember");	// 회원 비회원 주문 확인
//		2020.08.19+ 
//		총주문금액 받아오기
		System.out.println("totalprice : " + request.getParameter("totalprice"));
		int totalPrice = Integer.parseInt(request.getParameter("totalprice"));
		
//		2020.08.18
//		format2 삭제
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");	// db에 들어가는 오늘 날짜 형식
		Date time = new Date();
		
		System.out.println("결제방식 : get" + vo.getOrderPayoption());
		switch(vo.getOrderPayoption()) {	// 결제 방식에 따른 정보 넘기기
		case "checkBank":
			mav.addObject("bankName", request.getParameter("c_fname"));	// 예금주
			mav.addObject("bankEmail", request.getParameter("c_email"));// 이메일
			break;
		case "checkCredit":                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
			mav.addObject("creditCard", request.getParameter("c_card"));	// 카드번호
			mav.addObject("creditCvv", request.getParameter("c_cvv"));		// cvv
			mav.addObject("creditDate", request.getParameter("c_ex_date"));	// 카드만료일
			break;
		case "checkMobile":
			mav.addObject("mobileTel", request.getParameter("tong_sin_sa")); // 통신사
			mav.addObject("mobilePhone", request.getParameter("c_mobile"));	// 전화번호
			break;
		}
		
//		2020.08.18
//		받는분 이메일, 주문 요청사항 미입력 시 없음으로 set
		if(vo.getOrderRecieveEmail() == null)
			vo.setOrderRecieveEmail("없음");
		if(vo.getOrderNotes() == null)
			vo.setOrderNotes("없음");
		
		System.out.println("note : " + vo.getOrderNotes());
		System.out.println("diffrent address check : " + request.getParameter("diffrentAddress"));
		
//		주문번호코드 전화번호 뒤 4자리 + 주문 날짜 yymmdd (ex : 1234112233)
//		2020.08.19 
//		비회원일때 && 회원일때 배송지 정보 직접 입력 시 입력받은 정보로 주문번호코드 생성
		if(checkmember.equals("nonmember") || request.getParameter("diffrentAddress") == "1") {
			String ordercode = vo.getOrderRecievePnum().substring(vo.getOrderRecievePnum().length()-4, vo.getOrderRecievePnum().length()) + format.format(time) + ordercodenumber;
			vo.setOrderCodename(ordercode);		// 조합된 주문번호코드
		}
		
		vo.setOrderDate(format.format(time));	// 주문날짜
		System.out.println("date : " + vo.getOrderDate());
		String orderAddress = request.getParameter("address") + " " + request.getParameter("detailAddress");
		System.out.println("orderAddress : " +orderAddress);
		vo.setOrderAddress(orderAddress);
		
//		여러 상품 값 받는 배열
		String[] orderPrice = request.getParameterValues("orderPrice");
		String[] orderQuantitiy = request.getParameterValues("orderQuantitiy");
		String[] merchanCode = request.getParameterValues("merchanCode");
		String[] shoesize = request.getParameterValues("shoesize");
		String[] orderMerchanName = request.getParameterValues("orderMerchanName");
		
		for(int i=0; i<orderPrice.length; i++) {
//			상품 한개씩 주문 정보 db에 넣기
			vo.setOrderPrice(Integer.parseInt(orderPrice[i]));
			vo.setOrderQuantity(Integer.parseInt(orderQuantitiy[i]));
			vo.setMerchanCode(merchanCode[i]);
			vo.setShoeSize(Integer.parseInt(shoesize[i]));
//			2020.08.19 필드 추가
			vo.setOrderMerchanName(orderMerchanName[i]);
			
			pdao.payment(vo);	// 상품 수량 업데이트
			pdao.updateSalesRate(vo);	// 상품 판매 횟수 업데이트
			System.out.println("updatepay");
			
			// 회원 & 비회원 체크
			if(checkmember.equals("member")) {		
				HttpSession session = request.getSession();
				CustomerVO cvo = (CustomerVO) session.getAttribute("login");
				System.out.println("loginemail : " + cvo.getEmail());
				vo.setCustomerCode(pdao.getcustomercode(cvo.getEmail()));	// 회원코드 넣기
				System.out.println("customercode=="+vo.getCustomerCode());
//				2020.08.19+
//				회원정보에 총주문금액, 포인트 적립
				System.out.println("Pay complete totalprice : " + totalPrice);
				
				cvo.setTotalAmount(totalPrice);
				cvo.setPoint((int) (totalPrice * 0.1));
				pdao.updatePoint(cvo);
				// 2020.08.19
				// 로그인 한 회원일 때 배송지 정보 직접 입력 안할 경우 그 회원의 정보로 넣기
				if(request.getParameter("diffrentAddress") != "1") {
					vo.setOrderRecieveName(cvo.getName());
					vo.setOrderRecievePnum(cvo.getPhone());
					vo.setOrderRecieveEmail(cvo.getEmail());
					vo.setOrderAddress(cvo.getAddress());
//					2020.08.19
//					등록된 회원 정보를 이용 해 주문번호코드 생성
					String ordercode = cvo.getPhone().substring(cvo.getPhone().length()-4, cvo.getPhone().length()) + format.format(time) + ordercodenumber;
					vo.setOrderCodename(ordercode);
				}
				pdao.memberP(vo);					// 회원 주문
				if("cart".equals(cartchk)) {
					pdao.deleteMemberCart(vo.getCustomerCode());
				}
			}else {
				System.out.println("========vo" + vo.getOrderAddress() + "quantity" + vo.getOrderQuantity() + "note : " + vo.getOrderNotes());
				pdao.nonmemberP(vo);				// 비회원 주문
				if("cart".equals(cartchk)) {
					Cookie[] cookies = request.getCookies();
					for(int j=0; j<cookies.length; j++) {
//						String[] orderPrice = request.getParameterValues("orderPrice");
//						String[] orderQuantitiy = request.getParameterValues("orderQuantitiy");
//						String[] merchanCode = request.getParameterValues("merchanCode");
//						String[] shoesize = request.getParameterValues("shoesize");
//						String[] orderMerchanName = request.getParameterValues("orderMerchanName");
						for(int z=0; z<merchanCode.length; z++) {
							String cooname = merchanCode[z] + "*" + shoesize[z];
							if(cookies[j].getName().equals(cooname)) {
								cookies[j].setMaxAge(0);
								cookies[j].setPath("/main");
								response.addCookie(cookies[j]);
							}
						}
					}
				}
			}
		}
		
//		결제완료 & 결제 정보 확인 창으로
		mav.addObject("orderMerchanName", orderMerchanName);
		mav.addObject("orderPrice", orderPrice);
		mav.addObject("orderQuantitiy", orderQuantitiy);
		mav.addObject("merchanCode", merchanCode);
		mav.addObject("shoesize", shoesize);
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("reportVO", vo);
		
		return mav;
	}

//	2020.08.13
//	장바구니에서 결제창 넘어가기
	public ModelAndView cartPayment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("payment");
		
//		장바구니의 input값 배열로 받아서 넘기기 (getParameterValues)
		mav.addObject("name", request.getParameterValues("merchanName"));
		mav.addObject("code",request.getParameterValues("merchanCode"));
		mav.addObject("size", request.getParameterValues("shoesize"));
		mav.addObject("price", request.getParameterValues("price"));
		mav.addObject("ammount", request.getParameterValues("ammount"));
		System.out.println("totalprice : " + request.getParameter("totalPrice"));
		mav.addObject("totalPrice", request.getParameter("totalPrice"));
		
		return mav;
	}
	
//	2020.08.13
//	회원 주문조회
	public ModelAndView memberOrderLookup(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("orderLookup");
		
		HttpSession session = request.getSession();
		CustomerVO cvo = (CustomerVO) session.getAttribute("login");	// 로그인중인 세션값 가져오기
		
		if(cvo != null) {	
			int customercode = pdao.getcustomercode(cvo.getEmail());	// 회원코드
			mav.addObject("orderList", pdao.memberorderlist(customercode));	// 회원코드에 대한 주문 정보 가져오기
		}
		return mav;
	}

//	2020.08.13
//	비회원 주문조회
	public ModelAndView notmemberOrderLookup(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView("orderLookup");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("recieveName", request.getParameter("recieveName"));
		map.put("recievePnum", request.getParameter("recievePnum"));
		
		List<OrderListVO> orderList = pdao.notmemberorderlist(map);	// 비회원 이름 전화번호로 주문 조회
		
		if(orderList != null) {
			mav.addObject("orderList", orderList);
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당정보의 주문정보가 없습니다.'); history.go(-1);</script>");		// 입력값이 일치하지 않으면 알림창 출력 후 뒤로가기
			out.flush();
		}
		return mav;
	}
}

// 2020-07-31 추가된 서비스 (조재일)