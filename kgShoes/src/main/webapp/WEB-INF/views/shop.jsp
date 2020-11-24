<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Project Join</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>

<script type="text/javascript">
	cpath = '${cpath}';	// js파일에서는 ${cpath}가 안되기 때문에 변수에다 ${cpath}를 저장하고 그 변수를 넘긴다
</script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<body>
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp" %>

			<!-- 메뉴 -->
      		<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

			<!-- 카테고리 -->
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span><strong	class="text-black">Shop</strong>${brandList }
						</div>
					</div>
				</div>
			</div>
		<!-- end header -->
		</header>

		<!-- 상품 리스트 -->
		<div class="site-section pt-3">
			<div class="container">
						<!-- 상단 정렬바 -->
						<div class="row">
							<div class="col-md-12 mb-2">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">Items > ${category } </h2>
								</div>
								
								<div class="d-flex float-md-right">
									
									<!-- 이름&가격 순 정렬 -->
									<div class="dropdown mr-1 ml-md-auto">
									 								
										<button type="button" class="btn btn-secondary btn-sm dropdown-toggle ml-1"
												id="dropdownMenuReference" role="button" data-toggle="dropdown">정렬
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
											<form class="sort" method="POST" action="${cpath }/shop/">
												<input type="hidden" name="sort" value="registDate">
												<input class="dropdown-item" type="submit" value="최신 상품">
											</form> 
											
											<form class="sort" method="POST" action="${cpath }/shop/">
												<input type="hidden" name="sort" value="merchanName">
												<input class="dropdown-item" type="submit" value="상품이름 순">
											</form>
											
											<form class="sort" method="POST" action="${cpath }/shop/">
												<input type="hidden" name="sort" value="priceAsc">
												<input class="dropdown-item" type="submit" value="가격 낮은 순">
											</form>
											
											<form class="sort" method="POST" action="${cpath }/shop/">
												<input type="hidden" name="sort" value="priceDesc">
												<input class="dropdown-item" type="submit" value="가격 높은 순">
											</form>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>

				<div class="row mb-5">
					<div class="col-md-9 order-2">

						
						
						<!-- 아이템 뷰(반복문 4 x 3) -->
						<div class="row mb-5">
						<c:forEach var="vo" items="${list }">
							<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
								<div class="block-4 text-center border" style="width: 260px; height: 460px; overflow: auto;">
									
									<!-- 8.4Bong 할인율 -->
									
									<c:if test="${vo.discRate != 0}">
										<div class="discount"><p class="dis_p">${vo.discRate } %</p></div>
									</c:if>

									<!-- 이미지 -->
									<figure class="block-4-image" style="width: 250px; height: 250px; display: flex; 
											justify-content: center; align-items: center; margin: auto;">
										<a href="${cpath }/shopSingle/${vo.merchanCode }/">
											<img src="${pageContext.request.contextPath }/img/${vo.imgSrc }" 
												alt="Product Image" class="img-fluid" >
										</a>
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a class="merchanName" href="${cpath }/shopSingle/${vo.merchanCode }/">${vo.merchanName }</a>
										</h3>
										<p class="mb-0">${vo.brand }</p>
										
										<c:if test="${vo.discRate == 0 }">
											<p class="text-primary font-weight-bold"><fmt:formatNumber value="${vo.price }" pattern="#,###" />원</p>
										</c:if>
										<c:if test="${vo.discRate != 0 }">
											<c:set var="price" value="${vo.price - (vo.price * vo.discRate / 100) }"></c:set>
											<p class="text-primary font-weight-bold">
												<span class="saleDeco"><fmt:formatNumber value="${vo.price }" pattern="#,###" />원</span><br>
												<span class="salePrice"><fmt:formatNumber value="${price }" pattern="#,###" />원</span>
											</p>
											
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
						
						<!-- 페이징 아이콘 : active(활성화 표시)-->
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
								<ul>
									<c:if test="${prev }">
										<li><a href="${cpath }/shop/${begin - 1}/">&lt;</a></li>
									</c:if>
									<c:forEach var="i" begin="${begin}" end="${end}">
										<c:if test="${i == page or i == 0}">
											<li class="active"><span><a href="${cpath }/shop/${i }/">${i }</a></span></li>
										</c:if>
										<c:if test="${i != page }">
											<li><span><a href="${cpath }/shop/${i }/">${i }</a></span></li>
										</c:if>
									</c:forEach>
									<c:if test="${next }">
										<li><a href="${cpath }/shop/${end + 1}/">&gt;</a></li>
									</c:if>
								</ul>
								</div>
							</div>
						</div>
					<!-- end Item-List -->
					</div>
					
					<!-- 왼쪽 사이드바 1 : 상품군 필터 --><!-- 7.28 -->
					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4" style="overflow: auto;">
							<h3 class="mb-3 h6 text-uppercase text-black d-block" onclick="getQuantityByCategory()">Categories</h3>
							
							<ul class="list-unstyled mb-0">
								
								<li class="mb-1">
									<span class="shoesCategory"><!-- 8.4Bong -->
										<a class="allShop" href="${cpath }/shop/">All&nbsp;(${allQuantity }) </a>		
									</span>
								</li>
								
								<li class="mb-1">
								<form method="GET" action="${cpath }/shop/1/">
									<span class="shoesCategory">
									<input type="hidden" name="category" value="Leather">
									<input class="ghost-btn d-flex" type="submit" value="Leather (${leatherQuantity })">
									</span>
								</form>
									
								</li>
								
								<li class="mb-1">
								<form method="GET" action="${cpath }/shop/1/">
								<span class="shoesCategory">
									<input type="hidden" name="category" value="Running">
									<input class="ghost-btn d-flex" type="submit" value="Running (${runningQuantity })">
								</span>
								</form>
								</li>
								<li class="mb-1">
									<form method="GET" action="${cpath }/shop/1/">
									<span class="shoesCategory">
									<input type="hidden" name="category" value="Life Style">
									<input class="ghost-btn d-flex" type="submit" value="Life Style (${lifestyleQuantity })">
									</span>
									</form>
								</li>
								<li class="mb-1">
									<form method="GET" action="${cpath }/shop/1/">
									<span class="shoesCategory">
									<input type="hidden" name="category" value="ETC">
									<input class="ghost-btn d-flex" type="submit" value="ETC (${etcQuantity })">
									</span>
									</form>								
								</li>
								
							</ul>
						</div>
						<!-- 왼쪽 사이드바 2 : 사이즈 필터 -->
						<div class="border p-4 rounded mb-4" style="overflow: auto;">
						
							<!-- 가격 필터 : 미구현 --><!-- 8.7Bong 가격 필터 주석 -->
<!-- 							<div class="mb-4"> -->
<!-- 								<h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3> -->
<!-- 								<div id="slider-range" class="border-primary"></div> -->
<!-- 								<input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" /> -->
<!-- 							</div> -->
							
							<!-- 사이즈 필터 -->
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Brand</h3>
								
								
								<!-- 8.7 Bong 브랜드 -->
								<!-- A~C그룹 -->
								<c:if test="${not empty brandAtoC }">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_1" role="button" 
		                                 aria-expanded="false" aria-controls="brand_1">A ~ C
		                           </button>
		                           <div class="collapse mt-1" id="brand_1">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                 <c:forEach items="${brandAtoC }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>
		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        <!-- D~F그룹 -->
		                        <c:if test="${not empty brandDtoF}">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_2" role="button" 
		                                 aria-expanded="false" aria-controls="brand_2">D ~ F
		                           </button>
		                           <div class="collapse mt-1" id="brand_2">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                 <c:forEach items="${brandDtoF }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>
		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        <!-- G~I그룹 -->
								<c:if test="${not empty brandGtoI}">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_3" role="button" 
		                                 aria-expanded="false" aria-controls="brand_3">G ~ I
		                           </button>
		                           <div class="collapse mt-1" id="brand_3">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                 <c:forEach items="${brandGtoI }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>
		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        
		                        
		                        <!-- J~L그룹 -->
		                        <c:if test="${not empty brandJtoL}">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_4" role="button" 
		                                 aria-expanded="false" aria-controls="brand_4">J ~ L
		                           </button>
		                           <div class="collapse mt-1" id="brand_4">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                 <c:forEach items="${brandJtoL }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>
		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        <!-- M~O그룹 -->
		                        <c:if test="${not empty brandMtoO}">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_5" role="button" 
		                                 aria-expanded="false" aria-controls="brand_5">M ~ O
		                           </button>
		                           <div class="collapse mt-1" id="brand_5">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                <c:forEach items="${brandMtoO }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>
		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        
		                        <!-- P~R그룹 -->
		                        <c:if test="${not empty brandPtoR}">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_6" role="button" 
		                                 aria-expanded="false" aria-controls="brand_6">P ~ R
		                           </button>
		                           <div class="collapse mt-1" id="brand_6">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                <c:forEach items="${brandPtoR }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>
		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        
		                        <!-- S~U그룹 -->
		                        <c:if test="${not empty brandStoU}">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_7" role="button" 
		                                 aria-expanded="false" aria-controls="brand_7">S ~ U
		                           </button>
		                           <div class="collapse mt-1" id="brand_7">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                 <c:forEach items="${brandStoU }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>

		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        <!-- V~Z그룹 -->
		                        <c:if test="${not empty brandVtoZ}">
								<div class="mb-2">
		                           	<button class="col-md-12 btn btn-sm" style="height: 30px; line-height: 0.8em" 
		                                 data-toggle="collapse" href="#brand_8" role="button" 
		                                 aria-expanded="false" aria-controls="brand_8">V ~ Z
		                           </button>
		                           <div class="collapse mt-1" id="brand_8">
		                              <ul class="text-black pl-4" style="display: inline-block; list-style: none; text-align: left; margin-bottom: 0px">
		                                 <c:forEach items="${brandVtoZ }" var="vo">
		                                 	<form method="GET">
		                                 		<input type="hidden" name="brand" value="${vo }">
		                                 		<span class="text-black">
		                                 			<input class="ghost-btn d-flex" type="submit" value="${vo }"> 
		                                 		</span>
		                                 	</form>
		                                 </c:forEach>
		                              </ul>
		                           </div>
		                        </div>
		                        </c:if>
		                        
		                        
		                        
		                        <!-- 8.7브랜드 부분 주석 처리 -->
								
<!-- 								<form method="POST"> -->
<!-- 										<input type="hidden" name="brand" value="Nike"> -->
<!-- 										<span class="text-black"> -->
<!-- 											<input class="ghost-btn d-flex" type="submit" value="Nike"> -->
<!-- 										</span> -->
<!-- 								</form>	 -->
									
<!-- 								<form method="POST"> -->
<!-- 										<input type="hidden" name="brand" value="adidas"> -->
<!-- 										<span class="text-black"> -->
<!-- 											<input class="ghost-btn d-flex" type="submit" value="Adidas"> -->
<!-- 										</span> -->
<!-- 								</form> -->
								
<!-- 								<form method="POST"> -->
<!-- 										<input type="hidden" name="brand" value="Dr.Martens"> -->
<!-- 										<span class="text-black"> -->
<!-- 											<input class="ghost-btn d-flex" type="submit" value="Dr.Martens"> -->
<!-- 										</span> -->
<!-- 								</form> -->
								
<!-- 								<form method="POST"> -->
<!-- 										<input type="hidden" name="brand" value="Josepht"> -->
<!-- 										<span class="text-black"> -->
<!-- 											<input class="ghost-btn d-flex" type="submit" value="Josepht"> -->
<!-- 										</span> -->
<!-- 								</form> -->
								
								
							</div>

							<!-- 정렬 검색 버튼 -->
<!-- 							<div class="filter-search-btn mt-1"> -->
<!-- 								<button class="buy-now btn btn-sm btn-primary">Search</button> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
				
				<!-- 하단 추천 상품(or 목록) -->
				<div class="row">
					<div class="col-md-12">
						<div class="site-section site-blocks-2">
							<div class="row justify-content-center text-center mb-5">
								<div class="col-md-7 site-section-heading pt-4">
									<h2>추천 브랜드</h2>
								</div>
							</div>
							<div class="row">
							
							<c:forEach items="${recommendedBrand }" begin="1" end="3" var="recommendedBrand">
								<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
									<a class="block-2-item" href="${cpath }/shop/1/?brand=${recommendedBrand.name}">
										<figure class="image">
											<img src="${cpath }/brand/${recommendedBrand.uri}" alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>${recommendedBrand.name}</h3>
										</div>
									</a>
								</div>
							</c:forEach>
							
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
<script src="${cpath}/js/getQuantityByCategory.js"></script>
<script src="${cpath}/js/good.js"></script>
<script src="${cpath}/js/merchanNameBR.js"></script>
	<!-- end site-section -->
	</div>
<!-- Footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		
		
	
