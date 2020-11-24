<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
</head>
<body>


		<!-- 경로 줄 -->
		<!-- 2020.08.03 -->
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>

			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span>
							<a href="${cpath }/adminpage/">AdminPage</a><span class="mx-2 mb-0">/</span>
							<strong	class="text-black">PutInto</strong>
						</div>
					</div>
				</div>
			</div>
		</header>
	
		<div class="site-section" id="pageDiv" style="display: none;">
			<div class="container">
			
			<div class="row mb-12">
				<div class="col-md-8 order-2">
					<div class="row ml-2">
						<!-- Bong 09.01 form action 경로 수정 -->
						<form action="${cpath }/putinto/" method="POST" class="col-md-12" enctype="multipart/form-data" id="inputForm">

								<div class="form-group row">
								
									<!-- 상품코드 -->
									<div class="col-md-12">
										<label for="merchan_code" class="text-black">상품코드</label>
										<input type="text" class="form-control" id="merchan_code" name="merchanCode" placeholder="상품코드를 입력하세요" required>
									</div>
								</div>
								<!-- 상품이름 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="merchan_name" class="text-black">상품이름</label>
										<input type="text" class="form-control" id="merchan_name" name="merchanName" placeholder="상품이름을 입력하세요" required>
									</div>
								</div>
								<!-- 상품이미지 -->
								<!-- 이미지 규격에 대한 라벨 적용시키기  : 479 * 340 -->
								<div class="form-group row">
									<div class="col-md-12" id="imageformat">
										<label for="merchan_image" class="text-black">상품이미지 ( 479 * 340 )</label>
										<input type="file" class="form-control" id="merchan_image" name="merchanImage" onchange="TypeCheck(this)" required>
									</div>
									<div style="text-align: center;">
										<img class="col-md-10" id="img-check" style="margin-bottom: 15px; margin-top: 15px">
									</div>
								</div>
								
								
								<!-- 신발 사이즈 -->
								<!-- Bong 사이즈 입력 부분 수정 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="shoe_size" class="text-black">신발 사이즈</label>
										<input type="number" class="form-control" name="quantity250" placeholder="250 사이즈 재고" required>
										<input type="number" class="form-control" name="quantity260" placeholder="260 사이즈 재고" required>
										<input type="number" class="form-control" name="quantity270" placeholder="270 사이즈 재고" required>
										<input type="number" class="form-control" name="quantity280" placeholder="280 사이즈 재고" required>
										<input type="number" class="form-control" name="quantity290" placeholder="290 사이즈 재고" required>
										<input type="number" class="form-control" name="quantity300" placeholder="300 사이즈 재고" required>
									</div>
								</div>
							
								<!-- 상품 재고 -->
							    <!-- Bong 상품 재고 부분 주석 처리 -->
							    <!--  
								<div class="form-group row">
									<div class="col-md-12">
										<label for="quantity" class="text-black">상품재고</label>
										<input type="number" class="form-control" id="quantity" name="quantity" placeholder="상품재고를 입력하세요" required>
									</div>
								</div> -->
								
								
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
										<div class="row" id="brandInput">
										<div class="col-md-8">
											<select id="brand" name="brand" class="form-control">
												<option>== 선택 ==</option>
												<c:forEach items="${brandList }" var="vo">
													<option value="${vo.name }">${vo.name }</option>
												</c:forEach>
<!-- 												<option value="나이키">1. 나이키</option>
												<option value="아디다스">2. 아디다스</option>
												<option value="퓨마">3. 퓨마</option> -->
											</select>
											<input type="hidden" name="brand_icheck" id="brand_icheck" value="off">
										</div>
																			
											<!-- 2020.08.13 브랜드 신규 추가 버튼-->
											<div class="col-md-3">
												<div class="btn btn-primary" onclick="newBrnad()">new brand</div>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 카테고리 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="category" class="text-black">카테고리</label>
										<select id="category" name="category" class="form-control">
											<option>== 선택 ==</option>
											<option value="Leather">1. Leather</option>
											<option value="Running">2. Running</option>
											<option value="Life Style">3. Life Style</option>
										</select>
									</div>
								</div>
								<!-- 상세정보 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="detail_src" class="text-black">상세정보</label>
										<input type="file" class="form-control" id="detail_src" name="detailSrc" required>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-lg-12">
										<input type="submit" class="btn btn-primary btn-lg btn-block"
											value="상품입고">
									</div>
								</div>
						
						</form>
						</div>
					</div>
					
					
				<!-- 왼쪽 사이드바 -->
				<!-- 2020.08.03 -->
				<jsp:include page="/WEB-INF/views/include/adminleftsidebar.jsp" flush="false" />
				
				</div>			
			</div>
   
    <!-- footer -->
	<!-- 2020.08.03 footer를 include로 옮겼음 -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false" />
	</div>
   

	
	
	<!-- 업로드 이미지 크기 관리 및 점검 -->
	<!-- 2020.07.28 -->
	<!-- 2020.08.03 -->
	<script type="text/javascript">

	var img = document.getElementById('merchan_image');
	
	
	window.onload = function() {
		
		// 관리자만 접근가능하도록
		var pageDiv = document.getElementById('pageDiv');
		if (${empty login && login.customerCode != 0 }) {
			alert('관리자가 아닙니다');
			location.href = '${cpath }/loginForm/';
			
		}
		pageDiv.style.display = '';
	}
	
	
	function TypeCheck(obj)

	{			  
		    // 선택파일의 경로를 분리하여 확장자를 구합니다.
		    pathpoint = obj.value.lastIndexOf('.');
		    filepoint = obj.value.substring(pathpoint+1,obj.value.length);
		    filetype = filepoint.toLowerCase();

		    // 확장자가 이미지 파일인 경우에만 작동하도록
		    if(filetype =='jpg' || filetype =='gif' || filetype =='png' || filetype =='jpeg' || filetype =='bmp')

		    {
		        var wwd=479;  //제한할이미지가로사이즈
		        var hhd=340;  //제한할이미지세로사이즈
		

	     		var img = new Image();
			    img.src = URL.createObjectURL(obj.files[0]);
			    
	            img.onload = function () {
	            	
	            	var picwidth = this.width;
	            	var picheight = this.height;
	            	
	            	if(picwidth != wwd || picheight != hhd ) {
	            		alert('이미지 크기가 다릅니다');
	            		var imageformat = document.getElementById('imageformat');
	            		imageformat.innerHTML = '<label for="merchan_image" class="text-black">상품이미지 ( 479 * 340 )</label><input type="file" class="form-control" id="merchan_image" name="merchan_image" onchange="TypeCheck(this)">';
	            		
	            	}
	            	else {
	            		document.getElementById('img-check').setAttribute('src', img.src);
	            	}
	            }	        
		    }
		    
		    else {
		    	alert('이미지 파일이 아닙니다');
		    }
	}
	
	
	// 2020.08.13
	// 브랜드 input 추가시키는 함수
 	function newBrnad() {
		var brandInput = document.getElementById('brandInput');
		// confirm 넣어서 정말로 브랜드 추가할건지 확인부터 시켜주자
		brandInput.innerHTML = 
			'<div class="col-md-12"><input type="text" class="form-control" name="brand" id="brand" placeholder="새로운 브랜드를 입력하세요" required></div>' + 
			'<div class="col-md-12  mt-3" id="brnadimageformat"><label for="brand_image" class="text-black">브랜드 이미지 ( 900 * 1182 )</label>' +
			'<input type="file" class="form-control" id="brand_image" name="brand_image" onchange="BrandTypeCheck(this)" required></div>' +
			'<div style="text-align: center;"><img class="col-md-10" id="brand-img-check" style="margin-bottom: 15px; margin-top: 15px"></div>' +
			'<input type="hidden" name="brand_icheck" id="brand_icheck" value="on"></div>';
	}
	
 	function BrandTypeCheck(obj)

	{			  
		    // 선택파일의 경로를 분리하여 확장자를 구합니다.
		    pathpoint = obj.value.lastIndexOf('.');
		    filepoint = obj.value.substring(pathpoint+1,obj.value.length);
		    filetype = filepoint.toLowerCase();

		    // 확장자가 이미지 파일인 경우에만 작동하도록
		    if(filetype =='jpg' || filetype =='gif' || filetype =='png' || filetype =='jpeg' || filetype =='bmp')

		    {
		        var wwd=900;  //제한할이미지가로사이즈
		        var hhd=1182;  //제한할이미지세로사이즈
		

	     		var img = new Image();
			    img.src = URL.createObjectURL(obj.files[0]);
			    
	            img.onload = function () {
	            	
	            	var picwidth = this.width;
	            	var picheight = this.height;
	            	
	            	if(picwidth != wwd || picheight != hhd ) {
	            		alert('이미지 크기가 다릅니다');
	            		var brnadimageformat = document.getElementById('brnadimageformat');
	            		brnadimageformat.innerHTML = '<label for="brand_image" class="text-black">브랜드 이미지 ( 900 * 1182 )</label><input type="file" class="form-control" id="brand_image" name="brand_image" onchange="BrandTypeCheck(this)">';
	            		
	            	}
	            	else {
	            		document.getElementById('brand-img-check').setAttribute('src', img.src);
	            	}
	            }	        
		    }
		    
		    else {
		    	alert('이미지 파일이 아닙니다');
		    }
	}
	
	
</script>


</body>
</html>