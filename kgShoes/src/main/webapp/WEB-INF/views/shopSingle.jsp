	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
<script type="text/javascript">
	cpath = '${cpath}';
	merchanCode = '${shoes.merchanCode}';
	price = '${shoes.price}';
	
	discRate= '${shoes.discRate}';
	
	if(discRate != 0){
    	price = price - (discRate/100 * price);
    }
	
	console.log(price);
	
</script>
	<script src="${cpath }/js/Lookup.js" type="text/javascript" ></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

	<!-- 2020년 8월 20일 수정 -->
	<!-- 후기 수정 및 취소하기 폼 -->
	<script src="${cpath }/js/reviewsForm.js?ver=1" type="text/javascript"></script>
	
	
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
							<a href="${cpath }/shop/" class="text-black">Shop</a>	
							<span class="mx-2 mb-0">/</span>
							<!-- 상품 품목별 카테고리 -->
							<strong	class="text-black">${shoes.category }</strong>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div class="site-section">
			<div class="container" data-aos="fade-up">
				<div class="row mb-3">
					<div class="col-md-6">
						<img src="${cpath }/img/${shoes.imgSrc }" alt="Image" class="img-fluid">
					</div>
					
					<div class="col-md-6">
						<h3 class="text-black">${shoes.merchanName }</h3>
						<p class="mb-2">카테고리 : ${shoes.category }</p>
						<p class="mb-2">브랜드 : ${shoes.brand }</p>
						
						<c:if test="${not empty shoeColorList }">
						
						<p class="mb-1">해당 상품의 다른 색상 보기(클릭)</p>
							<div class="other-item-color mb-2">&nbsp;
							<c:forEach var="vo" items="${shoeColorList }">
								<ul class="image-bundle">
									<li class="other-img">
										<a href="${cpath }/shopSingle/${vo.merchanCode }/">
											<img src="${cpath }/img/${vo.imgSrc}"/>
										</a>
									</li>
								</ul>
							</c:forEach>
						</div>
						</c:if>
						
						
						
					
						<!-- 사이즈 선택 -->
						<div class="mb-2">
							<p class="mb-2">사이즈</p>
							<table>
								<tr>
									<td>&nbsp;&nbsp;<span id="250span" class="item-size-span">250</span></td>
									<td><span id="260span" class="item-size-span">260</span></td>
									<td><span id="270span" class="item-size-span">270</span></td>
									<td><span id="280span" class="item-size-span">280</span></td>
									<td><span id="290span" class="item-size-span">290</span></td>
									<td><span id="300span" class="item-size-span">300</span></td>
								</tr>
							</table>
						</div>
						<!-- 가격 -->
						<p>
							<!-- 8.4Bong -->
							
							<c:if test="${shoes.discRate == 0 }">
								가격 : <strong class="text-black">${shoes.price }&nbsp;원</strong>
							</c:if>
							<c:if test="${shoes.discRate != 0 }">
								가격 : <strong class="saleDeco" style="color:red;">${shoes.price }&nbsp;</strong>&nbsp;
								<c:set var="price" value="${shoes.price - (shoes.price * shoes.discRate / 100) }"></c:set>
								<strong class="text-black"><fmt:formatNumber value=" ${price }" pattern="####" />&nbsp;원</strong>
							</c:if>
							
						</p>
						<!-- 선택 옵션 1 -->
						
<!--컬러(이미지 링크),후기 /// 구매(결제페이지), 장바구니(Modal) -->

					</div>
				</div>
				<div class="container mt-1">
					<div class="row">
						<div class="col-md-6">
							<!-- 좌측 하단 공간 -->
<!-- 							<div class="mb-1 mt-2 d-flex"> -->
<!-- 								추가 이미지 or 설명 etc... -->
<!-- 							</div> -->
						</div>
						<!-- 상품 옵션 선택(우측 하단) -->
						<div class="col-md-5 mt-2" style="padding-top: 1em; margin-top: 2em; border: 1px solid grey;">
							<!-- 2020.08.06 -->
								<!-- form id 추가 & method POST로 변경 kjm-->
							<form id="reportForm" action="${cpath }/payment/" method="POST">
							<!-- 2020.08.11 -->
							<!--input 추가 -->
							<input type="hidden" name="price" value="${shoes.price }">
							<input type="hidden" name="cartcheck" value="nocart">
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
													<!-- id추가 8.3 김정미 -->
											<div id="merchanName" class="text-black">${shoes.merchanName }</div>
										</div>
										<div class="mb-3 d-right">
												<!-- id추가 8.3 김정미 -->
											<select id="shoesSize" class="size-seletor" name="size" onclick="axiosTest()">
												<option>Size</option>
												<option id="250" value="250">250</option>
												<option id="260" value="260">260</option>
												<option id="270" value="270">270</option>
												<option id="280" value="280">280</option>
												<option id="290" value="290">290</option>
												<option id="300" value="300">300</option>
											</select>
										</div>
										<div class="mb-3 d-right">
											<span class="text-black">White</span>
										</div>
										<div class="mb-3 d-right">
											<span class="input-group mb-2" style="max-width: 120px;">
												<span class="input-group-prepend">
													<!-- 2020-08-03 수정 (조재일) -->
													<button class="btn btn-outline-primary" type="button" onclick="quantityMinus()">-</button>
												</span>
												
													<input id="itemAmmount" name="itemAmmount"  type="text" class="form-control text-center" value="1"
														   aria-label="Example text with button addon"
													   	   aria-describedby="button-addon1" onkeyup="quantityKeydown()">
													 
													 												   	   
												<span class="input-group-append">
													<!-- 2020-08-03 수정 (조재일) -->
													<button class="btn btn-outline-primary" type="button" onclick="quantityPlus()">+</button>
												</span>
											</span>
										</div>
									</div>
								</div>
								<div class="mt-3" style="border-top: 1px solid grey;">
									<!-- 총 금액 -->
									<p class="mt-3">
										<span class="text-black">총 금액 </span>
										<!-- 8.4Bong -->
										<span class="total-price-span">
											<c:if test="${shoes.discRate == 0 }">
												<strong id="priceText" class="text-primary h5 ">${shoes.price }&nbsp;원</strong>
											</c:if>
											<c:if test="${shoes.discRate != 0 }">
												<c:set var="price" value="${shoes.price - (shoes.price * shoes.discRate / 100) }"></c:set>
												<strong id="priceText" class="text-primary h5"><fmt:formatNumber value="${price }" pattern="####" />&nbsp;원</strong>
											</c:if>
										</span>
									</p>
									<!-- 카트 이동 버튼 -->
									<p style="position: relative; float: right; padding-right: 30px;">
										<a href="javascript:stockcheck();" class="buy-now btn btn-sm btn-primary">Purchase</a>&nbsp;&nbsp;&nbsp;
										<!-- ajax : 화면 전환 없이 카트에 아이템 담김 -->
										<input type="hidden" name="merchanCode" value="${shoes.merchanCode}">
										<input type="button" class="buy-now btn btn-sm btn-primary" onclick="axiosAddCart()" value="Add To Cart">
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 상품 정보 & 후기 & 댓글 -->
				<div class="container mt-3 pt-3" data-aos="fade-up">
					<!-- 선택 버튼 -->
	               <div class="row mt-3">
	                  <ul class="item-service col-md-12 p-0" style="justify-content: space-between;">
	                     <li class="col-sm-4 p-0"><button class="item_info_btn" onclick="moveScroll('#info-con')"><span>상품정보</span></button></li>
	                     <li class="col-sm-4 p-0"><button class="item_info_btn" onclick="moveScroll('#review-con')"><span>후기</span></button></li>
	                     <li class="col-sm-4 p-0"><button class="item_info_btn" onclick="moveScroll('#recommended-con')"><span>추천상품</span></button></li>
	                  </ul>
	               </div>
					
					<div class="row">
						<div class="col-md-12 mt-3">
						
							<!-- 상품 정보 -->
							<div id="info-con" class="item-info-container col-md-12 mb-2">
								<div class="item-info p-3">
									<img src="${cpath }/img/${shoes.detailSrc }" alt="Image" class="img-fluid">
								</div>
							</div>
							
								<!-- 리뷰 -->
							<div class="shopSingle-review-fold" id="review-fold">
								<div id="review-con" class="review-container col-md-12">
									<!-- 후기 작성 form -->
									<!-- 2020년 08월 18일 수정 -->
									<c:if test="${not empty login}">
										<div class="review-write-form col-md-12 mb-3 pt-2">
											<form method="POST" action="${cpath }/board/reviews/${shoes.merchanCode}" enctype="multipart/form-data">
												<div class="mb-2">
												<h3>후기 작성란</h3>			
												</div>
												<div class="mb-2">
													<!-- 2020년 08월 11일 작업 -->
													<!-- 로그인이 되었다면 -->
													<c:if test="${login.customerCode eq 0 }">
														<input type="text" name="writer" value="관리자" readonly>
														<input type="hidden" name="customerCode" value="0">
													</c:if>
													<c:if test="${login.customerCode ne 0 }">
														<input type="text" name="writer" value="${login.name }" readonly>
														<input type="hidden" name="customerCode" value="${login.customerCode }">
													</c:if>
												</div>
												<div class="mb-2">
													<input class="review-input" type="text" name="context" placeholder="후기를 작성해주세요." maxlength="300">
												</div>
												<div class="mb-2">
													<input type="file" name="itemPhoto" value="사진 선택">
												</div>
												<div class="review-submit mb-2">
													<input type="submit" value="작성 완료">
													<input type="button" value="작성 취소" onclick="history.go(-1)">
												</div>
											</form>
										</div>
									</c:if>
									
									
									<div class="single-review-wrapper p-3">
										<!-- 제목 & 내용 -->
										<h3 id="review">상품후기</h3>
										<div class="single-review mt-2">
											<c:if test="${not empty list }">
												<c:forEach var="vo" items="${list }" varStatus="st">
												<div class="shopSingle-reviewlist">
													<form class="comment" action="${cpath }/board/reviewUpdate/${merchanCode}/${vo.rnum}/" method="POST" enctype="multipart/form-data">
														<div class="first-row">
															<div class="star col-md-2" style="color: black; font-weight: 700;">No. ${st.count + no }</div>
															<div id="rewriter${vo.rnum }" class="title col-md-8">
																<span class="shopSingle-writer">${vo.writer }</span>
															</div>
															<div class="date col-md-2 shopSingle-registDate"><fmt:formatDate value="${vo.registDate }" pattern="yyyy.MM.dd"/></div>
														</div>  
														<div class="second-row mt-2">
															<div id="rereview${vo.rnum }" class="shopSingle-review">${vo.context }</div>
														</div>
														<c:if test="${vo.img ne null }">	<!-- 이미지가 존재하면 이미지 출력-->
															<div class="third-row mt-2">
																<div id="reimg${vo.rnum }" class="review-photo-wrapper col-xs-3">
																	<img src="${cpath }/reviewImg/${vo.img}">
																</div>
															</div>
														</c:if>
														<c:if test="${vo.img eq null }">
															<div class="third-row mt-2">
																<div id="reimg2${vo.rnum }" class="review-photo-wrapper col-xs-3">
																	<span id="span2" style="color: black; font-weight: 700;">이미지가 없습니다.</span>
																</div>
															</div>
														</c:if>
														<!-- 후기 수정 & 삭제 버튼 -->
														<!-- 2020.08.20 수정 -->
														<c:if test="${not empty login }">
															<c:if test="${login.customerCode eq vo.customerCode or login.customerCode eq 0 }">
																<div class="forth-row mt-2">
																	<button id="rebutton${vo.rnum }" type="button" class="btn update-btn" 
																		onclick="reviews('${vo.rnum}', '${merchanCode}', '${cpath}', '${vo.writer}', '${vo.context}', '${vo.img }')">
																		수정
																	</button>&nbsp;&nbsp;
																	<div id="recancel${vo.rnum }" style="display: inline-block;"></div>
																	<a class="btn delete-btn shopSingle-btn" href="${cpath }/board/deleteReviews/${merchanCode}/${vo.rnum}/">삭제</a>
																	<input style="margin-left: 10px;" class="btn delete-btn" type="button" value="돌아가기" onclick="location.href='${cpath}/shoesLookup/${merchanCode }/'">
																</div>
															</c:if>
														</c:if>
													</form>
												</div>
							
												</c:forEach>
											</c:if>
											<c:if test="${empty list }">
												<span>작성된 후기가 없습니다</span>
											</c:if>
										</div>
									</div>
								</div>
							
								<!-- 2020.08.07 -->
								<!-- 후기에 대한 페이징 -->
								<div class="row" data-aos="fade-up">
									<div class="col-md-12 text-center">
										<div class="site-block-27">
											<c:if test="${prev }">
												<a href="${cpath }/shopSingle/${begin - 1}/${shoes.merchanCode}/">◀</a>
											</c:if>
											<c:forEach var="i" begin="${begin}" end="${end}">
											<c:if test="${i == page }">
												<span class="shopSingle-paging-span2">[${i }]</span>
											</c:if>
											<c:if test="${i != page }">
												<a href="${cpath }/shopSingle/${i }/${shoes.merchanCode}/">
													<span id="shopSingle-page" class="shopSingle-paging-span">[${i }]</span>
												</a>
											</c:if>
											</c:forEach>
											<c:if test="${next }">
												<a href="${cpath }/shopSingle/${end + 1}/${shoes.merchanCode}/">▶</a>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							
						<!-- 추천 상품 --><!-- 8.7Bong -->
						<!-- end 4 -->
						<div id="recommended-con" class="recommend-wrap" style="text-align: center; margin-top:30px;">
							<h2 style="color: #9b59b6;">추천 상품</h2>
						
						<div class="d-flex p-2" style="display: inline-block; text-align: center; background-color: #f1f2f6; justify-content: space-between;">
							<c:forEach var="rc" items="${brandList }" end="4">
								<div class="item" style="width:208px; height:390px; display: inline-block;">
									<div class="block-4 text-center" style="height:390px; vertical-align: middle;">
										<figure class="block-4-image" >
										<a href="${cpath }/shopSingle/${rc.merchanCode }/">
										
											<img src="${cpath }/img/${rc.imgSrc}" alt="Image placeholder"
												class="img-fluid">
										</a>
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a class="merchanName" href="${cpath }/shopSingle/${rc.merchanCode }/">${rc.merchanName}</a>
											</h3>
											<p class="mb-0">${rc.brand }</p>
											<c:if test="${rc.discRate == 0 }">
												<p class="text-primary font-weight-bold"><fmt:formatNumber value="${rc.price }" pattern="#,###" /><span style="font-size: 85%"> 원</span></p>
											</c:if>
											<c:if test="${rc.discRate != 0 }">
												<c:set var="price" value="${rc.price - (rc.price * rc.discRate / 100) }"></c:set>
												<p class="text-primary font-weight-bold">
													<span class="saleDeco"><fmt:formatNumber value="${rc.price }" pattern="#,###" /><span style="font-size: 85%"> 원</span></span><br>
													<span class="salePrice"><fmt:formatNumber value=" ${price }" pattern="#,###" /><span style="font-size: 85%"> 원</span></span>
												</p>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
 							</div>
 							</div>
							<!-- recommend-wrap -->
						</div>
					</div>
				</div>
			</div>
		</div>
	
	

		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</div>

	<script src="${cpath }/js/customCarousel.js"></script>
	<script src="${cpath }/js/jquery-3.3.1.min.js"></script>
	<script src="${cpath }/js/jquery-ui.js"></script>
	
	<script src="${cpath }/js/bootstrap.min.js"></script>
	<script src="${cpath }/js/owl.carousel.min.js"></script>
	<script src="${cpath }/js/jquery.magnific-popup.min.js"></script>
	<script src="${cpath }/js/aos.js"></script>
	<script src="${cpath }/js/review.js"></script>
	<script src="${cpath }/js/main.js"></script>
	<script src="${cpath }/js/moveScroll.js"></script>
	<!-- 8.7Bong -->
	<script src="${cpath }/js/merchanNameBRSingle.js"></script>

	<!-- 2020-08-04 추가 (조재일) -->
	<script type="text/javascript">
	displayNoneAxios();
		var quantityInputText = document.getElementById('itemAmmount');
		quantityInputText.addEventListener('click', () => {
			if (document.getElementById('shoesSize').value === 'Size') {
				alert('사이즈를 선택해주세요.');
				document.getElementById('shoesSize').focus();
			}
		});
	</script>



</body>

</html>