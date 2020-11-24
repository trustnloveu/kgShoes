<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function delchk(){
       return confirm("정말 탈퇴하시겠습니까?");
}
</script>
					<!-- 왼쪽 사이드바 1 -->
					<!-- 2020.07.20 -->
					<!-- 2020.08.03 경로를 include 로 옮겼음 -->
					<div class="col-md-3 order-1 mb-5 mb-md-0" data-aos="fade-up">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1">
									<a href="${cpath }/myPage/" class="d-flex">
										<span>마이 페이지</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="${cpath }/mychange/" class="d-flex">
										<span>개인정보 변경</span>
									</a>
								</li>
<!-- 								<li class="mb-1"> -->
<%-- 									<a href="${cpath }/steam/" class="d-flex"> --%>
<!-- 										<span>관심상품</span> -->
<!-- 									</a> -->
<!-- 								</li> -->
								<li class="mb-1">
									<a href="${cpath }/purchasehistory/" class="d-flex">
										<span>구매내역</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="${cpath }/withdrawl/" class="d-flex" onclick="return delchk();">
										<span>회원탈퇴</span>
									</a>
								</li>
								
							</ul>
						</div>					
					</div>			
</body>
</html>