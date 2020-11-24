<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>주문조회</h1>

<c:forEach var="list" items="${orderList }">
	<p>주문코드 : ${list.orderCodename }</p>
	<p>상품코드 : ${list.merchanCode }</p>
	<p>상품갯수 : ${list.orderQuantitiy }</p>
	<p>상품가격 : ${list.orderPrice }</p>
	<p>==========================================</p>
</c:forEach>

</body>
</html>