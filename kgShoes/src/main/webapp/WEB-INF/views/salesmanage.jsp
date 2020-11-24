<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<!-- 헤더 인클루드하고 난 후에 삭제 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${cpath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cpath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${cpath}/css/jquery-ui.css">
    <link rel="stylesheet" href="${cpath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${cpath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${cpath}/css/aos.css">
    <link rel="stylesheet" href="${cpath}/css/style.css">

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
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
							<strong	class="text-black">Sales Manage</strong>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		<!-- 재고정리 -->
		<!-- 2020.07.28 -->
		<div class="site-section" style="display: none" id="pageDiv">
			<div class="container">

			<div class="row mb-12">
				<div class="col-md-9 order-2">
					
					<!-- 금월 판매금액 표시 -->
					<!-- 2020.07.28 -->
					<div class="col-md-5 order-2" style="border: 1px solid grey; display: inline-block;">
						<div class="row mb-3 mt-3">
							<div class="col-sm-12" data-aos="fade-up">
								<fieldset>
									<legend id="this_month" class="text-center"></legend>
									<hr>
									<div class="text-center"><h2>${thisMonthSale }원</h2></div>
								</fieldset>
							</div>
						</div>
					</div>
					
					<div class="col-md-1 order-2" style="display: inline-block;"></div>
					
					<!-- 금일 판매금액 표시 -->
					<!-- 2020.07.28 -->
					<div class="col-md-5 order-2" style="border: 1px solid grey; display: inline-block;">
						<div class="row mb-3 mt-3">
							<div class="col-sm-12" data-aos="fade-up">
								<fieldset>
									<legend id="this_today" class="text-center"></legend>
									<hr>
									<div class="text-center"><h2>${todaySale }원</h2></div>
								</fieldset>
							</div>
						</div>
					</div>
					
					<!-- 판매량 차트 보여주기 -->
					<!-- 2020.07.31 -->
					<div class="col-md-11 order-2 ml-2 mt-5">
						<canvas id="myChart"></canvas>
					</div>
 					<div class="col-md-11 order-2 ml-3 mt-5" style="display: inline-block;">
						<canvas id="merchanRank"></canvas>
					</div>
 					<div class="col-md-11 order-2 ml-3 mt-5" style="display: inline-block;">
						<canvas id="customerRank"></canvas>
					</div>
					
				
					
					<!-- 최신 판매 리스트 보여주기 -->
					<!-- 2020.07.31 -->
					<div class="col-md-11 order-2 mt-5" style="padding-left: 0px; padding-right: 0px">
						<div class="col-md-9" style="font-weight: bold; display: inline-block; padding-left: 0px; padding-right: 0px">최신 판매</div>
	
						<div class="col-md-2 ml-5" style="display: inline-block; padding-left: 0px; padding-right: 0px; text-align: right;">
							<a style="font-weight: bold; text-decoration: none" href="javascript:AllTable()">전체보기</a>
						</div>
						<hr>
						<div class="col-md-12">
						<table class="col-md-12 border" style="text-align: center;">
							<tr style="background-color: #e0fffff; border-bottom: 1px solid grey; color: black">
								<th style="width: 25%">판매날짜</th><th style="width: 25%">상품코드</th><th style="width: 25%">판매개수</th><th style="width: 25%">판매금액</th>
							</tr>
							<!-- 반복문 -->
							<c:forEach items="${orderList }" var="vo" varStatus="i">
							<c:if test="${i.index < 5 }">
								<tr>
									<td>${vo.orderDate }</td>
									<td width="50" style="text-overflow: ellipsis; overflow: hidden;">${vo.merchanCode }</td>
									<td>${vo.orderQuantity }</td>
									<td>${vo.orderPrice }</td>
								</tr>
							</c:if>
							<c:if test="${i.index >= 5 }">
								<tr style="display: none" id="tr${i.index }" class="nothing">
									<td>${vo.orderDate }</td>
									<td width="50" style="text-overflow: ellipsis; overflow: hidden;">${vo.merchanCode }</td>
									<td>${vo.orderQuantity }</td>
									<td>${vo.orderPrice }</td>
								</tr>
							</c:if>		
							</c:forEach>
						</table>
						</div>
						<div class="col-md-12 text-center mt-1" id="plusTableButton">
							<button class="btn btn-primary col-md-12" onclick="plusTable()">더 보기</button>
						</div>
					</div>				
				</div>
				
				
			
				<!-- 왼쪽 사이드바 -->
				<!-- 2020.08.03 -->
				<jsp:include page="/WEB-INF/views/include/adminleftsidebar.jsp" flush="false" />
				
					
					
			</div>
		</div>
	
	<!-- 2020.08.03 footer를 include로 옮겼음 -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false" />
	</div>
	
<!-- 차트 js 파일 링크 주소 -->
<!-- 2020.07.31 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>


<!-- 차트 스크립트 -->
<!-- 2020.07.31 -->
<!-- 완료 후, 별도 js 파일로 옮길 예정임 -->
<script type="text/javascript">

	var count = 1;
	
	// querySelectorAll 를 활용해서 style="none" 되어있는 tr 태그의 리스트 길이를 가져오자
	// 가져온 리스트 길이를 이용하여 for 문 조건을 완성시켜 오류가 나타나지 않도록 하자
	function plusTable() {
		console.log('plusTable을 눌렀습니다');
		var trnothing = document.querySelectorAll("tr.nothing");
		var nothinglength = (trnothing.length * 1);
		console.log('nothinglength : ' + nothinglength);

		for(i = 0; i < 5; i++) {
			var plusCount = count * 5 + i ;
			console.log(plusCount);
			if(nothinglength > plusCount - 5 ) {
				var trid = document.getElementById('tr' + plusCount);
				trid.style.display = '';
			}
		}
		count++;
	}
	
	
	// 전체보기 눌렀을 때, 전부 다 보이게 하는 기능
	// 2020.08.13
	function AllTable() {
		var trnothing = document.querySelectorAll("tr.nothing");
		for (i = 0; i < trnothing.length; i++) {
			var trid = document.getElementById( 'tr' + ((5 * 1) + i) );
			trid.style.display = '';
		}
		var plusTableButton = document.getElementById('plusTableButton');
		plusTableButton.innerHTML = '<button class="btn btn-primary col-md-12">더 보기</button>';
	}

	window.onload = function() {
		
		// 관리자만 접근가능하도록
		var pageDiv = document.getElementById('pageDiv');
		if (${empty login && login.customerCode != 0 } ) {
			alert('관리자가 아닙니다');
			location.href = '${cpath }/loginForm/';
			
		}
		pageDiv.style.display = '';
		
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();	
		document.getElementById('this_month').innerHTML = '금월 판매액' + '<h5>' + year + '년 ' + month + '월' + date + '일</h5>';
		
		let hours = today.getHours();
		let minutes = today.getMinutes();
		let seconds = today.getSeconds(); 

		document.getElementById('this_today').innerHTML = '금일 판매액' + '<h5>' + hours + '시 ' + minutes + '분 ' + seconds + '초</h5>';
	
		
	
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data : {
			labels:["1주", "2주", "3주", "4주", "5주"],
			datasets: [{
				// data에 데이터만 넣으면 완료됨
				data: [] //[12000,19000,30000,50000,20000,30000]
			,
				backgroundColor: [
					'rgba(255, 108, 132, 0.7)',
					'rgba(54, 162, 222, 0.7)',
					'rgba(255, 200, 95, 0.7)',
					'rgba(75, 188, 177, 0.7)',
					'rgba(153, 100, 255, 0.7)'
				],
				borderWidth: 1
			}]
		},
		options: {
			animationEnabled:true,
			title: {
				display:true,
				text:"주간 판매 금액(5주 이내)",
				fontsize:"32pt"
			},
			legend: {
				display:false
			},
			scales: {
				yAxes: [{
					ticks:{
						beginAtZero:true
					}
				}]
			}
		}
	});
	

	// 컨틀롤러에서 받아온 행렬 datasets에 넣기
    myChart.data.datasets[0].data = ${sqlResultData };
	
    // 차트 업데이트
	myChart.update();
	
	
	var merchanRank = document.getElementById("merchanRank").getContext('2d');
 	var merchanRankChart = new Chart(merchanRank, {

		type: "horizontalBar",
		data: {
		labels: [],
		datasets: [{
		data: [],
		fill: false,
		backgroundColor: ["rgba(255, 100, 150, 0.5)", "rgba(255, 160, 80, 0.5)", "rgba(201, 200, 200, 0.5)"
		],
		borderColor: ["rgb(255, 100, 140)", "rgb(255, 159, 64)", "rgb(255, 205, 86)"
		],
		borderWidth: 1
		}]
		},

		options : {
				animationEnabled:true,
				title: {
					display:true,
					text:"상품별 판매순위 (1 ~ 3위)",
				},
				legend: {
					display:false
				},
				scales : {
					xAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});

 	for (i = 0; i < ${sqlMerchanRankSize } && i < 3; i++) {
 	 	merchanRankChart.data.labels[i] = '${sqlMerchanRank.get(i).merchanCode }';
 	 	merchanRankChart.data.datasets[0].data[i] = ${sqlMerchanRank.get(i).orderPrice };
 	}
 	
	
 	merchanRankChart.update();
 	
 	
 	
 	
 	var customerRank = document.getElementById("customerRank").getContext('2d');
 	var customerRankChart = new Chart(customerRank, {

		type: "horizontalBar",
		data: {
		labels: [],
		datasets: [{
		data: [],
		fill: false,
		backgroundColor: ["rgba(255, 100, 150, 0.5)", "rgba(255, 160, 80, 0.5)", "rgba(201, 200, 200, 0.5)"
		],
		borderColor: ["rgb(255, 100, 140)", "rgb(255, 159, 64)", "rgb(255, 205, 86)"
		],
		borderWidth: 1
		}]
		},

		options : {
				animationEnabled:true,
				title: {
					display:true,
					text:"고객별 구매순위 (1 ~ 3위)",
				},
				legend: {
					display:false
				},
				scales : {
					xAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
 	
 		
 		for (i = 0; i < ${sqlMerchanRankSize } && i < 3; i++) {
 			customerRankChart.data.labels[i] = '${sqlCustomerRank.get(i).customerCode }';
 			customerRankChart.data.datasets[0].data[i] = ${sqlCustomerRank.get(i).orderPrice };
 		}
 	
 	
 		customerRankChart.update();
	}
</script>

</body>

</html>