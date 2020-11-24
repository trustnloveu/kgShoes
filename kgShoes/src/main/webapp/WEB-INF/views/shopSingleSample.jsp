<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop Single</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>

<body>
	
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			
			<!-- 카테고리 -->
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a>
							<span class="mx-2 mb-0">/</span>
							<a href="${cpath }/shop/" class="text-black">Shop</a>	
							<span class="mx-2 mb-0">/</span>
							<!-- 상품 품목별 카테고리 -->
							<strong	class="text-black">Sports(종류)</strong>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div class="site-section">
			<div class="container">
				<div class="row mb-3">
					<div class="col-md-6">
						<img src="${cpath }/images/cloth_1.jpg" alt="Image" class="img-fluid">
					</div>
					
					<div class="col-md-6">
						<h3 class="text-black">상품명(ABC-1234)</h3>
						<p class="mb-2">카테고리 : Running</p>
						<p class="mb-2">브랜드 : Nike</p>
						<p class="mb-2">컬러 : White</p>
						<p class="mb-1">해당 상품의 다른 색상 보기(클릭)</p>
						<div class="mb-2">
							&nbsp;<a href="#"><span class="look-color-btn" style="background-color: blue;"></span></a>
							<a href="#"><span class="look-color-btn" style="background-color: white;"></span></a>
							<a href="#"><span class="look-color-btn" style="background-color: black;"></span></a>
						</div>
						<!-- 사이즈 선택 -->
						<div class="mb-3">
							<p class="mb-1">사이즈</p>
							<table>
								<tr>
									<td>&nbsp;&nbsp;<span class="item-size-span">250</span></td>
									<td><span class="item-size-span">260</span></td>
									<td><span class="item-size-span">270</span></td>
									<td><span class="item-size-span">280</span></td>
									<td><span class="item-size-span">290</span></td>
									<td><span class="item-size-span">300</span></td>
								</tr>
							</table>
						</div>
						<!-- 가격 -->
						<p>
							가격 : <strong class="text-black">Price&nbsp;원</strong>
						</p>
						<!-- 선택 옵션 1 -->
						
<!--컬러(이미지 링크),후기 /// 구매(결제페이지), 장바구니(Modal) -->

					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<!-- 좌측 하단 공간 -->
							<div class="mb-1 mt-2 d-flex">
								추가 이미지 or 설명 etc...
							</div>
						</div>
						<!-- 상품 옵션 선택(우측 하단) -->
						<div class="col-md-6 mt-2" style="padding-top: 1em; margin-top: 2em; border: 1px solid grey;">
							<form action="#" method="GET">
								<div style="display: flex;">
									<!-- 선택 항목(좌측) -->
									<div class="item-left-container">
										<div class="mb-3 d-flex">
											<span class="text-black">선택 상품&nbsp;&nbsp;</span>
										</div>
										<div class="mb-3 d-flex">
											<span class="text-black">선택 사이즈&nbsp;&nbsp;</span>
										</div>
										<div class="mb-3 d-flex">
											<span class="text-black">선택 색상&nbsp;&nbsp;</span>
										</div>
										<div class="mb-3 d-flex">
											<span class="text-black md-2">선택 수량&nbsp;&nbsp;</span>
										</div>
									</div>
									<!-- 선택 옵션(우측) -->
									<div class="item-right-container">
										<div class="mb-3 d-right">
											<div class="text-black">상품명(ABC-1234)</div>
										</div>
										<div class="mb-3 d-right">
											<select class="size-seletor" name="size">
												<option value="250">250</option>
												<option value="260">260</option>
												<option value="270">270</option>
												<option value="280">280</option>
												<option value="290">290</option>
												<option value="300">300</option>
											</select>
										</div>
										<div class="mb-3 d-right">
											<span class="text-black">White</span>
										</div>
										<div class="mb-3 d-right">
											<span class="input-group mb-2" style="max-width: 120px;">
												<span class="input-group-prepend">
													<button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
												</span>
													<input id="itemAmmount" type="text" class="form-control text-center" value="1"
														   aria-label="Example text with button addon"
													   	   aria-describedby="button-addon1">
												<span class="input-group-append">
													<button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
												</span>
											</span>
										</div>
									</div>
								</div>
								<div class="mt-3" style="border-top: 1px solid grey;">
									<!-- 총 금액 -->
									<p class="mt-3">
										<span class="text-black">총 금액 </span>
										<span class="total-price-span"><strong class="text-primary h5">Price&nbsp;원</strong></span>
									</p>
									<!-- 카트 이동 버튼 -->
									<p style="position: relative; float: right; padding-right: 30px;">
										<a href="${cpath }/payment/" class="buy-now btn btn-sm btn-primary">Purchase</a>&nbsp;&nbsp;&nbsp;
										<!-- ajax : 화면 전환 없이 카트에 아이템 담김 -->
										<button class="buy-now btn btn-sm btn-primary">Add ToCart</button>
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="container mt-5">
					<div class="row">
						<div class="item-review col-md-6">
							<button class="review-btn" onclick="#">상품 후기</button>
						</div>
						<div class="item-question col-md-6">
							<button class="question-btn" onclick="#">질의</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
		<!-- 추천 상품 -->
		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>Recommended items for you</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="nonloop-block-3 owl-carousel">
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="${cpath }/images/cloth_1.jpg" alt="Image placeholder" class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Tank Top</a>
										</h3>
										<p class="mb-0">Finding perfect t-shirt</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="${cpath }/images/shoe_1.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Corater</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="${cpath }/images/cloth_2.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Polo Shirt</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="${cpath }/images/cloth_3.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">T-Shirt Mockup</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="${cpath }/images/shoe_1.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Corater</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</div>

	<script src="${cpath }/js/jquery-3.3.1.min.js"></script>
	<script src="${cpath }/js/jquery-ui.js"></script>
	<script src="${cpath }/js/popper.min.js"></script>
	<script src="${cpath }/js/bootstrap.min.js"></script>
	<script src="${cpath }/js/owl.carousel.min.js"></script>
	<script src="${cpath }/js/jquery.magnific-popup.min.js"></script>
	<script src="${cpath }/js/aos.js"></script>

	<script src="${cpath }/js/main.js"></script>

</body>
</body>
</html>