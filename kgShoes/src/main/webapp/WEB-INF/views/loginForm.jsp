<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<title>Project</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<c:set var="emailCookie">${cookie.emailCookie.value }</c:set>
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
							<a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span><strong class="text-black">Login</strong>
						</div>
					</div>
				</div>
			</div>
		</header>

		<!-- 로그인 -->
		<div class="site-section">
			<div class="container" style="text-align: center;">
				<!-- 07.22 레이아웃(사이즈) 변경 -->
				<div class="row col-md-5" style="display: inline-block;">
					
					<div class="col-md-4">
						<h2 class="h3 mb-3 text-black">Login</h2>
					</div>
										
					<!-- 로그인 form -->
					<div class="col-md-12">
						<form method="POST">
							<div class="p-3 p-lg-5 border">

								<!-- 아이디(이메일) -->
								<div class="form-group row">
									<div class="col-md-12" style="text-align: left">
										<label for="b_subject" class="text-black">Email 
											<span class="text-danger">*</span>
										</label> 
										
										<c:choose> 
											<c:when test="${empty emailCookie }">
												<input type="email" class="form-control" id="b_subject" name="email"placeholder="이메일 입력">
											</c:when>
											<c:when test="${not empty emailCookie }">
												<input type="email" class="form-control" id="b_subject" name="email" value="${emailCookie }">
											</c:when>
										</c:choose>		
										
									</div>
								</div>

								<!-- 비밀번호 -->
								<div class="form-group row">
									<div class="col-md-12" style="text-align: left">
										<label for="b_subject" class="text-black">Passowrd 
											<span class="text-danger">*</span>
										</label> 
										<input type="password" class="form-control" id="b_subject" name="password" placeholder="비밀번호 입력">
									</div>
								</div>

								<!-- 로그인 아아디 저장 -->
								<div class="form-group row">
									<div class="col-md-12" style="text-align: left">
										<label class="text-black"> 
											<input name="rememberEmail" type="checkbox" />
											<span class="text-danger">&nbsp;아이디 기억하기</span>
										</label>
									</div>
								</div>

								<!-- Submit -->
								<div class="form-group row">
									<div class="col-lg-12">
										<input type="submit" class="btn btn-primary btn-lg btn-block" value="Login">
									</div>
								</div>

								<!-- 회원가입 링크 -->
								<div class="link-to-join">
									<p>
										<a href="${cpath }/joinForm/">회원가입</a>
									</p>
								</div>

								<!-- 아이디/비밀번호 찾기 -->
								<!-- 8.10 -->
								<div class="link-to-search">
									<p>
										<a id="search_account" class="cursor_p">아이디 / 비밀번호 찾기</a>
									</p>
								</div>
								
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>

		<!-- 최상단 이동버튼 -->
		<!-- 8.10 -->
		<a href="#" class="btn_move_top">
			<img class="btn_top_icon" src="${cpath }/images/topBtn.png">
		</a>
		
		<!-- 푸터 -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		
		<!-- 아이디/비밀번호 찾기 폼 -->
		<%@include file="/WEB-INF/views/include/accountSearchForm.jsp" %>
		
		<!-- Modal(아이디 비밀번호 찾기) -->
		<script src="${cpath }/js/loginModal.js"></script>
	
		<!-- 최상단 이동 버튼 -->
		<script src="${cpath }/js/moveTopBtn.js"></script>
		
		<!-- 인증번호 받기 -->
		<script src="${cpath }/js/verificationCode.js"></script>

	</div>
</body>
</html>