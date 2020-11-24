<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="site-wrap">
		<header class="site-navbar bg-light" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>
			<hr class="mb-0 mt-0"
				style="border-bottom: 1px solid rgba(0, 0, 0, 0.1)">
			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
			<hr class="mb-0 mt-0"
				style="border-bottom: 1px solid rgba(0, 0, 0, 0.1)">
		</header>

		<div class="site-section" data-aos="fade"
			style="background-color: #52787b; height: 1000px">
			<div class="mb-5" style="color: white; text-align: center;">
				<h2 class="pb-3">Shoes, being with you on your daily life</h2>
				<h4>We're selling every type of shoes you need. In a range of
					Sports, Daily, and even, Social Occasion.</h4>
			</div>
			<div id="demo" class="container carousel slide" data-ride="carousel" data-interval="3050">
				<div style="padding: 20px; background-color: white;">
					<div class="carousel-inner p-0" style="height: 613px;">
						<!-- 슬라이드 쇼 -->
						<div class="carousel-item active center-block">
							<img class="d-block w-100"
								src="${cpath }/images/banner4.png" alt="1">
						</div>
						<div class="carousel-item center-block">
							<img class="d-block w-100"
								src="${cpath }/images/banner3.jpg" alt="2">
						</div>
						<div class="carousel-item center-block">
							<img class="d-block w-100"
								src="${cpath }/images/banner2.jpg" alt="3">
						</div>

						<!-- 왼쪽 이미지로 슬라이더 이동 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span>Previous</span> <!-- 으른쪽 이미지로 슬라이더 이동  -->
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span>Next</span> <span class="carousel-control-next-icon"></span>
						</a>

						<!-- 인디케이터 -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- credit -->
		<div class="container mt-5" style="color: black">
			<!-- 봉찬균, 곽동열 -->
			<div class="col-md-12 mb-3 d-flex" data-aos="fade-up">
			
				<div class="profile_pic_wrapper col-md-2 p-0 m-0">
					<img src="${cpath }/images/person.png">
				</div>
				<div class="col-md-4">
					<div class="ml-4 p-2 text-left">
						<span class="profile_name">봉찬균</span>
						<ul class="profile_detail">
							<li>프로젝트 총괄</li>
							
						</ul>
					</div>
				</div>
				
				<div class="profile_pic_wrapper col-md-2 p-0 m-0">
					<img src="${cpath }/images/person.png">
				</div>
				<div class="col-md-4">
					<div class="ml-4 p-2 text-left">
						<span class="profile_name">곽동열</span>
						<ul class="profile_detail">
							<li>상품 리스트, 게시판 및 리뷰</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 김정미, 조재일 -->
			<div class="col-md-12 mb-3 d-flex" data-aos="fade-up">
				<div class="profile_pic_wrapper col-md-2 p-0 m-0">
					<img src="${cpath }/images/person.png">
				</div>
				<div class="col-md-4">
					<div class="ml-4 p-2 text-left">
						<span class="profile_name">김정미</span>
						<ul class="profile_detail">
							<li>회원 및 결제 기능</li>
						</ul>
					</div>
				</div>
				<div class="profile_pic_wrapper col-md-2 p-0 m-0">
					<img src="${cpath }/images/person.png">
				</div>
				<div class="col-md-4">
					<div class="ml-4 p-2 text-left">
						<span class="profile_name">조재일</span>
						<ul class="profile_detail">
							<li>카트 및 단일 상품 처리</li>
							
						</ul>
					</div>
				</div>
			</div>
			
			<!-- 이승원, 양의진 -->
			<div class="col-md-12 mb-3 d-flex" data-aos="fade-up">
				<div class="profile_pic_wrapper col-md-2 p-0 m-0">
					<img src="${cpath }/images/person.png">
				</div>
				<div class="col-md-4">
					<div class="ml-4 p-2 text-left">
						<span class="profile_name">이승원</span>
						<ul class="profile_detail">
							<li>UI 구현, 관리자 기능</li>
						</ul>
					</div>
				</div>
				<div class="profile_pic_wrapper col-md-2 p-0 m-0">
					<img src="${cpath }/images/person.png">
				</div>
				<div class="col-md-4">
					<div class="ml-4 p-2 text-left">
						<span class="profile_name">양의진</span>
						<ul class="profile_detail">
							<li>UI 구현, 사이트 디자인</li>
						</ul>
					</div>
				</div>
			</div>
			
		</div>
	
		<div class="text-center" style="font-size: 40pt; font-family: sans-serif; color: #7971ea" data-aos="fade">
			Thank you all.
		</div>

	</div>

	<!-- 푸터 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>