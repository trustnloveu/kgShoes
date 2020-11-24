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

<!-- 2020년 08월 07일 작업 -->
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
							<strong class="text-black">WriteBoard</strong>							
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
						<h3><p style="color: #A6A6A6;">새 글 쓰기</p></h3>
						<form class="row mb-2 p-2 border" data-aos="fade-up" method="POST" enctype="multipart/form-data">
							<table class="boardWrite-table" border="1" bordercolor="#D5D5D5" sellpadding="0" cellspacing="1">
								<tr>
									<th class="boardWrite-table-th1">
										<span class="boardWrite-span">글 종류</span>
									</th>
									<th>
										<label class="boardWrite-label"><input type="radio" name="type" value="noti">&nbsp;공지사항</label>
									</th>
								</tr>	
								<tr>
									<th class="boardWrite-table-th1">
										<span class="boardWrite-span">글 제목</span>
									</th>
									<th>
										<input class="boardWrite-input-text" type="text" name="title" placeholder="제목" size="40">
									</th>
								</tr>
								<tr>
									<th>
										<span class="boardWrite-span">작성자</span>
									</th>
									<th>
										<!-- 2020년 8월 20일 수정 -->
										<input type="hidden" name="customerCode" value="${login.customerCode }">
										<input class="boardWrite-input-text" type="text" name="writer" value="관리자">
									</th>
								</tr>
								<tr>
									<th class="boardWrite-table-th1">
										<span class="boardWrite-span">내용</span>
									</th>
									<th>
										<textarea class="boardWrite-textarea" name="context" rows="10" cols="90" placeholder="내용을 작성하세요"></textarea>
									</th>
								</tr>	
								<tr>
									<th class="boardWrite-table-th1">
										<span class="boardWrite-span">파일첨부</span>
									</th>
									<th>
										<input class="boardWrite-input-file" type="file" name="userFile">
									</th>
								</tr>	
							</table>
							<div class="boardWrite-rightMenu">
								<input class="btn boardWrite-left-btn" type="submit" value="작성완료">
								<input class="btn boardWrite-right-btn" type="button" value="취소"
									onclick="history.go(-1)">
							</div>
						</form>
					</div>

				<!-- 왼쪽 사이드바 1 : 글종류 필터 -->
					<div class="col-md-3 order-1 mb-5 mb-md-0" data-aos="fade-up">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">고객 게시판</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1">
									<a href="${cpath }/board/" class="d-flex">
										<span class="boardRead-span">메인 게시판</span>
									</a>
								</li>
							</ul>
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