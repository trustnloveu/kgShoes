<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	cpath = '${cpath}';
</script>
<script type="text/javascript" src="${cpath }/js/cart.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

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
							<strong class="text-black">Cart</strong>
						</div>
					</div>
				</div>
			</div>
			<!-- end header -->
		</header>
		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<form id="cartForm" class="col-md-12" action="${cpath }/cartPayment/" method="POST">
					<input type="hidden" name="cartcheck" value="cart">
						<div class="site-blocks-table">
							<table class="table table-bordered">
							<!-- 2020-08-06 forEach부분 전체 수정(조재일) -->
								<c:forEach var="viewVO" items="${viewList }">
									<tr id="${viewVO.merchanCode }*${viewVO.shoeSize }">	
										<!-- 상품 이미지 -->
										<td class="product-thumbnail">
											<img src="${cpath }/img/${viewVO.imgUrl }" alt="Image" class="img-fluid">
										</td>
										<!-- 상품 이름 -->
										<td class="product-name">
											<h2 class="h5 text-black">${viewVO.merchanName }</h2>
											<h2 class="h5 text-black">사이즈 : ${viewVO.shoeSize }</h2>
										</td>
										<!-- 단품 가격 -->
										<td>
											${viewVO.singlePrice }&nbsp;원
										</td>
										<!-- 수량 선택 -->
										<td>
											<div class="input-group mb-3" style="max-width: 120px;">
												<div class="input-group-prepend">
													<button class="btn btn-outline-primary" type="button" onclick="quantityMinus('${viewVO.merchanCode }', '${viewVO.shoeSize }', '${viewVO.singlePrice }')">-</button>
												</div>
												<input id="${viewVO.merchanCode }*${viewVO.shoeSize }Ammount" name="ammount" type="text" class="form-control text-center" value="${viewVO.amount }"
													   aria-label="Example text with button addon"
													   aria-describedby="button-addon1" onkeyup="quantityKeyup('${viewVO.merchanCode }', '${viewVO.shoeSize }', '${viewVO.singlePrice }')">
												<div class="input-group-append">
													<button class="btn btn-outline-primary" type="button" onclick="quantityPlus('${viewVO.merchanCode }', '${viewVO.shoeSize }', '${viewVO.singlePrice }')">+</button>
												</div>
											</div>
										</td>
										<!-- 총 가격(수량합) -->
										<td id="${viewVO.merchanCode }*${viewVO.shoeSize }price" class="merchanPrice">
											${viewVO.totalPrice } 원
										</td>
										<!-- 삭제 버튼 / delete 기능 필요 -->
										<td>
											<input type="button" class="btn btn-primary btn-sm" onclick="itemDelete('${viewVO.merchanCode }', '${viewVO.shoeSize }')" value="상품 제거">
										</td>
									</tr>
									<input type="hidden" name="merchanCode" value="${viewVO.merchanCode }">
									<input type="hidden" name="merchanName" value="${viewVO.merchanName }">
									<input type="hidden" name="shoesize" value="${viewVO.shoeSize }">
									<input type="hidden" name="price" value="${viewVO.totalPrice }">
									<input type="hidden" name="totalPrice" value="${totalPrice }">
								</c:forEach>
							</table>
						</div>
					</form>
				</div>
				
				<!-- 마일리지 or 쿠폰 -->
				<div class="row">
				<div class="col-md-6">
						
					</div>
				
					
					<div class="col-md-6 pl-5" >
						<div class="row justify-content-end">
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-12 text-right border-bottom mb-5">
										<h3 class="text-black h4 text-left mb-2">상품 총 가격</h3>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-md-6">
										<span class="text-black">최종가</span>
									</div>
									<div class="col-md-6 text-right">
												
										<strong class="text-black" id="resultPrice">${totalPrice } 원</strong>
									
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
									<!-- 결제창 이동 -->
									<c:if test="${totalPrice != '0'}">
										<button class="btn btn-primary btn-lg py-3 btn-block" type="submit" form="cartForm">
											결제하기
										</button>
									</c:if>
									<!-- 상품리스트 이동 -->
										<button class="btn btn-outline-primary btn-sm btn-block" onclick="window.location='${cpath}/shop/'">
											쇼핑 계속하기
										</button>
									</div>
								</div>
								
							</div>
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