<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
</head>
<body>
</head>

<body>
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>

			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
		</header>
		<!-- 경로 줄 -->
		<!-- 2020.08.03 -->
		<header class="site-navbar" role="banner">
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span>
							<a href="${cpath }/mypage/">MyPage</a><span class="mx-2 mb-0">/</span>
							<strong	class="text-black">Purchase History</strong>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		<div class="site-section pt-3">
			<div class="container">
					
								<div class="d-flex mb-3">
								
									<!-- 글종류 필터 -->
									<!-- 2020.08.03 -->
									<div class="dropdown mr-1 ml-md-auto">
										<button type="button" class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuOffset" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">필터
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="#">구매번호</a>
											<a class="dropdown-item" href="#">구매날짜</a> 
											<a class="dropdown-item" href="#">결제수단</a>
											<a class="dropdown-item" href="#">구매가격</a>
										</div>
									</div>
									
									<!-- 등록일순 정렬 -->
									<!-- 2020.08.03 -->
									<div class="btn-group">
										<button type="button" class="btn btn-secondary btn-sm dropdown-toggle"
												id="dropdownMenuReference" data-toggle="dropdown">정렬
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
											<a class="dropdown-item" href="#">오름차순</a> 
											<a class="dropdown-item" href="#">내림차순</a>
										</div>
									</div>
								</div>
							</div>
			
			<!-- 구매내역 테이블 및 검색 -->
			<!-- 2020.08.03 -->
			<div class="container">
				<div class="row mb-12">
				<div class="col-md-9 order-2" style="padding: 0" data-aos="fade-up">
				<div class="col-md-12 mb-5">
					<table class="col-md-12 mb-5 border" id="ListTable" style="text-align: center;">
					<tr style="background-color: #e0fffff; border-bottom: 1px solid grey; color: black;">
						<th style="width: 25%">구매번호</th><th style="width: 25%">구매날짜</th>
						<th style="width: 25%">결제수단</th><th style="width: 25%">구매가격</th>
					</tr>
					
					<!-- 구매내역 테이블 및 검색 -->
					<!-- 2020.08.04 -->
					<!-- begin 에서 +5 해버리면 end 이지 -->
					<c:forEach var="vo" items="${orderlist }" varStatus="status">
					<tr id="tr${list }" >
						<td><a id="td${status.index}" style="text-decoration: none" data-toggle="modal" href="#myModal${status.index}">${vo.orderCodename }</a></td>
						<c:set var="date" value="${vo.orderDate }" />
						<td>${fn:substring(date,0,10)}</td>
						<c:choose>
							<c:when test="${vo.orderPayoption eq 'checkBank'}">
								<td>계좌이체</td>
							</c:when>
							<c:when test="${vo.orderPayoption eq 'checkCredit'}">
								<td>카드결제</td>
							</c:when>
							<c:when test="${vo.orderPayoption eq 'checkMobile'}">
								<td>휴대폰결제</td>
							</c:when>
						</c:choose>
						<td>${vo.orderPrice }</td>
					</tr>
					<!-- 상품 배송 정책 내용-->
					<!-- bootstrap css 쪽에서  width 변경하라  -->
					<div class="modal fade" id="myModal${status.index}" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
						        <p class="modal-title">상세 구매 내역</p>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<!-- 리스트로 가져온 상세 구매내역 입력 -->
								<div class="modal-body">
									<h1>상세 구매 내역</h1>									
								</div>
								<div class="modal-footer">
									 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</table>
							<div class="row" data-aos="fade-up">
							<div class="col-md-12 order-3 text-center">
								<form action="#" method="post" >
									<div class="dropdown mr-1 ml-md-auto mb-3" style="display: inline-block;">
										<button type="button" class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuOffset" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">선택
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="#">구매번호</a>
											<a class="dropdown-item" href="#">구매날짜</a> 
											<a class="dropdown-item" href="#">결제수단</a>
											<a class="dropdown-item" href="#">구매가격</a>
										</div>
									</div>
									<input type="text">
									<input type="submit" value="검색">													
								</form>
								
						<!-- 페이징 아이콘 : active(활성화 표시)-->
						<!-- 2020.08.03 -->
						<div class="row order-3" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
										<li><a href="#">&lt;</a></li>
										<li class="active"><span>1</span></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&gt;</a></li>
									</ul>
								</div>
							</div>
						</div>
						</div>
						</div>
							
				</div>
				</div>
				<!-- 왼쪽 사이드바 -->
				<!-- 2020.08.03 footer를 include로 옮겼음 -->
				<jsp:include page="/WEB-INF/views/include/myleftsidebar.jsp" flush="false" />
				
			</div>
		</div>
	</div>


	<!-- footer -->
	<!-- 2020.08.03 footer를 include로 옮겼음 -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false" />    

</body>


</html>