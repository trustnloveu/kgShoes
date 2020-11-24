<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 2020.08.19+ -->
<!-- 함수사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<title>Project MyPage</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>

<body>
	
	<!-- 8.6 Bong 로그인 상태 아니면 myPage접근 막기 -->

	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>

			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>

			<!-- 카테고리 -->
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a>
								<span class="mx-2 mb-0">/</span>
							<strong class="text-black">My Page</strong>
						</div>
					</div>
				</div>
			</div>
			<!-- end header -->
		</header>

		<!-- 마이페이지 -->
		<!-- 2020.07.22 -->
		<div class="site-section">
			<div class="container">
				<div class="row mb-12">
					<div class="col-md-9 order-2">
						<div class="row ml-2">
							<div class="col-md-6 order-2" style="border: 1px solid grey;">
								<!-- 회원정보1 -->
								<!-- 2020.07.21 -->
								<div class="row mb-3 mt-3">
									<div class="col-sm-12" data-aos="fade-up">
										<!-- fade-up : 밑에서 위로 올라오는 효과 -->
										<fieldset>
											<legend>회원정보</legend>
											<hr>
											<div class="mypage-box-left">회원명</div>
											:
											<div class="mypage-box-right mb-2">${login.name }</div>
											<div class="mypage-box-left">이메일</div>
											:
											<div class="mypage-box-right mb-2">${login.email }</div>
											<div class="mypage-box-left">가입일</div>
											:
											<div class="mypage-box-right mb-2">${login.registdate }</div>
										</fieldset>
									</div>
								</div>
							</div>
							<div class="col-md-1 order-2"></div>
							<div class="col-md-5 order-2" style="border: 1px solid grey;">

								<!-- 회원정보2 -->
								<!-- 2020.07.21 -->
								<div class="row mb-3 mt-3">
									<div class="col-sm-12" data-aos="fade-up">
										<!-- fade-up : 밑에서 위로 올라오는 효과 -->
										<fieldset style="">
											<legend>구매정보</legend>
											<hr>
											<div class="mypage-box-left">총 주문금액</div>
											:
											<div class="mypage-box-right mb-2">${login.totalAmount }원</div>
											<div class="mypage-box-left">적림금</div>
											:
											<div class="mypage-box-right mb-2">${login.point }원</div>
<!-- 											<div class="mypage-box-left">쿠폰</div> -->
<!-- 											: -->
<!-- 											<div class="mypage-box-right mb-2">0개</div> -->
										</fieldset>
									</div>
								</div>
							</div>
							<!-- order가 배치되는 순서인듯 하네 -->
							<div class="col-md-12 order-3 mt-5" style="padding: 0">
								<p style="font-weight: bold;">최근 주문 정보</p>
								<hr>
								<table class="col-md-12" style="text-align: center;">
									<tr style="background-color: #CCCCCC; border-bottom: 1px solid grey; border-top: 1px solid grey; color: black">
										<th style="width: 30%;">구매날짜</th>
										<th style="width: 30%">상품명</th>
										<th style="width: 30%">구매금액</th>
										<th style="width: 10%">내용</th>
									</tr>
									<tr style="border-bottom: 1px solid grey">
										<c:set var="date" value="${orderlist[0].orderDate }" />
										<td>${fn:substring(date,0,10)}</td>
										<td>${orderlist[0].orderMerchanName }</td>
										<td>${orderlist[0].orderPrice }원</td>
										<td>보기(영수증)</td>
									</tr>
								</table>
							</div>


							<div class="col-md-12 order-3 mt-5" style="padding: 0">
								<p style="font-weight: bold;">최근 게시글</p>
								<hr>
								<table class="col-md-12" style="text-align: center;">
									<tr style="background-color: #CCCCCC; border-bottom: 1px solid grey; border-top: 1px solid grey; color: black">
										<th style="width: 30%">게시날짜</th>
										<th style="width: 50%">제목</th>
										<th style="width: 20%">내용</th>
									</tr>
									<!-- 반복문 -->
									
								</table>
							</div>

							<!-- order가 배치되는 순서인듯 하네 -->
							<div class="col-md-12 order-4 mt-5 mb-5" style="padding: 0;">
								
							</div>
						</div>
					</div>

					<!-- 왼쪽 사이드바 1 -->
					<%@ include file="/WEB-INF/views/include/myleftsidebar.jsp" %>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		</div>
	</div>

	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>

	<script src="../js/main.js"></script>

</body>
</html>