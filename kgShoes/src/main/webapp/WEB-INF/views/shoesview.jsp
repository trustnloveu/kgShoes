<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>shoesLookup</title>
</head>
<body>
<script type="text/javascript">
	cpath = '${cpath}';
	merchanCode = '${shoes.merchanCode}';
</script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="${cpath }/js/Lookup.js"></script>

	<div>
		<div style="display: inline-block;">
			<img src="${cpath }/img/${shoes.imgSrc }">
		</div>
		<div id="infoDiv" style="display: inline-block;">
			<p>CODE : ${shoes.merchanCode }</p>
			<p>상품명 : ${shoes.merchanName }</p>
			<p>가격 : ${shoes.price }</p>
			<p>브랜드 : ${shoes.brand }</p>
			<p>카테고리 : ${shoes.category }</p>
			<select onclick="axiosTest()" style="width: 120px; height: 30px;">				
				<option>옵션 선택</option>
				<option id="250">250</option>
				<option id="260">260</option>
				<option id="270">270</option>
				<option id="280">280</option>
				<option id="290">290</option>
				<option id="300">300</option>
			</select>
			
			<div>
				<c:if test="${not empty shoeColorList }">
					<c:forEach var="vo" items="${shoeColorList }">
						<a href="${cpath }/shoesLookup/${vo.merchanCode }/">${vo.merchanCode }</a>
					</c:forEach>
				</c:if>
			</div>
			<div>
				<button>구매하기</button>
				<button>장바구니</button>
			</div>
		</div>
	</div>
	
	<hr>
	<!-- 같은 카테고리 다른 상품 -->
	<div id="recommendItems"></div>
	<hr>
	<!-- 같은 브랜드 내에 다른 상품 -->
	<div id="brandItems">
		<ul>
			<c:forEach var="brandVO" items="${brandList }" begin="0" end="5">
				<li><a href="${cpath }/shoesLookup/${brandVO.merchanCode }/">${brandVO.merchanName }</a></li>
			</c:forEach>
		</ul>
	</div>
	<hr>
</body>
</html>