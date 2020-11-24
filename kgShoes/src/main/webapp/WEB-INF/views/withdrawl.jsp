<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
</head>
<body>

		<header class="site-navbar mb-2" role="banner">
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span>
							<a href="${cpath }/mypage/">MyPage</a><span class="mx-2 mb-0">/</span>
							<strong	class="text-black">Withdrawl</strong>
						</div>
					</div>
				</div>
			</div>
		</header>
		
	<!-- 회원탈퇴란 -->
	<!-- 2020.08.04 -->	
	<div class="site-section pt-3">
		<div class="container">
			<div class="col-md-12 text-center  mb-3" data-aos="fade-up">
			<h3 style="color: black;">회원탈퇴에 앞서 <span style="color: blue; font-weight: bold;">유의사항 및 안내</span>를  확인하여 주십시오</h3>
			</div>
		</div>
	
		<div class="container">
			<div class="row mb-12">
			<div class="col-md-9 order-2" style="padding: 0" data-aos="fade-up">
				
			<form action="#" method="post" class="col-md-12">
				<div class="col-md-12 mb-5 border" style="padding-left: 30px; padding-top: 20px; padding-bottom: 10px; padding-right: 15px;">
					<div class="row">
						<div class="col-md-10">
							<p style="font-weight: bold; color: black">다음 아이디는 재사용 및 복구 불가능</p>
							<p>회원탈퇴 진행시 본인을 포함한 타인 모두 <span style="color: orange; font-weight: bold;">아이디 재사용이나 복구가 불가능합니다</span></p>
							<p>신중하게 선택하여 결정하시기 바랍니다</p>
						</div>
						<div class="col-md-2 text-center" style="vertical-align: middle; margin: auto 0">
							<input type="checkbox" class="form-control" id="agree1" name="agree1">
							<p style="margin-top: 10px; color:  #0075FF; font-weight: bold;">동의<p>
					</div>
					</div>
				</div>
				<div class="col-md-12 mb-5 border" style="padding-left: 30px; padding-top: 20px; padding-bottom: 10px; padding-right: 15px;">
					<div class="row">
						<div class="col-md-10">
							<p style="font-weight: bold; color: black">내 정보 및 개인형 서비스 이용 기록 삭제 안내</p>
							<p>내 정보 및 개인형 서비스 이용기록이 모두 삭제되며, <span style="color: orange; font-weight: bold;">삭제된 데이터는 복구되지 않습니다</span></p>
							<p>삭제되는 서비스를 확인하시고, 필요한 정보를 보관하시기 바랍니다</p>
								<div class="row mt-3">
										<div class="col-md-3 ml-3">
											<p>메일</p>
										</div>
										<div class="col-md-7">
											<p>메일 계정 및 보관중인 메일 삭제</p>
										</div>
										<div class="col-md-3 ml-3">
											<p>주소록</p>
										</div>
										<div class="col-md-7">
											<p>저장된 주소 삭제 및 주소 업데이트 중단</p>
										</div>
										<div class="col-md-3 ml-3">
											<p>할인권</p>
										</div>
										<div class="col-md-7">
											<p>모든 상품 할인권 정보 삭제</p>
										</div>
										<div class="col-md-3 ml-3">
											<p>구매내역</p>
										</div>
										<div class="col-md-7">
											<p>본 사이트에서 구입한 구매내역 전체 삭제</p>
										</div>										
								</div>							
						</div>
						<div class="col-md-2 text-center" style="vertical-align: middle; margin: auto 0">
							<input type="checkbox" class="form-control" id="agree2" name="agree2">
							<p style="margin-top: 10px; color: #0075FF; font-weight: bold;">동의<p>
					</div>
					</div>
				</div>
				
				
				<div class="col-md-12 mb-5 border" style="padding-left: 30px; padding-top: 20px; padding-bottom: 10px; padding-right: 15px;x">
					<div class="row">
						<div class="col-md-10">
							<p style="font-weight: bold; color: black">게시판형 서비스에 등록한 게시글 삭제 불가 안내</p>
							<p>삭제를 희망하는 게시글은 반드시 회원탈퇴 전에 삭제하시기 바랍니다</p>
							<p>회원탈퇴 후에는 본인확인이 불가능하여<span style="color: orange; font-weight: bold;"> 게시글을 임의로 삭제할 수 없습니다</span> </p>
						</div>
						<div class="col-md-2 text-center" style="vertical-align: middle; margin: auto 0">
							<input type="checkbox" class="form-control" id="agree1" name="agree1">
							<p style="margin-top: 10px; color:  #0075FF; font-weight: bold;">동의<p>
					</div>
					</div>
				</div>
				
				<hr class="mb-5">
				
				<!-- 회원탈퇴 전송란 -->
				<!-- 2020.08.04 type=submit 으로 수정할 예정임 -->
				<div class="col-md-12 text-center">
					<div class="col-md-3"></div>
					<input type="button" value="탈퇴 취소" class="col-md-3 btn btn-light btn-lg border" style="height: 60px; font-weight: bold">
					<input type="button" value="회원 탈퇴" class="col-md-3 btn btn-primary btn-lg" style="font-weight: bold; height: 60px" onclick="Check()">
				</div>
				</form>
			</div>
		
			<!-- 왼쪽 사이드바 -->
			<!-- 2020.08.03 footer를 include로 옮겼음 -->
			<jsp:include page="/WEB-INF/views/include/myleftsidebar.jsp" flush="false" />
			</div>	  
		</div>
	</div>
	
	<script type="text/javascript">
		function Check() {
			var result = confirm("정말로 회원탈퇴를 진행하시겠습니까?");
			if(result){
			    alert("회원탈퇴가 완료되었습니다!");
			}
		}
	</script>
	
	<!-- footer -->
	<!-- 2020.08.03 footer를 include로 옮겼음 -->
  	<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false" />

</body>
</html>