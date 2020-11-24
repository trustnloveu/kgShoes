<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Project AdminPage</title>
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
							<strong class="text-black">AdminPage</strong>
						</div>
					</div>
				</div>
			</div>
			<!-- end header -->
		</header>

		<!-- 관리자 페이지 -->
		<!-- 2020.07.22 -->
		<div class="site-section" id="pageDiv" style="display: none">
			<div class="container">

				<div class="row mb-12">
					<div class="col-md-4 text-center" style="margin-bottom: 3rem">
						<div class="text-black" style="font-size: 36px; font-weight: bold;">상품등록</div>
						<a class="btn" href="${cpath }/putinto/"><img class="img-fluid" src="${cpath }/images/shoes_put.jpg"></a>
					</div>
					<div class="col-md-4 text-center" style="margin-bottom: 3rem">
						<div class="text-black" style="font-size: 36px; font-weight: bold">상품입고</div>
						<a class="btn" href="${cpath }/itemschange/"><img class="img-fluid" src="${cpath }/images/shoes_change.jpg"></a>
					</div>
					<div class="col-md-4 text-center" style="margin-bottom: 3rem">
						<div class="text-black" style="font-size: 36px; font-weight: bold">매출관리</div>
						<a class="btn" href="${cpath }/salesmanage/"><img class="img-fluid" src="${cpath }/images/shoes_money.jpg"></a>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		</div>
	</div>
	
	<script type="text/javascript">

	window.onload = function() {
		
		// 관리자만 접근가능하도록
		var pageDiv = document.getElementById('pageDiv');
		if (${empty login && login.customerCode != 0 }) {
			alert('관리자가 아닙니다');
			location.href = '${cpath }/loginForm/';
			
		}
		pageDiv.style.display = '';
	}
	</script>

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