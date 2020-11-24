<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body>
<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>	
			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
		</header>

		
			<div class="container mt-5">
				<div class="row">

						
					<!-- 카카오 지도 API -->
					<!-- 2020.08-09 -->			
					<div class="col-md-6">
						<div id="map" style="width: 600px; height: 500px;" class="mt-5"></div>	
					</div>
					
					<div class="col-md-6 text-center mt-5 mb-5 text-black">
						<h1>- 찾아 오시는 길 -</h1>
						<p class="mt-5">부산 해운대구 센텀2로 25</p>
					</div>
				</div>

			</div>
		</div>

		<!-- 푸터 -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		
	
		<!--  카카오 지도 API 스크립트 -->
		<!-- API 스크립트 키 : 93335e32fb2e03cdd3dca7198daf9533  -->
		<!-- 2020.08.09 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93335e32fb2e03cdd3dca7198daf9533&libraries=services"></script>
		<script type="text/javascript" src="${cpath }/js/contactMapAPI.js"></script>
		<script>


		</script>
</body>
</html>