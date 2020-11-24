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
					<!-- 왼쪽 사이드바 1 -->
					<!-- 2020.07.20 -->
					<!-- 2020.08.03 경로를 include 로 옮겼음 -->
					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1">
									<a href="${cpath }/adminPage/" class="d-flex">
										<span>관리자페이지</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="${cpath }/putinto/" class="d-flex">
										<span>상품등록</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="${cpath }/itemschange/" class="d-flex">
										<span>상품입고</span>
									</a>
								</li>
								<li class="mb-1">
									<a href="${cpath }/salesmanage/" class="d-flex">
										<span>매출관리</span>
									</a>
								</li>								
							</ul>
						</div>					
					</div>			
</body>
</html>