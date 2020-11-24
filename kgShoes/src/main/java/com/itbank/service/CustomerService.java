package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.CustomerDAO;
import com.itbank.vo.CustomerVO;
import com.itbank.vo.OrderListVO;

@Service
public class CustomerService {

	@Autowired private CustomerDAO dao;
	@Autowired ServletContext sc;
	
	// 회원가입 시 중복 이메일 체크
	public String emailcheck(HttpServletRequest request) {
		try {
			String email = request.getParameter("email");
			String alreadyExist = dao.emailcheck(email);	// 이메일값으로 select하여 반환되는 이메일 있는지 확인
//			System.out.println("email : " + dao.emailcheck(email));
			return alreadyExist != null ? "이미 사용중인 계정입니다" : "사용 가능한 계정입니다"; 
		}catch (Exception e){
			return "통신 실패 : " + e.getClass().getSimpleName();
		}
	}
	
	// 로그인 
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		ModelAndView mav = new ModelAndView();
		CustomerVO vo = new CustomerVO();
		vo.setEmail(request.getParameter("email"));
		vo.setPassword(SecurePassword.getHashValue(vo.getEmail(), request.getParameter("password")));	// 입력받은 비밀번호 암호화 값으로 변환하여 비교
		System.out.println("login hashPassword : " + vo.getPassword());
		
		CustomerVO login = dao.login(vo);
		HttpSession session = request.getSession();
		
		
		Cookie emailCookie = new Cookie("emailCookie",vo.getEmail());
		if (login != null) {
//			System.out.println("Login Code :" + login.getCustomerCode());
//			System.out.println("Login Phone :" + login.getPhone());
//			System.out.println("Login regist :" + login.getRegistdate());
			login.setRegistdate(login.getRegistdate().substring(0, 10));
			session.setAttribute("login", login);
			mav.setViewName("redirect:/");				// 로그인 성공 시 login세션 생성하고 home화면으로 이동
			if("on".equals(request.getParameter("rememberEmail"))) {	// 이메일 기억하기 체크 되어있을 때 이메일 쿠키 생성
//				System.out.println("체크 o : " + request.getParameter("rememberEmail"));
				emailCookie.setMaxAge(60 * 60 * 24 * 7);		// cookie 유효시간 7일
				emailCookie.setPath("/");		//				// 모든 경로에서 쿠키 유효
			}else {
				System.out.println("체크 x : " + request.getParameter("rememberEmail")); // 이메일 기억하기 체크 해제 되어있을 때 
				emailCookie = new Cookie("emailCookie", null);					// 이메일 쿠키가 이미 생성 되어있을 경우 쿠키 삭제
				emailCookie.setMaxAge(0); 										// 쿠키 유호시간 0으로 세팅
				emailCookie.setPath("/");
			}
			response.addCookie(emailCookie);
		} else {
			mav.setViewName("loginerror");
		}	//로그인 실패 시 loginError페이지 이동
	
		return mav;
	}
	
	// join 페이지로 이동 시 이용약관 terms.txt 불러오기
	public ModelAndView join() throws IOException {
		ModelAndView mav = new ModelAndView("joinForm");
		
		System.out.println(sc.getRealPath("/resources/txt/terms.txt"));		// cpath + /resources/txt/terms.txt
		StringBuffer terms1 = new StringBuffer();
		StringBuffer terms2 = new StringBuffer();
		StringBuffer terms3 = new StringBuffer();
		File file1 = new File(sc.getRealPath("/resources/txt/terms1.txt"));
		File file2 = new File(sc.getRealPath("/resources/txt/terms2.txt"));
		File file3 = new File(sc.getRealPath("/resources/txt/terms3.txt"));

		
		// 8.6Bong - 나중에 작업
//		ArrayList<File> file = new ArrayList<File>();
//		file.add(new File(sc.getRealPath("/resources/txt/terms1.txt")));
//		file.add(new File(sc.getRealPath("/resources/txt/terms2.txt")));
//		file.add(new File(sc.getRealPath("/resources/txt/terms3.txt")));
		
			
		
		Scanner scanner1 = new Scanner(file1);
		Scanner scanner2 = new Scanner(file2);
		Scanner scanner3 = new Scanner(file3);
		
		while(scanner1.hasNext()) {
			terms1.append(scanner1.nextLine());
		}
		while(scanner2.hasNext()) {
			terms2.append(scanner2.nextLine());
		}
		while(scanner3.hasNext()) {
			terms3.append(scanner3.nextLine());
		}
		
		mav.addObject("terms1", terms1);
		mav.addObject("terms2", terms2);
		mav.addObject("terms3", terms3);
		
		scanner1.close();
		scanner2.close();
		scanner3.close();

		StringBuffer[] terms = {new StringBuffer(), new StringBuffer(), new StringBuffer()};
		File[] file = {new File(sc.getRealPath("/resources/txt/terms1.txt")), new File(sc.getRealPath("/resources/txt/terms2.txt")), new File(sc.getRealPath("/resources/txt/terms3.txt"))};
		Scanner[] scanner = {new Scanner(file[0]), new Scanner(file[1]), new Scanner(file[2])};
		for(int i=0; i<3; i++) {
			while(scanner[i].hasNext()) {
				terms[i].append(scanner[i].nextLine());
			}
			String name = "terms" + (i+1);
			mav.addObject(name, terms[i]);
			scanner[i].close();
		}
		return mav;
	}
	
	// 회원가입
	public ModelAndView join(HttpServletRequest request,CustomerVO vo) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView("redirect:/loginForm/");	// 회원가입 완료 시 loginForm으로 이동
		System.out.println(request.getParameter("postcode"));
		String phone = request.getParameter("firstP") + request.getParameter("midP") + request.getParameter("lastP");
		String address = "(" + request.getParameter("postcode") + ")" + request.getParameter("address") + " " + request.getParameter("detailAddress");
		// 8.7 Bong mm형식 맞추기
		String mm = request.getParameter("mm");
		if(mm.length()<2) {
			mm = "0" + mm; 
		}
		String dd = request.getParameter("dd");
		if(dd.length()<2) {
			dd = "0"+dd;
		}
		
		String birth = request.getParameter("yy") + mm + dd;
		vo.setPhone(phone); vo.setAddress(address); vo.setBirth(birth);;
		vo.setPassword(SecurePassword.getHashValue(vo.getEmail(), vo.getPassword()));	// 입력받은 비밀번호 해쉬 암호화
//		System.out.println("hashPassword : " + vo.getPassword());
//		System.out.println("phone : " + vo.getPhone());
//		System.out.println("Name : " + vo.getName());
//		System.out.println("address : " + vo.getAddress());
//		System.out.println("Detail - address : " + vo.getDetailAddress());
//		System.out.println("birth : " + vo.getBirth());
//		System.out.println("Email : " + vo.getEmail());
//		System.out.println("pass : " + vo.getPassword());
		
		if(dao.insertCustomer(vo) != 1)	mav.setViewName("redirect:/");	// 회원가입 실패 시 리다이렉트
		
		return mav;
	}
	
	// 이메일 찾기
	public String helpEmail(CustomerVO vo, HttpServletResponse response) throws IOException {
		if (dao.searchEmail(vo) != null) { // 이름과 전화번호로 이메일 찾아서 있으면
			return dao.searchEmail(vo);
		} else {
			return "";
		}
	}

	// 비밀번호 찾기 이용 시 임시비밀번호 발송하기
	public String helpPw(CustomerVO vo, HttpServletResponse response) throws Exception {
		String email = dao.searchPw(vo); // 사용자 입력값으로 이메일 select 하기
		if (email != null) { // 이메일 값 나오면
			sendEmail(email); // 사용자 email로 임시비밀번호 담긴 이메일 보내기
			return "loginForm.jsp";
		} else {
//	         sendEmail("trustnloveu@gmail.com");
			return "";
		}
	}
	
	
	// 임시비밀번호 메일로 발송
	public void sendEmail(String email) throws AddressException, NoSuchAlgorithmException {
		String ranPw = RandomStringUtils.random(10,33,122,false,false);		// 랜덤 비밀번호 생성
		
		String password = SecurePassword.getHashValue(email, ranPw);		// 랜덤 비밀번호 암호화
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email); map.put("password", password);
		dao.updatePw(map);				// 임시비밀번호 값으로 수정
		
		String host = "smtp.gmail.com";
		String sender = "thisshoes4";	// 보내는 이메일 계정
		String spw = "@123thisshoes";
		int port = 465;
		
		String subject = "이런신발 임시비밀번호 발송";	// 메일 제목
		String body = email + "님 임시비밀번호 : \n" + ranPw;	// 메일 내용
		
		Properties props = new Properties(); // 정보 담기 위한 객체 생성
		// smtp 서버 정보 설정
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, spw);
			}
		});
		
		try {
		Message mimeMessage = new MimeMessage(session);		
		mimeMessage.setFrom(new InternetAddress(sender));	// 발신자 셋팅
		mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // 수신자 셋팅
		
		mimeMessage.setSubject(subject);	// 제목셋팅
		mimeMessage.setText(body);		// 내용셋팅		
		Transport.send(mimeMessage); 	// javax.mail.Transport.send() 이용, 메일 보내기
		}catch (MessagingException e){
			e.printStackTrace();
		}
	}
	

//	2020.07.31 
//	회원정보 수정
	public ModelAndView mychange(HttpSession session) {
		ModelAndView mav = new ModelAndView("mychange");
		CustomerVO vo = (CustomerVO) session.getAttribute("login");
//		(48009)
		mav.addObject("postcode", vo.getAddress().substring(1,6));
		mav.addObject("address", vo.getAddress().substring(7));
		mav.addObject("detailAddress", vo.getDetailAddress());
		return mav;
	}

	public ModelAndView mychange(HttpServletRequest request, HttpServletResponse response, CustomerVO vo) throws NoSuchAlgorithmException, IOException {
		ModelAndView mav = new ModelAndView("mychange");
		String email = request.getParameter("email");
		String oldpassword = request.getParameter("oldPassword");
		vo.setPassword(SecurePassword.getHashValue(email, oldpassword)); vo.setEmail(email);
		if(oldpassword == null || dao.checkPassword(vo) == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 확인해주세요'); history.go(-1);</script>");		// 입력값이 일치하지 않으면 알림창 출력 후 뒤로가기
			out.flush();
		}else {
			vo.setPassword(SecurePassword.getHashValue(email, request.getParameter("password")));
			String address = "(" + request.getParameter("postcode") + ")" + request.getParameter("address");
			vo.setAddress(address);
			dao.updateC(vo);
		}
		mav.addObject("postcode", vo.getAddress().substring(1,6));
		mav.addObject("address", vo.getAddress().substring(7));
		mav.addObject("detailAddress", vo.getDetailAddress());
		return mav;
	}

//	2020.08.19+
//	마이페이지
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav = new ModelAndView("myPage");
		CustomerVO cvo = (CustomerVO) session.getAttribute("login");	// 현재 로그인 계정 들고오기
		
		List<OrderListVO> orderlist = dao.getOrderList(cvo.getCustomerCode());	// 회원코드로 orderlist 들고오기
		System.out.println(orderlist);
		
		mav.addObject("orderlist", orderlist);
		
		return mav;
	}

//	마이페이지/구매내역
	public ModelAndView purchasehistory(HttpSession session) {
		ModelAndView mav = new ModelAndView("purchasehistory");
		CustomerVO cvo = (CustomerVO) session.getAttribute("login");
		
		List<OrderListVO> orderlist = dao.getOrderList(cvo.getCustomerCode());
		System.out.println(orderlist.size());
		System.out.println(orderlist);
		mav.addObject("orderlist", orderlist);
		
		return mav;
	}

	
	public ModelAndView deleteCustomer(HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		CustomerVO cvo = (CustomerVO) session.getAttribute("login");
		
		dao.deletecustomer(cvo.getEmail());
		session.removeAttribute("login");
		
		return mav;
	}
}
