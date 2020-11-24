<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<script type="text/javascript">
	cpath = '${cpath}';
	login = '${login}';
	email = '${login.email}';
</script>

<script>
	function logout(){
		var con = confirm('로그아웃 하시겠습니까?');
		if(con == true){
			console.log('logout operate');
			location.href = '${cpath}/logout/';
		}
	}
</script>

<div class="site-navbar-top">
	<div class="container">
		<div class="row align-items-center" style="line-height: 2em; vertical-align: middle;">
		
			<!-- 로고 -->
			<div class="col-md-6 text-left">
				<div class="site-logo">
					<a href="${cpath }" class="title-logo">이런 신발</a>
				</div>
			</div>

			<!-- 로그인/회원가입 -->
			<div class="col-md-6 text-right">
				<div class="site-top-icons">
					<ul>
					
					<c:choose>
											
					
						<c:when test="${empty login }">
							<li><a href="${cpath }/loginForm/">Login &nbsp;</a></li>
							<li><a href="${cpath }/joinForm/">Join &nbsp;</a></li>
							<li><a href="${cpath }/cart/"><i class="fas fa-shopping-cart"></i>Cart (not member) &nbsp;</a></li>
						</c:when>
						
						<c:when test="${not empty login && login.customerCode == 0 }">
							<li><a onclick="logout()">Log Out &nbsp;</a></li>
							<li><a href="${cpath }/adminPage/">Admin Page &nbsp;</a></li>
						</c:when>
						
						<c:when test="${not empty login && login.customerCode != 0 }">
							<li><a onclick="logout()">Log Out &nbsp;</a></li>
							<li><a href="${cpath }/myPage/">My Page &nbsp;</a></li>
							<li><a href="${cpath }/myInfoUpdate/">Info Update &nbsp;</a></li>
							<li><a href="${cpath }/cart/"><i class="fas fa-shopping-cart"></i>Cart &nbsp;</a></li>
						</c:when>
					</c:choose>
					
					
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>