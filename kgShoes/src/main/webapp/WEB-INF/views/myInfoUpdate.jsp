<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Project MyInfoUpdate</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS link -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>

<body>
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
							<strong class="text-black">Shop</strong>
						</div>
					</div>
				</div>
			</div>
			<!-- end header -->
		</header>

		<!-- 개인정보 변경 입력란 -->
		<!-- 2020.07.22 -->
		<div class="site-section">
			<div class="container">
				<div class="row mb-12">
					<div class="col-md-9 order-2">
						<div class="row ml-2">
							<!-- 회원정보 수정 Form -->
							<form action="#" method="post" class="col-md-12"> 
								<div class="p-3 p-lg-5 border">
									<div class="form-group row">
										<!-- 이름 -->
										<div class="col-md-6">
											<label for="c_fname" class="text-black">First Name</label> 
											<input type="text" class="form-control" id="c_fname" name="c_fname" placeholder="이름">
										</div>
										<!-- 성 -->
										<div class="col-md-6">
											<label for="c_lname" class="text-black">Last Name</label> 
											<input type="text" class="form-control" id="c_lname" name="c_lname" placeholder="성">
										</div>
									</div>
									<!-- 이메일 -->
									<div class="form-group row">
										<div class="col-md-12">
											<label for="email" class="text-black">Email</label>
											<input type="email" class="form-control" id="c_email" name="c_email" placeholder="이메일을 입력하세요">
										</div>
									</div>
									<!-- 비밀번호 -->
									<div class="form-group row">
										<div class="col-md-12">
											<label for="c_userpw" class="text-black">Password
												<span class="text-danger">*</span>
											</label>
											<input type="password" class="form-control" id="c_userpw" name="c_userpw"
												   placeholder="비밀번호를 입력해주세요." required>
										</div>
									</div>
									<!-- 비밀번호 확인 -->
									<div class="form-group row">
										<div class="col-md-12">
											<label for="c_subject" class="text-black">Password Check
												<span class="text-danger">*</span>
											</label> 
											<input type="password" class="form-control" id="userpwck" name="userpwck" 
												   placeholder="비밀번호를 다시 입력해주세요." required>
										</div>
									</div>
									<!-- 휴대폰 번호 -->
									<div class="form-group row">
										<div class="col-md-12">
											<label for="c_message" class="text-black">Phone Number</label>
											<input type="text" name="phonenum" id="phonenum" class="form-control" placeholder="ex) 010-1234-5678">
										</div>
									</div>
									<!-- 주소 -->
									<!-- 나중에 도로명주소 API 가져오자 -->
									<div class="form-group row">
										<div class="col-md-12">
											<label for="addr" class="text-black">Address</label>
											<input type="text" name="addr" id="addr" class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-12">
											<input type="submit" class="btn btn-primary btn-lg btn-block" value="Confirmed">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<!-- 왼쪽 사이드바 1 -->
					<%@ include file="/WEB-INF/views/include/myleftsidebar.jsp" %>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
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