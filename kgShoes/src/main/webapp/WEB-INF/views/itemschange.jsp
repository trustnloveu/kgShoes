<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
<title>Insert title here</title>
</head>
<body>	
		<!-- 경로 줄 -->
		<!-- 2020.08.03 -->
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>

			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span>
							<a href="${cpath }/adminPage/">AdminPage</a><span class="mx-2 mb-0">/</span>
							<strong	class="text-black">ItemsChange</strong>
						</div>
					</div>
				</div>
			</div>
		</header>



		<div class="site-section pt-3" id="pageDiv" style="display: none">
			<div class="container">
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
								<div class="d-flex mb-3">
									<p style="float: left;">상품코드를 클릭하면 변경란이 활성화됩니다</p>
									<!-- 글종류 필터 -->
									<!-- 2020.08.03 -->
									<div class="dropdown mr-1 ml-md-auto">
									 	<button type="button" class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuOffset" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">필터
										</button>
								 		<div class="dropdown-menu" aria-labelledby="dropdownMenuOffset" id="filterTypeDiv">
											<a class="dropdown-item" href="javascript:filterType('filteramount')" id="filteramount">입고수량</a>
											<a class="dropdown-item" href="javascript:filterType('filterdiscrate')" id="filterdiscrate">할인률</a>
											<a class="dropdown-item" href="javascript:filterType('filterprice')" id="filterprice">상품가격</a>
										</div>
									</div>
					
									<!-- 등록일순 정렬 -->
									<!-- 2020.08.03 -->
									<div class="btn-group">
										<button type="button" class="btn btn-secondary btn-sm dropdown-toggle"
												id="dropdownMenuReference" data-toggle="dropdown">정렬
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
											<a class="dropdown-item" href="javascript:orderList('asc')">오름차순</a> 
											<a class="dropdown-item" href="javascript:orderList('desc')">내림차순</a>
										</div>
									</div>
								</div>
							</div>
					</div>
			</div>
			
			<!-- 관리자 상품입고 테이블 및 검색 -->
			<!-- 2020.08.03 -->
			<div class="container">
	
				<div class="row mb-12">	
				
				<div class="col-md-9 order-2" style="padding: 0">
									
				<!-- 상품변경 테이블 -->
				<!-- 2020.08.03 -->
				<!-- 2020.08.06 -->
				
				
				<!-- 아무것도 입력하지 않은 상태에서 전송 누르면 오류 발생 -> 해결바람 -->
				
				
				<form action="${cpath }/itemschange/" method="POST" name="changeform" id="changeform" onclick="checkItems()" onsubmit="return false;">
				<table class="col-md-12 order-1 mb-5 border" style="text-align: center;">
					<tr style="background-color: #e0fffff; border-bottom: 1px solid grey; color: black;">
						<th style="width: 20%">상품번호</th><th style="width: 35%">상품이름</th>
						<th style="width: 15%">입고수량</th><th style="width: 15%">할인률</th>
						<th style="width: 15%;">상품가격</th>
					</tr>			
					<c:forEach items="${merchanList }" var="vo" varStatus="status" begin="${pageVO.listStart }" end="${pageVO.listEnd }">
					<tr id="${vo.merchanCode }" >
						<td>
							<a href="javascript:activation('${vo.merchanCode }', '0', '${vo.discrate }', '${vo.price }')" style="text-decoration: none();">${vo.merchanCode }</a>
							<a href="javascript:deactivation('${vo.merchanCode }')" style="text-decoration: none(); display: none">${vo.merchanCode }</a>
						</td>						
						<td>${vo.merchanName }</td>
						<td>-</td><td>${vo.discrate }%</td><td>${vo.price }원</td>
						<td style="display: none"></td>
						<td style="display: none"></td>
						<td style="display: none"></td>
						<td style="display: none"></td>
					</tr>
					</c:forEach>
				</table>
				
					<!-- 변경하고 변경시킨 페이지로 돌아갈 방법을 생각해보자 -->
					<input type="hidden" name="merchanList" id="merchanList" value="${merchanList }">	
					
					
					<div class="float-md-right order-3 mb-5" style="padding-right: 20px; margin-top: 25px">						
							<div class="float-md-right mb-3" >
									<input type="submit" value="전송" style="width: 178px;" class="btn btn-primary btn-lg">
							</div>
					</div>
				</form>
						
						
						
						
					<div class="col-md-9 order-2">	
					<div class="row" data-aos="fade-up">
							<div class="col-md-12 order-4 text-center">
								<form action="${cpath }/itemschange/" method="post" >
									<div class="dropdown mr-1 ml-md-auto mb-3" style="display: inline-block;">
										<select id="searchtype" name="searchtype">
											<option value="select">선택</option>
											<option value="merchan_code">상품번호</option>
											<option value="merchan_name">상품이름</option> 
											<option value="amount">입고수량</option>
											<option value="discrate">할인률</option>
											<option value="price">상품가격</option>
										</select>
									</div>
									<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요">
									<input type="submit" value="검색">													
								</form>
								
						<!-- 페이징 아이콘 : active(활성화 표시)-->
						<!-- 2020.08.03 -->
						<div class="row order-3" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul id="pageList">
										
										
		
										<c:forEach var="i" begin="${pageVO.pageStart }" end="${pageVO.pageEnd }">
										
										<c:if test="${i == pageVO.pageStart}">
											<li id="prev" ><a href="javascript:pageSlide('prev')" >&lt;</a></li>
										</c:if>										
			
											<li id="page${i }" onclick="paging('page' + ${i} )">
												<a href="${cpath}/itemschange/${i }">${i}</a>
											</li>
										<c:if test="${i == pageVO.pageEnd}">	
											<li id="next" ><a href="javascript:pageSlide('next')">&gt;</a></li>											
										</c:if>
											
										</c:forEach>									
									</ul>
								</div>
							</div>
						</div>
						</div>
						</div>
					</div>			
				</div>
				
				
				
				
				<!-- 왼쪽 사이드바 -->
				<!-- 2020.08.03 -->
				<jsp:include page="/WEB-INF/views/include/adminleftsidebar.jsp" flush="false" />
							
				</div>	
			</div>


	<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false" />
</div>

<script>

	var tmp = null;
	var pathname = location.pathname;    // 주소 끝자리의 페이지를 받아오기 위함

	// 상품을 변경시키는 form이 비활성화되어 있다면 활성화시키는 기능
	// 2020.08.10
	function activation(id, amount, discrate, price) {
		var changetr = document.getElementById(id);
		
		changetr.children[0].children[0].style.display = 'none';		
		changetr.children[0].children[1].style.display = '';
		changetr.children[2].style.display = 'none';
		changetr.children[3].style.display = 'none';
		changetr.children[4].style.display = 'none';		
		changetr.children[5].style.display = '';		
		changetr.children[6].style.display = '';		
		changetr.children[7].style.display = '';		
		changetr.children[5].innerHTML = '<input type="number" name="itemamount" id="itemamount" class="col-md-11 form-control text-center" placeholder="수량">';		
		changetr.children[6].innerHTML = '<input type="number" name="itemdiscrate" id="itemdiscrate" class="col-md-11 form-control text-center" placeholder="' + discrate + '%">';		
		changetr.children[7].innerHTML = '<input type="number" name="itemprice" id="itemprice" class="col-md-11 form-control text-center" placeholder="' + price +'원">';		
		changetr.children[8].innerHTML = '<input type="text" name="itemmerchancode" id="itemmerchancode" class="col-md-11 form-control" value="' + id + '">';		
	}
	

	// 상품을 변경시키는 form이 활성화되어 있다면 끄는 기능
	// 2020.08.10
	function deactivation(obj) {
		var changetr = document.getElementById(obj);

		changetr.children[0].children[0].style.display = '';		
		changetr.children[0].children[1].style.display = 'none';
		
		changetr.children[2].style.display = '';
		changetr.children[3].style.display = '';
		changetr.children[4].style.display = '';		
		changetr.children[5].style.display = 'none';		
		changetr.children[6].style.display = 'none';		
		changetr.children[7].style.display = 'none';
		changetr.children[5].innerHTML = '';		
		changetr.children[6].innerHTML = '';		
		changetr.children[7].innerHTML = '';		
		changetr.children[8].innerHTML = '';
	}
	
	
	
	// 페이지 활성화될 때마다 페이지 버튼 활성화시킴
	// 2020.08.13
	window.onload = function() {
        
			
		// 관리자만 접근가능하도록
		var pageDiv = document.getElementById('pageDiv');
		if (${empty login && login.customerCode != 0 }) {
			alert('관리자가 아닙니다');
			location.href = '${cpath }/loginForm/';
			
		}
		pageDiv.style.display = '';
        
        console.log('activePage : ' + ${activePage } );
       
        paging('page' + ${activePage } );
        
        // 첫번째 페이지에 있을 때, prev 화살표 사라짐
        var prev = document.getElementById('prev');
//        if (pathname.substr(pathname.lastIndexOf("/") + 1) == '' || pathname.substr(pathname.lastIndexOf("/") + 1) == '1')        	
        if (${activePage } == '1')        	
        	prev.style.display = 'none';
        else 
        	prev.style.display = '';
        
        
        // 마지막 페이지에 있을 때, next 화살표 사라짐
       	var next = document.getElementById('next');
//        if ((pathname.substr(pathname.lastIndexOf("/") + 1) == ${pageVO.pageEnd } ) || (${pageVO.pageEnd == 1}))
        if (${activePage } == ${pageVO.pageEnd }  || (${pageVO.pageEnd == 1}))
        	next.style.display = 'none';       
        else
        	next.style.display = '';
	}

	// 페이지 버튼 활성화(className = 'active')
	function paging(id) {
		
		console.log('id : ' + id);
				
		// 활성화시키고 싶은 번호 태그 가지고 오기
		var ChangePage = document.getElementById(id);
		console.log('ChangePage : ' + ChangePage.innerHTML);
		
		// 번호나오는 전체 리스트 가지고오기
		var PageList = document.querySelector("#pageList");
		
		
		// 한번 전체 리스트에 주어진  class="" 으로 변경
		for (i = 1; i < PageList.children.length - 1; i++) {
			pageList.children[i].className = "";
		}
		
		const str = id.slice(4);
		console.log('str : ' + str);
		// 누른 녀석만 활성화시키기
		// pageList.children[str].className = "active";
		ChangePage.className="active";
	}
	
	
 	// 화살표 눌렀을 때 이동하는 기능 구현
 	// 2020.08.12
	function pageSlide(command) {
 		console.log('command : ' + command);
		var pagenum = pathname.substr(pathname.lastIndexOf("/") + 1) * 1;
		var pageprev = (pagenum - (1 * 1));
		console.log('pageprev : ' + pageprev);
		var pagenext = (pagenum + (1 * 1));
		console.log('pagenext : ' + pagenext);
		if(command == 'prev')
			location.href = '${cpath}/itemschange/' + pageprev;
			
		else if(command == 'next')
			location.href = '${cpath}/itemschange/' + pagenext;
 	}

 	// 아무것도 입력하지 않았을 때 Submit이 작동하지 못하도록 차단하는 기능
 	// 2020.08.13
 	function checkItems()
 	{
  		var	AllItemamount = document.querySelectorAll('[name="itemamount"]');
  		var changeform = document.getElementById('changeform');
//		changeform.setAttribute('onclick', 'checkItems()');
  		
  		
  		if (AllItemamount.length == 1) {
  			changeform.setAttribute('onsubmit', '');
  		}
  		
 		// 활성화시키면 어차피 하나라도 나오니 하나만 조건에 넣었음
 		else if (AllItemamount.length > 1) {
	//  		changeform.setAttribute('onclick', '');
			var	AllItemdiscrate = document.querySelectorAll('[name="itemdiscrate"]');
			var	AllItemprice = document.querySelectorAll('[name="itemprice"]');
 			console.log('AllItemamount : ' + AllItemamount);
 			console.log('AllItemamountlength : ' + AllItemamount.length);
			
			
			for (i = 0; i < AllItemamount.length; i++) {
				
				if(AllItemamount[i].value.length == 0 && AllItemdiscrate[i].value.length == 0 && AllItemprice[i].value.length == 0) {	
					changeform.setAttribute('onsubmit', 'return false;');
					console.log('onsubmit1 : ' + changeform.getAttribute('onsubmit'));
					//alert('변경하려는 입력값이 존재하지 않습니다');
				}
				else {
					for (j = 0; j < i; j++) {
						if (AllItemamount[j].value.length == 0 && AllItemdiscrate[j].value.length == 0 && AllItemprice[j].value.length == 0) {
							changeform.setAttribute('onsubmit', 'return false;');
							break;
						}
						changeform.setAttribute('onsubmit', '');
					}				
				}
			} 			
		}
 	}
 	
 	// 필터 구현해보자
 	// 필터를 선택한 후, 오름차순 - 내림차순을 누르면 그 필터타입에 적합한 순서로 정렬시켜준다
 	function filterType(filterType) {
 		var filterTypeId = document.getElementById(filterType);
 		var dropdownMenuOffset = document.getElementById('dropdownMenuOffset');
 		var filterTypeDiv = document.getElementById('filterTypeDiv');
 		
		for(i = 0; i < filterTypeDiv.children.length; i++) {
			filterTypeDiv.children[i].setAttribute('name', '');
		}
		
		var slicedType = filterType.slice(6);
		// id를 가진 녀석에게 name 값으로 amount, discrate, price 등을 준다
		filterTypeId.setAttribute('name', slicedType);
		dropdownMenuOffset.innerHTML = filterTypeId.innerHTML;
		// id="dropdownMenuOffset" 쪽에 올려져 있으면  모든 name = '' 으로 변경시키자
 	}
 	
 	function orderList(command) {
 		// filterType 부분에서 뭘 선택했는지 확인하고...
 		var filterTypeDiv = document.getElementById('filterTypeDiv');
 		var sortType = command;
 		var filterType;
		for(i = 0; i < filterTypeDiv.children.length; i++) {						
			if (filterTypeDiv.children[i].name !== '') {
				filterType = filterTypeDiv.children[i].name;
			}
		}
		
		console.log('filterType : ' + filterType);
		// filterType 을 아무것도 주지 않았다면 넘어가지 못하도록...
		// 덕분에 controller 에서는 sortType만 고려하면 됩니다
		if (filterType == undefined)
			return false;
		else 
			location.href='${cpath}/itemschange/?filterType=' + filterType + '&sortType=' + sortType;	
 	}
 	
 	
 	
</script>

</body>
</html>