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
					<div class="col-md-8 order-2">
						<div class="row ml-2"> 
							<form action="#" method="post" class="col-md-12"> 
								<div class="form-group row">
									<!-- 상품코드 -->
									<div class="col-md-12">
										<label for="merchan_code" class="text-black">상품코드</label> 
										<input type="text" class="form-control" id="merchan_code" name="merchan_code" 
											   placeholder="상품코드를 입력하세요" required>
									</div>
								</div>
								<!-- 상품이름 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="merchan_name" class="text-black">상품이름</label> 
										<input type="text" class="form-control" id="merchan_name"
											   name="merchan_name" placeholder="상품이름을 입력하세요" required>
									</div>
								</div>
								
								<!-- 상품이미지 -->
								<!-- 이미지 규격에 대한 라벨 적용시키기  : 479 * 340 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="merchan_image" class="text-black">상품이미지</label> 
										<input type="file" class="form-control" id="merchan_n" name="merchan_n" value=" 여기에 이미지를 업로드하세요" required>
									</div>
								</div>
								<!-- 상품가격 -->
								<!-- 숫자 천단위 콤마 적용시키기 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="price" class="text-black">상품가격</label> 
										<input type="number" class="form-control" id="price" name="price" placeholder="상품가격을 입력하세요" required>
									</div>
								</div>
								<!-- 브랜드 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="brand" class="text-black">브랜드</label> 
										<select id="brand" name="brand" class="form-control">
											<option>== 선택 ==</option>
											<option>1. 나이키</option>
											<option>2. 아디다스</option>
											<option>3. 퓨마</option>
										</select>
									</div>
								</div>
								<!-- 카테고리 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="category" class="text-black">카테고리</label>
										<select id="category" name="category" class="form-control">
											<option>== 선택 ==</option>
											<option>1. 장화</option>
											<option>2. 운동화</option>
											<option>3. 샌들</option>
										</select>
									</div>
								</div>
								<!-- 상세정보 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="detail_src" class="text-black">상세정보</label> 
										<input type="file" class="form-control" id="detail_src" name="detail_src" value=" 여기에 이미지를 업로드하세요">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-12">
										<input type="submit" class="btn btn-primary btn-lg btn-block" value="상품입고">
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- 왼쪽 사이드바 1 -->
					<!-- 2020.07.20 -->
					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1">
									<a href="${cpath }/putinto/" class="d-flex">
										<span>상품입고</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="${cpath }/itemschange/" class="d-flex"> 
										<span>상품변경</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="#" class="d-flex"> 
										<span>매출관리</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="#" class="d-flex">
										<span>고객관리</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
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