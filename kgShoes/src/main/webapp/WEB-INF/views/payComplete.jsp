<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style type="text/css">
.leftComplete {
	border-bottom: 1px solid grey;
	padding: 10px;
	padding-left: 20px ;
	margin: 0
}
.rightComplete {
	border-bottom: 1px solid  rgb(215, 215, 215);
	padding: 10px;
	padding-left: 60px ;
	margin: 0
}

</style>

</head>
<body>
<c:set var="vo" value="${reportVO }" />
<div class="site-wrap">
      <header class="site-navbar" role="banner">
         <!-- 타이틀 로고 -->
         <%@ include file="/WEB-INF/views/include/logo.jsp"%>   
         <!-- 메뉴 -->
         <%@ include file="/WEB-INF/views/include/navbar.jsp"%>
      </header>      
      
      <div class="container mt-5 mb-5">
         <div class="text-center text-black" style="font-weight: bold; font-size: 40px" >결제 완료</div>
         
         <div class="row">   
            <div class="col-md-2"></div>
            <div class="col-md-8" style="border-top: 2px solid grey">
               <div class="row text-black">
               
               <div class="col-md-4" style="background-color: rgba(192, 192, 192, 1); padding: 0; font-weight: bold;">
               
                     <p class="leftComplete">주문코드</p>                  
                  
                  	 <div class="hidden">
             	 	 <c:forEach items="${orderPrice }" varStatus="i"> 
         	             <div class="leftComplete">상품이름 (${i.count })<h4 style="float: right;" onclick="activation()">✚</h4></div>
            	         <div class="leftComplete" style="display: none;">&nbsp;&nbsp;상품사이즈</div>
                	     <div class="leftComplete" style="display: none">&nbsp;&nbsp;상품개수</div>
                    	 <div class="leftComplete" style="display: none">&nbsp;&nbsp;상품가격</div>
                     </c:forEach>
                  	 </div>
                  
                     <div class="leftComplete">총 결제금액</div>
                     
                    <c:choose>
                     	<c:when test="${vo.orderPayoption == 'checkBank' }">
                        	<p class="leftComplete">결제방식</p>
                        	<p class="leftComplete">예금주</p>
                        	<p class="leftComplete">이메일</p>                     
                     	</c:when>
                     	<c:when test="${vo.orderPayoption == 'checkCredit' }">
                     		<p class="leftComplete">결제방식</p>
                        	<p class="leftComplete">카드번호</p>   <!-- function을 이용해 카드번호 뒤 4자리는 ****로 처리 -->                     	
                     	</c:when>
                     	<c:when test="${vo.orderPayoption == 'checkMobile' }">
                     		<p class="leftComplete">결제방식</p>
                        	<p class="leftComplete">휴대폰 번호</p>                     	
                     	</c:when>
	 				</c:choose>                     
                     <div class="leftComplete">받는 분</div>
                     <div class="leftComplete">전화번호</div>
                     <div class="leftComplete">이메일</div>
                     <div class="leftComplete">배송지</div>
               </div>
               <div class="col-md-8" style="padding: 0; ">
                  
                     <p class="rightComplete">${vo.orderCodename }</p>
                  	
                  	<c:forEach var="report" items="${orderPrice }" varStatus="status">
                  	<div class="hidden">
                    	<p class="rightComplete">${orderMerchanName[status.index] }</p>
                    	<div class="rightComplete" style="display: none">${shoesize[status.index] }</div>
                    	<div class="rightComplete" style="display: none">${orderQuantitiy[status.index] }</div>
                    	<div class="rightComplete" style="display: none">${orderPrice[status.index] }</div>
                    </div>
<%--                     <c:set var="totalPrice" value="${totalPrice + orderPrice[status.index]}"/> --%>
                    </c:forEach>
                  
                    <div class="rightComplete">${totalPrice }</div>
                  
                  
                  
                  	<c:choose>
                     	<c:when test="${vo.orderPayoption == 'checkBank' }">
                        	<p class="leftComplete">계좌이체(무통장입금)</p>
                        	<p class="leftComplete">${bankName }</p>
                        	<p class="leftComplete">${bankEmail }</p>                     
                     	</c:when>
                     	<c:when test="${vo.orderPayoption == 'checkCredit' }">
                     		<p class="leftComplete">카드 결제</p>
                     		<c:set var="card" value="${creditCard }" />
                        	<p class="leftComplete">${fn:substring(card,0,15) }****</p>   <!-- function을 이용해 카드번호 뒤 4자리는 ****로 처리 -->                     	
                     	</c:when>
                     	<c:when test="${vo.orderPayoption == 'checkMobile' }">
                     		<p class="leftComplete">핸드폰 결제</p>
                        	<p class="leftComplete">${mobilePhone }</p>                     	
                     	</c:when>
	 				</c:choose>
                  	
                  
                     <div class="rightComplete">${vo.orderRecieveName }</div>
                     <div class="rightComplete">${vo.orderRecievePnum }</div>
                     <div class="rightComplete">${vo.orderRecieveEmail }</div>
                     <div class="rightComplete">${vo.orderAddress }</div>
               </div>
               </div>   
               </div>
            </div>


         </div>
      </div>
   
   
   <!-- 푸터 -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>
   
</body>

<script type="text/javascript">

	function activation() {
		var hiddenDIV = document.querySelectorAll('div.hidden');
		
		for (i = 0; i < hiddenDIV.length; i++) {
			for (j = 1; j < hiddenDIV[i].children.length; j++) {
				hiddenDIV[i].children[j].style.display = '';
			}
		}
		hiddenDIV[0].children[0].children[0].innerHTML = 'ㅡ';
		hiddenDIV[0].children[0].children[0].style.fontWeight = 'bolder';
		hiddenDIV[0].children[0].children[0].setAttribute('onclick', 'deactivation()');
	}
	
	function deactivation() {
		var hiddenDIV = document.querySelectorAll('div.hidden');
		
		for (i = 0; i < hiddenDIV.length; i++) {
			for (j = 1; j < hiddenDIV[i].children.length; j++) {
				hiddenDIV[i].children[j].style.display = 'none';
			}
		}
		hiddenDIV[0].children[0].children[0].innerHTML = '✚';
		hiddenDIV[0].children[0].children[0].style.fontWeight = 'normal';
		hiddenDIV[0].children[0].children[0].setAttribute('onclick', 'activation()');
	}
	
	
</script>

</html>