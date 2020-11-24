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
</script>

<!-- 2020년 8월 12일 ~ 13일 작업 -->
<!-- 후기 수정 및 취소하기 폼 -->
<script src="${cpath }/js/reviewsForm.js?ver=1" type="text/javascript"></script>

<!-- 2020년 8월 12일 작업 -->
<!-- 댓글 수정 폼 -->
<script src="${cpath }/js/RecommentUpdate.js?ver=2" type="text/javascript"></script>

<!-- 2020년 08월 12일 작업 -->
<!-- 답글 달기/접기 폼 -->
<script src="${cpath }/js/recomment.js?ver=3" type="text/javascript"></script>

<script src="${cpath }/js/Lookup.js" type="text/javascript" ></script>
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
							<a href="${cpath }/shop/" class="text-black">Shop</a>	
							<span class="mx-2 mb-0">/</span>
							<!-- 상품 품목별 카테고리 -->
							<strong	class="text-black">${shoes.category } (종류)</strong>
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
										<a href="${cpath }/shoesLookup/${vo.merchanCode }/">
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
							<table onclick="displayNoneAxios()">
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
							<div class="mb-1 mt-2 d-flex">
								추가 이미지 or 설명 etc...
							</div>
						</div>
						<!-- 상품 옵션 선택(우측 하단) -->
						<div class="col-md-5 mt-2" style="padding-top: 1em; margin-top: 2em; border: 1px solid grey;">
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
												
													<input id="itemAmmount" type="text" class="form-control text-center" value="1"
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
										<a href="${cpath }/payment/" class="buy-now btn btn-sm btn-primary">Purchase</a>&nbsp;&nbsp;&nbsp;
										<!-- ajax : 화면 전환 없이 카트에 아이템 담김 -->
										<input type="button" class="buy-now btn btn-sm btn-primary" onclick="axiosAddCart()" value="Add ToCart">
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 후기 & 댓글 -->
				<div class="container mt-3 pt-3" data-aos="fade-up">
					<div class="row">
						<div class="col-md-12 mt-3">
							
							<!-- 리뷰 -->
							<div id="review-con" class="review-container col-md-12">
								<div class="single-review-wrapper p-3">
									<!-- 제목 & 내용 -->
									<h3 id="review">상품후기</h3>
									<div class="single-review mt-2">
										<c:if test="${not empty vo }">
										<div class="reviewRead-reviewlist">
										<form class="comment" action="${cpath }/board/reviewUpdate/${merchanCode}/${vo.rnum}/" method="POST" enctype="multipart/form-data">
											<div class="first-row">
												<!-- 2020년 8월 19일 수정 -->
												<div class="star col-md-2" style="color: black; font-weight: 700;">No. ${number }</div>
												<div id="rewriter${vo.rnum }" class="title col-md-8">
													<span class="reviewRead-writer">${vo.writer }</span>
												</div>
												<div class="date col-md-2 reviewRead-registDate"><fmt:formatDate value="${vo.registDate }" pattern="yyyy.MM.dd"/></div>
											</div>  
											<div class="second-row mt-2">
												<div id="rereview${vo.rnum }" class="reviewRead-review">${vo.context }</div>
											</div>
											<!-- 2020년 8월 19일 수정 -->
											<c:if test="${vo.img ne null }">
												<div class="third-row mt-2">
													<div id="reimg${vo.rnum }" class="review-photo-wrapper col-xs-3">
														<img src="${cpath }/img/${vo.img}">
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
										<!-- 2020년 08월 18일 수정 -->
										<!-- 2020년 08월 19일 수정 -->
										<c:if test="${not empty login }">
											<c:if test="${login.name eq vo.writer or login.name eq '관리자' }">
												<div class="forth-row mt-2">
													<button id="rebutton${vo.rnum }" type="button" class="btn update-btn" 
														onclick="reviews('${vo.rnum}', '${merchanCode}', '${cpath}', '${vo.writer}', '${vo.context}', '${vo.img }')">
														수정
													</button>&nbsp;&nbsp;
													<div id="recancel${vo.rnum }" style="display: inline-block;"></div>
													<button class="btn delete-btn" onclick="${cpath }/board/deleteReviews/${merchanCode}/${vo.rnum}/">삭제</button>
													<input style="margin-left: 10px;" class="btn delete-btn" type="button" value="돌아가기" onclick="location.href='${cpath}/shoesLookup/${merchanCode }/'">
												</div>
											</c:if>
										</c:if>
										<c:if test="${empty login }">
											<input class="reviewRead-input forth-row mt-2 btn delete-btn" type="button" value="돌아가기" onclick="location.href='${cpath}/shoesLookup/${merchanCode }/'">
										</c:if>
										</form>
										</div>
										
										<h3>댓글</h3>
										<!-- 댓글에 대한 폼 -->
										<div>
										<div class="single-comment mt-3 pr-3 pl-3">
											<div class="comment-code col-md-1">번호</div>
											<div class="comment-content col-md-8">댓글</div>
											<div class="comment-writer col-md-2">작성자(이메일)</div>
											<div class="comment-date col-md-1">날짜</div>
										</div>
										<c:forEach var="vo2" items="${list }" varStatus="st">
											<c:if test="${vo.rnum eq vo2.rnum}">
												<form method="POST" action="${cpath }/board/recommentUpdate/${merchanCode}/${vo2.rnum}/${number}/">
												<div class="single-comment mt-3 pr-3 pl-3" style="margin-left: <c:out value="${20*vo2.redepth }px;" />">
													<div class="comment-code col-md-1">${vo2.renum }</div>
													<div id="renum${vo2.renum }"></div>
													<div id="context${vo2.renum }" class="comment-content col-md-8">${vo2.context }</div>
													<div id="writer${vo2.renum }" class="comment-writer col-md-2">${vo2.writer }</div>
													<div class="comment-date col-md-1"><fmt:formatDate value="${vo2.registDate }" pattern="yyyy.MM.dd"/></div>
												</div>
												<div class="edit-comment pr-3 mt-0">
													<button class="reviewRead-replybutton" id="button${st.index }" type="button" onclick="addrecomment('${vo2.renum}', '${st.index }')"><span class="insert-recomment">답글달기</span></button>
													<button class="reviewRead-replybutton" type="button" onclick="recommentUpdate('${vo2.renum}', '${vo2.context }', '${vo2.writer }')">
														<span id="update${vo2.renum }" class="update-comment">수정</span>
													</button>&nbsp;&nbsp;/&nbsp;&nbsp;
													<div id="updatecancel${vo2.renum }" class="update-comment" style="display: inline-block;"></div><span id="span${vo2.renum}" style="display: none;">&nbsp;&nbsp;/&nbsp;&nbsp;</span>				
													<button class="reviewRead-replybutton" type="button" onclick="location.href='${cpath}/board/deleteRecomment/${vo2.rnum }/${merchanCode }/${vo2.renum}/${number}/'"><span class="delete-comment">삭제</span></button>
												</div>
												</form>
												<div id="recomment${st.index }">
													<form id="form" action="${cpath }/board/recomment/${merchanCode}/${vo2.rnum}/${number}/" method="POST">
													</form>
												</div>
											</c:if>
										</c:forEach>
										<!-- 2020년 08월 18일 수정 -->
										<c:if test="${not empty login }">
											<form class="single-comment-wrapper" method="POST">
											<div class="pr-3 pl-3">
												<div class="recomment-form pt-2 pb-2">
													<div class="col-md-11">
														<input type="hidden" name="rnum" value="${vo.rnum }">
														<input class="reviewRead-reco-writer" type="text" name="writer" placeholder="작성자">
														<input class="reviewRead-reco-writer2 recomment-input col-md-12" type="text" name="context" placeholder="댓글" maxlength="100">
													</div>
													<div style="width: 100px; text-align: right">
													<button class="recomment-btn reviewRead-btn2">댓글달기</button>
													</div>
												</div>
											</div>
											</form>
										</c:if>
										</div>
										<!-- 페이징 아이콘 : active(활성화 표시)-->
										<!-- 2020.08.07 -->
										<div class="row" data-aos="fade-up">
											<div class="col-md-12 text-center">
												<div class="site-block-27">
													<c:if test="${prev }">
														<a href="${cpath }/board/reviewRead/${begin - 1}/${vo.rnum }/${merchanCode }/${number}/">◀</a>
													</c:if>
													<c:forEach var="i" begin="${begin}" end="${end}">
													<c:if test="${i == page }">
														<span class="reviewRead-paging-span2">[${i }]</span>
													</c:if>
													<c:if test="${i != page }">
														<a href="${cpath }/board/reviewRead/${i }/${vo.rnum }/${merchanCode }/${number}/">
															<span class="reviewRead-paging-span">[${i }]</span>
														</a>
													</c:if>
													</c:forEach>
													<c:if test="${next }">
														<a href="${cpath }/board/reviewRead/${end + 1}/${vo.rnum }/${merchanCode }/${number}/">▶</a>
													</c:if>
												</div>
											</div>
										</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
		<!-- 추천 상품 -->
		<div class="owl-carousel owl-theme">
 			<div class="item"><h4>1</h4></div>
 			<div class="item"><h4>2</h4></div>
 			<div class="item"><h4>3</h4></div>
 			<div class="item"><h4>4</h4></div>
 		</div>

		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</div>

	<script src="${cpath }/js/customCarousel.js"></script>
	<script src="${cpath }/js/jquery-3.3.1.min.js"></script>
	<script src="${cpath }/js/jquery-ui.js"></script>
	<script src="${cpath }/js/popper.min.js"></script>
	<script src="${cpath }/js/bootstrap.min.js"></script>
	<script src="${cpath }/js/owl.carousel.min.js"></script>
	<script src="${cpath }/js/jquery.magnific-popup.min.js"></script>
	<script src="${cpath }/js/aos.js"></script>
	<script src="${cpath }/js/review.js"></script>
	<script src="${cpath }/js/main.js"></script>
	<script src="${cpath }/js/moveScroll.js"></script>

	<!-- 2020-08-04 추가 (조재일) -->
	<script type="text/javascript">
		var quantityInputText = document.getElementById('itemAmmount');
		quantityInputText.addEventListener('click', () => {
			if (document.getElementById('shoesSize').value === 'Size') {
				alert('사이즈를 선택해주세요.');
				document.getElementById('shoesSize').focus();
			}
		});
	</script>

</body>
</body>
</html>