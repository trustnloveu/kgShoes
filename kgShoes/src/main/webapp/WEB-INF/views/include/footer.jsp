<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

	<!-- 푸터 -->
	<!-- 2020.07.16 -->
	<!-- 2020.08.03 경로를 include 로 옮겼음 -->
	<footer class="site-footer border-top">
		<div class="container">
			<div class="row">
				<!-- <div class="col-lg-4 mb-5 mb-lg-0"> -->
				<div class="col-lg-3">
					<div class="row">
						<!-- <div class="col-md-12"> -->
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">Navigations</h3>
						</div>
						<div class="col-md-12">
							<ul class="list-unstyled">
								<li><a href="${cpath }/shop/">Shops</a></li>
								<li><a href="${cpath }/board/">Board</a></li>
								<li><a href="${cpath }/about/">About</a></li>
								<li><a href="${cpath }/contact/">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="row">
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">Social</h3>
						</div>
						<div class="col-md-3">
							<ul style="list-style: none; padding-left: 0px">
								<li><a href="https://ko-kr.facebook.com/">
									<img src="${cpath}/images/snsLogo/facebook_logo_476.png" class="img-fluid"></a></li>
								<li><a href="https://twitter.com/?lang=ko">
									<img src="${cpath}/images/snsLogo/twitter_logo_476.png" class="img-fluid"></a></li>
								<li><a href="https://www.instagram.com/?hl=ko">
									<img src="${cpath}/images/snsLogo/Instagram_logo_476.png" class="img-fluid"></a></li>
							</ul>
						</div>
						<div class="col-md-1"></div>					
						<div class="col-md-3">
							<ul style="list-style: none; padding-left: 0px">
								<li><a href="https://www.youtube.com/">
									<img src="${cpath}/images/snsLogo/youtube_logo_476.png" class="img-fluid"></a></li>
								<li><a href="https://www.tumblr.com/">
									<img src="${cpath}/images/snsLogo/tumblr_logo_476.png" class="img-fluid"></a></li>
								<li><a href="https://www.pinterest.co.kr/">
									<img src="${cpath}/images/snsLogo/pinterest_logo_476.png" class="img-fluid"></a></li>
							</ul>
						</div>
					</div>
				</div>

			<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
            <h3 class="footer-heading mb-4">Site Policy</h3>
               <div class="col-md-12">
                  <ul class="list-unstyled">
                     <li><a data-toggle="modal" href="#myModal4">배송상품 처리방침</a></li>
                     <li><a data-toggle="modal" href="#myModal5">교환/반품 처리방침</a></li>
                     <li><a data-toggle="modal" href="#myModal6">개인정보처리방침</a></li>
                  </ul>
               </div>
			</div>
				
				
			<div class="col-md-6 col-lg-3">
				<div class="block-5 mb-5">
					<h3 class="footer-heading mb-4">Contact Info</h3>
					<ul class="list-unstyled">
						<li class="address">부산 해운대구 센텀2로 25 센텀드림월드 11층</li>
						<li class="phone"><a href="#">+82 010-1234-5678</a></li>
						<li class="email">EmailAddress@gmail.com</li>
					</ul>
				</div>

			</div>
		</div>
		<div class="row pt-5 mt-5 text-center">
			<div class="col-md-12">
				<p>
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved
				</p>
			</div>
		</div>
	</div>
	
	
	
	<!-- 상품 배송 정책 내용-->
			<div class="modal" id="myModal4">
				<div class="modal-dialog  text-black">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title">배송상품 처리방침</h1>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>1) 일요일 및 공휴일은 상품배송이 불가능</p>
							<p>2) 10,000원 이상 상품 구매시 배송비 무료</p>
							<p>3) 배송 과정에서 발생하는 하자에 관하여 전액 보상</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		
		
		
		<div class="modal" id="myModal5">
				<div class="modal-dialog text-black">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title">교환/반품 처리방침</h1>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>1) 배송완료 후 15일 이내 무료 교환/반품 가능</p>
							<p>2) 배송 이외의 원인으로 하자가 발생시 교환/반품 불가능
							<p>
							<p>3) 하자가 아닌 고객변심 교환/반품의 경우 교환/반품비 발생</p>
							<p>4) 부분적인 하자의 경우 부분적으로 교체 또는 A/S가 가능</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div class="modal" id="myModal6">
				<div class="modal-dialog text-black">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title">개인정보 처리방침</h1>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>1) 개인정보는 악의적인 목적으로 사용되지 않습니다</p>
							<p>2) 개인정보 수집 목적은 상품 이용 및 구매를 위함입니다</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
	
			
<!-- 최상단 이동버튼 -->
<a href="#" class="btn_move_top">
	<img class="btn_top_icon" src="${cpath }/images/topBtn.png">
</a>
	</footer>
<!-- 최상단 이동 버튼 -->
<script src="${cpath }/js/moveTopBtn.js"></script>
	<script src="${cpath }/js/jquery-3.3.1.min.js"></script>
	<script src="${cpath }/js/jquery-ui.js"></script>
	<script src="${cpath }/js/popper.min.js"></script>
	<script src="${cpath }/js/bootstrap.min.js"></script>
	<script src="${cpath }/js/owl.carousel.min.js"></script>
	<script src="${cpath }/js/jquery.magnific-popup.min.js"></script>
	<script src="${cpath }/js/aos.js"></script>
  	<script src="${cpath }/js/main.js"></script>
</body>
</html>
