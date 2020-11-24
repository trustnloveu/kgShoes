<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Project Join</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>

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
							<strong class="text-black">Shop</strong>
						</div>
					</div>
				</div>
			</div>
			<!-- end header -->
		</header>

		<!-- 게시판 리스트 -->
		<!-- 2020.07.20 -->
		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-9 order-2">
						<!-- 상단 정렬바 -->
						<!-- 2020.07.20 -->
						<div class="row">
							<div class="col-md-12 mb-5">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">Board</h2>
								</div>
								<div class="d-flex board-sort">
									<!-- 등록일순 정렬 -->
									<!-- 2020.08.07 -->
									<div class="menu-group" style="z-index: 3">
										<ul class="board-myMenu">
											<li class="board-sortMenu">
												<span>정렬 <span style="font-size: 10px;">▼</span></span>
												<ul class="board-subMenu">
													<li>
													<form method="GET">
														<input type="hidden" name="sort" value="new">
														<input class="board-sortbutton" type="submit" value="최신순">
													</form>
													</li>
													<li>
													<form method="GET">
														<input type="hidden" name="sort" value="put">
														<input class="board-sortbutton" type="submit" value="등록순">
													</form>
													</li>
													<li>
													<form method="GET">
														<input type="hidden" name="sort" value="view">
														<input class="board-sortbutton" type="submit" value="조회순">
													</form>
													</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<!-- 게시글 뷰 -->
						<!-- 2020.07.20 -->
						<div class="row mb-5">
							<div class="col-sm-12" data-aos="fade-up">
								<div class="text-center border">
									<!-- 2020년 08월 19일 수정 -->
									<!-- 게시판 목록 -->							
									<c:if test="${empty list }">
									<div>
										<div class="msg">
										<h1 class="board-text_result">게시물이 존재하지 않습니다</h1>
										</div>
									</div>
									</c:if>
									<c:if test="${not empty list }">
									<table class="board-table" border="1" cellpadding="1" cellspacing="1">
										<tr height="20px;">
											<td class="board-noticeNum" style="text-align: center; font-weight: 700; color: black;">번호</td>
											<td class="board-title" style="text-align: center; font-weight: 700; color: black;">제목</td>
											<td class="board-writer" style="text-align: center; font-weight: 700; color: black;">작성자</td>
											<td class="board-type" style="text-align: center; font-weight: 700; color: black;">분류</td>
											<td class="board-registDate" style="text-align: center; font-weight: 700; color: black;">등록일</td>
											<td class="board-re" style="text-align: center; font-weight: 700; color: black;">조회수</td>
										</tr>
										<c:forEach var="vo" items="${list }" varStatus="st">
											<tr class="board-list2" onclick="location.href='${cpath }/board/read/${vo.noticeNum }/${st.count + no }/'">
												<td class="board-noticeNum">${st.count + no }</td>
												<td class="board-title">${vo.title } <span style="color: #949494;">(${vo.reply })</span></td>
												<td class="board-writer">${vo.writer }</td>
												<td class="board-type">${vo.type }</td>
												<td class="board-registDate"><fmt:formatDate value="${vo.registDate }" pattern="yyyy.MM.dd"/></td>
												<td class="board-re">${vo.review }</td>
											</tr>
										</c:forEach>
									</table>
									</c:if>
								</div>
								<!-- 2020년 8월 20일 수정 -->
								<c:if test="${login.customerCode eq 0 }">
									<div class="board-rightMenu">
										<input class="btn btn-sm btn-primary board-btn2" type="button" 
											   value="새 글 쓰기" onclick="location.href='${cpath}/board/boardWrite/'">
									</div>
								</c:if>
							</div>
						</div>

						<!-- 페이징 아이콘 : active(활성화 표시)-->
						<!-- 2020.08.07 -->
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<c:if test="${prev }">
										<a href="${cpath }/board/${begin - 1}/">◀</a>
									</c:if>
									<c:forEach var="i" begin="${begin}" end="${end}">
									<c:if test="${i == page }">
										<span class="board-paging-span2">[${i }]</span>
									</c:if>
									<c:if test="${i != page }">
										<a href="${cpath }/board/${i }/">
											<span class="board-paging-span">[${i }]</span>
										</a>
									</c:if>
									</c:forEach>
									<c:if test="${next }">
										<a href="${cpath }/board/${end + 1}/">▶</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>

					<!-- 왼쪽 사이드바 1 : 글 종류 필터 -->
					<!-- 2020.07.20 ~ 08.14 작업 -->
					<!-- 2020년 8월 18일 수정 -->
					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1">
									<a href="${cpath }/board/searchInit/" class="d-flex">
										<span class="boardRead-span">공지 게시판</span>
									</a>
								</li>
							</ul>
						</div>

						<!-- 왼쪽 사이드바 2 : 내용 검색 -->
						<!-- 2020.08.07 -->
						<div class="container">
							<div class="row">
								<div class="form-group">
									<div  class="row">
										<form method="POST">
										<div class="col-md-12">
										<label for="ta1">
											<span>검색 : </span>
											<select class="board-select" name="wordType" style="height: 23px;">
												<!-- 2020.08.20 수정(곽동열) -->
												<option class="board-option" value="title" ${param.type == 'title' ? 'selected' : '' }>
													<span>제목</span>
												</option>
												<option class="board-option" value="writer" ${param.type == 'writer' ? 'selected' : '' }>
													<span>작성자</span>
												</option>
											</select>
										</label><br> 
										</div>
										
										<div class="row board-search">
											<div class="col-md-11">
												<input type="text" name="word" value="${param.word }" class="col-md-12 form-control" style="display: inline-block;"><br>
											</div>
											<div class="col-md-11 mt-3">
												<div class="row board-search2">
													<div class="col-md-4 mr-4">
														<input type="submit" class="btn btn-sm btn-primary" 
														value="검색">
													</div>
													<div class="col-md-4 ml-1">
														<input class="btn btn-sm btn-primary board-btn3" type="button" 
														value="초기화" onclick="location.replace('${cpath }/board/searchInit/')">
													</div>
												</div>
											</div>
										</div>
										</form>
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