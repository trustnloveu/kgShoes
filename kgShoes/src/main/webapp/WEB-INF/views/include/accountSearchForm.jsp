<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cpath">${pageContext.request.contextPath }</c:set>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<div id="account_search_option" class="modal">
	<div class="modal_content">
		<span class="close_btn text-right">&times;</span>
		<div id="test" class="select_search_option cursor_p">


			<!-- 아이디 찾기 선택 -->
			<div class="form-control mt-2">
				<a data-toggle="collapse" href="#id_search" role="search"
					aria-expanded="false" aria-controls="id_search">
					<div>아이디 찾기</div>
				</a>
			</div>

			<form id="id_search" class="collapse modal-bg mt-2">
				<!-- 아이디 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="searchForName" class="text-black mb-0 pb-0">이름
							<span class="text-danger">*</span>
						</label> 
							<input id="searchForName" class="form-control" type="text"
								   name="name" placeholder="'이름'을 입력해주세요." maxlength="10" required>
					</div>
				</div>
				<!-- 전화번호 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="searchForPhone" class="text-black mb-0 pb-0">전화번호 <span
							class="text-danger">*</span>
						</label>
							<input id="searchForPhone" class="form-control" type="text" 
								   name="phone" placeholder="'전화번호'를 입력해주세요." maxlength="18" required>
					</div>
				</div>

				<!-- 인증번호 & 타이머 -->
				<!--  <div id="verifi_code_id"></div>-->

				<!-- Submit -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-lg-12 mt-4 mb-4">
						<input id="id_search_input" type="button" class="btn btn-primary btn-lg btn-block"
							value="찾기" onclick="searchEmail()">
					</div>
				</div>
			</form>


			<!-- 비밀번호 찾기 선택 -->
			<div class="form-control mt-2">
				<a data-toggle="collapse" href="#pw_search" role="search"
					aria-expanded="false" aria-controls="pw_search">
					<div>비밀번호 찾기</div>
				</a>
			</div>
			<form id="pw_search" class="collapse modal-bg mt-2" method="POST" action="${cpath }/helpPw/">
				<!-- 이름 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="nameForPw" class="text-black mb-0 pb-0">이름<span
							class="text-danger">*</span>
						</label>
							<input id="nameForPw" class="form-control" type="text"
								   name="name" placeholder="'이름'을 입력해주세요." maxlength="18" required>
					</div>
				</div>
				
				<!-- 아이디 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="emailForPw" class="text-black mb-0 pb-0">이메일 
							<span class="text-danger">*</span>
						</label> 
						<input id="emailForPw" class="form-control" type="text" name="email" 
							   placeholder="이메일'을 입력해주세요." maxlength="20" required>
					</div>
				</div>
				<!-- 전화번호 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="phoneForPw" class="text-black mb-0 pb-0">전화번호<span
							class="text-danger">*</span>
						</label>
							<input id="phoneForPw" class="form-control" type="text"
								   name="phone" placeholder="'전화번호'를 입력해주세요." maxlength="18" required>
					</div>
				</div>
				
				<!-- 인증번호 & 타이머 -->
				<!--  <div id="verifi_code_pw"></div>-->
				
				<!-- Submit -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-lg-12 mt-4 mb-4">
						<input id="pw_search_input" type="button" class="btn btn-primary btn-lg btn-block" 
							   value="찾기" onclick="searchPw()">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="${cpath }/js/searchEmail.js"></script>
<script src="${cpath }/js/searchPw.js"></script>