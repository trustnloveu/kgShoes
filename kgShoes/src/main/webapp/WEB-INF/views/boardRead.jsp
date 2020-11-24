<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Board</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>

<!-- 게시글 삭제 수행 -->
<script>
	function deleteConfirm() {
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer == true)
			location.href = "${cpath}/board/boardDelete/${vo.noticeNum}";
	}
</script>

<!-- 2020년 08월 12일 작업 -->
<!-- 답글 달기/접기 폼 -->
<script src="${cpath }/js/recomment.js?ver=1" type="text/javascript"></script>

<!-- 2020년 08월 18일 작업 -->
<!-- 댓글 수정 및 취소 -->
<script src="${cpath }/js/RecommentUpdate.js?ver=2" type="text/javascript"></script>

<body>
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>

			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>

			<!-- 카테고리 -->
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a>
							<span class="mx-2 mb-0">/</span>
							<span class="text-black">Board</span>
							<span class="mx-2 mb-0">/</span>
							<span class="text-black">All</span>
							<span class="mx-2 mb-0">/</span>
							<strong class="text-black">SelectBoard</strong>							
						</div>
					</div>
				</div>
			</div>
			<!-- end header -->
		</header>

		<!-- 게시판 리스트 -->
		<!-- 2020년 08월 18일 수정 -->
		<div class="site-section pt-3">
			<div class="container">
			<!-- 새글쓰기 폼-->
				<div class="row mb-5">
					<div class="col-md-9 order-2">
						<h3><p style="color: black;">Board(No. ${number })</p></h3>
						<table class="boardRead-table" border="1" bordercolor="#D5D5D5" sellpadding="0" cellspacing="1">
							<tr style="height: 50px;">
								<th class="boardRead-table-th1">
									<span class="boardRead-write-span">글 종류</span>
								</th>
								<th class="boardRead-table-th2">
									<span class="boardRead-write-span2">공지사항</span>
								</th>
							</tr>	
							<tr style="height: 50px;">
								<th class="boardRead-table-th1">
									<span class="boardRead-write-span">글 제목</span>
								</th>
								<th class="boardRead-table-th2">
									<span class="boardRead-write-span2">${vo.title }</span>
								</th>
							</tr>
							<tr style="height: 50px;">
								<th>
									<span class="boardRead-write-span">작성자</span>
								</th>
								<th>
									<span class="boardRead-write-span2">${vo.writer }</span>
								</th>
							</tr>
							<tr style="height: 50px;">
								<th>
									<span class="boardRead-write-span">작성날짜</span>
								</th>
								<th>
									<span class="boardRead-write-span2"><fmt:formatDate value="${vo.registDate }" pattern="yyyy.MM.dd"/></span>
								</th>
							</tr>
							<tr style="height: 500px;">
								<th class="boardRead-table-th1">
									<span class="boardRead-write-span">내용</span>
								</th>
								<th class="boardRead-table-th2">
									<c:if test="${not empty vo.img }">
										<img class="boardRead-img" src="${pageContext.request.contextPath }/boardImg/${vo.img}"><br>
									</c:if>
									<span class="boardRead-write-span2">${vo.context }</span>
								</th>
							</tr>
						</table>
						<!-- 2020년 8월 20일 수정 -->
						<c:if test="${login.customerCode eq 0 }">
							<div class="boardRead-rightMenu">
								<input class="btn boardRead-left-btn" type="button" value="수정하기" onclick="location.href='${cpath}/board/boardUpdate/${vo.noticeNum }'">
								<input class="btn boardRead-center-btn" type="button" value="글 삭제" onclick="deleteConfirm()">
								<input class="btn boardRead-right-btn" type="button" value="돌아가기" onclick="location.href='${cpath}/board/'">
							</div>
						</c:if>
						<!-- 2020년 8월 20일 수정 -->
						<c:if test="${login.customerCode ne 0 }">
							<div class="boardRead-rightMenu2">
								<input class="btn boardRead-right-btn" type="button" value="돌아가기" onclick="location.href='${cpath}/board/'">
							</div>
						</c:if>
					</div>

					<!-- 왼쪽 사이드바 1 : 글종류 필터 -->
					<div class="col-md-3 order-1 mb-5 mb-md-0" data-aos="fade-up">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">고객 게시판</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1">
									<a href="${cpath }/board/" class="d-flex">
										<span class="boardRead-span">공지 게시판</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 2020년 08월 14일 작업중 -->
				<!-- 2020년 08월 18일 수정 -->
				<!-- 게시판 댓글 -->
				<div class="container mt-3 pt-3" style="margin-left: 70px;" data-aos="fade-up">
					<div class="row mb-5">
						<div class="col-md-12 order-2">
							<h3 style="margin-left: 20px;">댓글</h3>
							<!-- 댓글에 대한 폼 -->
							<div>
							<div class="single-comment mt-3 pr-3 pl-3 boardRead-comment">
							<!-- 2020.08.20 수정(곽동열) -->
								<div class="comment-content col-md-9">댓글</div>
								<div class="comment-writer col-md-2">작성자(이메일)</div>
								<div class="comment-date col-md-1">날짜</div>
							</div>
							
							<c:if test="${not empty list}">
							<c:forEach var="vo2" items="${list }" varStatus="st">
								<!-- 2020.08.20 수정(곽동열) -->
								<form method="POST" action="${cpath }/board/boardReplyUpdate/${noticeNum}/${number}/">
								<!-- 2020.08.20 수정(곽동열) -->
								<c:if test="${vo2.redepth eq 0 }">
									<div class="single-comment mt-3 pr-3 pl-3" style="margin-left: <c:out value="${20*vo2.redepth }px;" />">
										<div id="renum${vo2.renum }"></div>
										<div id="context${vo2.renum }" class="comment-content col-md-9">${vo2.context }</div>
										<div id="writer${vo2.renum }" class="comment-writer col-md-2">${vo2.writer }</div>
										<div class="comment-date col-md-1"><fmt:formatDate value="${vo2.registDate }" pattern="yyyy.MM.dd"/></div>
									</div>
								</c:if>
								<c:if test="${vo2.redepth ne 0 }">
									<div class="single-comment mt-3 pr-3 pl-3" style="margin-left: <c:out value="${20*vo2.redepth }px;" />">
									    <span style="margin-right: 10px;">┗</span>
										<div id="renum${vo2.renum }"></div>
										<div id="context${vo2.renum }" class="comment-content col-md-9">${vo2.context }</div>
										<div id="writer${vo2.renum }" class="comment-writer col-md-2">${vo2.writer }</div>
										<div class="comment-date col-md-1"><fmt:formatDate value="${vo2.registDate }" pattern="yyyy.MM.dd"/></div>
									</div>
								</c:if>
								<c:if test="${not empty login }">
									<!-- 2020년 8월 20일 수정 -->
									<c:if test="${login.customerCode eq vo2.customerCode or login.customerCode eq 0}">
										<div class="edit-comment pr-3 mt-0">
											<!-- 2020년 8월 20일 수정 -->
											<button class="reviewRead-replybutton" id="button${st.index }" type="button" onclick="addrecomment('${vo2.renum}', '${st.index }', '${login.customerCode }', '${login.name }')"><span class="insert-recomment">답글달기</span></button>
											<button class="reviewRead-replybutton" type="button" onclick="recommentUpdate('${vo2.renum}', '${vo2.context }', '${vo2.writer }', '${login.customerCode }', '${login.name }')">
												<span id="update${vo2.renum }" class="update-comment">수정</span>
											</button>&nbsp;&nbsp;/&nbsp;&nbsp;
											<div id="updatecancel${vo2.renum }" class="update-comment" style="display: inline-block;"></div><span id="span${vo2.renum}" style="display: none;">&nbsp;&nbsp;/&nbsp;&nbsp;</span>				
											<button class="reviewRead-replybutton" type="button" onclick="location.href='${cpath}/board/deleteBoardReply/${noticeNum }/${vo2.renum}/${number}/'"><span class="delete-comment">삭제</span></button>
										</div>
									</c:if>
								</c:if>
								</form>
								<div id="recomment${st.index }" style="margin-left: 40px;">
									<form id="form" action="${cpath }/board/boardReplyRecomment/${noticeNum}/${number}/" method="POST">
									</form>
								</div>
							</c:forEach>
							</c:if>
							<c:if test="${empty list }">
								<span class="boardRead-span-reply">작성된 댓글이 없습니다.</span>
							</c:if>
							
							<!-- 2020년 08월 19일 수정 -->
							<c:if test="${not empty login }">
								<form class="single-comment-wrapper boardRead-form" method="POST">
								<div class="pr-3 pl-3">
									<div class="recomment-form pt-2 pb-2">
										<div class="col-md-10">
											<!-- 2020년 8월 20일 수정 -->
											<c:if test="${login.customerCode eq 0 }">
												<input type="hidden" name="customerCode" value="0">
												<input class="boardRead-reco-writer" type="text" name="writer" value="관리자" readonly> 
											</c:if>
											<c:if test="${login.customerCode ne 0 }">
												<input type="hidden" name="customerCode" value="${login.customerCode }">
												<input class="boardRead-reco-writer" type="text" name="writer" value="${login.name }" readonly> 
											</c:if>
											<input class="boardRead-reco-writer2 recomment-input col-md-10" type="text" name="context" placeholder="댓글 작성" maxlength="100">
										</div>
										<div style="width: 120px; text-align: center;">
										<button class="recomment-btn boardRead-btn2">댓글달기</button>
										</div>
									</div>
								</div>
								</form>
							</c:if>
							</div>
							
							<!-- 페이징 아이콘 : active(활성화 표시)-->
							<!-- 2020.08.07 -->
							<div class="row" data-aos="fade-up">
								<div class="col-md-12 text-center">
									<div class="site-block-27">
										<c:if test="${prev }">
											<a href="${cpath }/board/read/${begin - 1}/${number }/${noticeNum }/">◀</a>
										</c:if>
										<c:forEach var="i" begin="${begin}" end="${end}">
										<c:if test="${i == page }">
											<span class="boardRead-paging-span2">[${i }]</span>
										</c:if>
										<c:if test="${i != page }">
											<a href="${cpath }/board/read/${i }/${number }/${noticeNum }/">
												<span class="boardRead-paging-span">[${i }]</span>
											</a>
										</c:if>
										</c:forEach>
										<c:if test="${next }">
											<a href="${cpath }/board/read/${end + 1}/${number }/${noticeNum }/">▶</a>
										</c:if>
									</div>
								</div>
							</div>		
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>

	<script src="../js/main.js"></script>

</body>
</html>