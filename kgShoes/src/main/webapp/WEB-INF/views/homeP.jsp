<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
   <title>Project</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- CSS link -->
   <%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>

<body>
   <div class="site-wrap">
      <header class="site-navbar" role="banner">
         <!-- 타이틀 로고 -->
         <%@ include file="/WEB-INF/views/include/logo.jsp"%>
         <hr class="mb-0 mt-0" style="border-bottom: 1px solid rgba(0, 0, 0, 0.1)">
         <!-- 메뉴 -->
         <%@ include file="/WEB-INF/views/include/navbar.jsp"%>
         <hr class="mb-0 mt-0" style="border-bottom: 1px solid rgba(0, 0, 0, 0.1)">
      </header>


      <!-- 배너 -->      
      <!-- bg-light -->            
      <%@ include file="/WEB-INF/views/include/banner.jsp" %>

      <!-- 카테고리 -->
      <!-- bg-none -->
      <%@include file="/WEB-INF/views/include/categoryDisplay.jsp" %>

     <!-- 추천 상품 -->
     <!-- bg-light -->
      <%@include file="/WEB-INF/views/include/recommandItem.jsp" %>


      <!-- 이벤트(미정) -->
      <!-- bg-none -->
      

	   <!-- 이용안내 -->
      <!-- bg-none -->
      <%@include file="/WEB-INF/views/include/guidance.jsp" %>

      <!-- 푸터 -->
      <%@ include file="/WEB-INF/views/include/footer.jsp"%>
   </div>


	<script type="text/javascript">
	$("#Featured").owlCarousel({
	    margin:0,
	    loop:true,
	    autoWidth:true,
	    items:5,
	    autoplay:true,
	    autoplayTimeout:3000,
	    autoplayHoverPause:true
	})
	</script>
   
   <script src="js/jquery-3.3.1.min.js"></script>
   <script src="js/jquery-ui.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/jquery.magnific-popup.min.js"></script>
   <script src="js/aos.js"></script>

   <script src="js/main.js"></script>
   <script src="js/main-banner-slide.js"></script>

</body>
</html>