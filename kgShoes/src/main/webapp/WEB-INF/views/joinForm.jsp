<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Project Join</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<c:set var="cpath">${pageContext.request.contextPath }</c:set>
</head>


<style type="text/css">
	input.reborder { border: 1px solid red }		/* 입력조건에 따라 테두리 색 바꾸는 클래스  / submit 할 시 사용됨 */
</style>

<script type="text/javascript">
	cpath = '${cpath}';		// js파일에 들어갈 cpath경로 선언
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<body>

<script type="text/javascript" src="${cpath }/js/joinFunction.js"></script>
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp" %>

			 <!-- 메뉴 -->
     		 <%@ include file="/WEB-INF/views/include/navbar.jsp" %>

			<!-- 카테고리 -->
			 <div class="bg-light py-3">
    			<div class="container">
        			<div class="row">
         				<div class="col-md-12 mb-0"><a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span><strong class="text-black">Join</strong></div>
        			</div>
      			</div>
      		</div>
		</header>


	<article class="on" id="terms">${str }</article>

		<!-- 회원가입 폼 -->
		
	<!-- 2020.07.31 -->
	<div class="site-section">
      <div class="container" style="width:1200px;">
        <div class="row">
          <div class="col-md-5" style="margin-right: 5.5rem">
            <h2 class="h3 mb-3 text-black">회원가입</h2>
          </div>
          <div class="col-md-5">
            <h2 class="h3 mb-3 text-black">약관규정</h2>
          </div>
          <form id="joinForm" method="POST">
          <div class="col-md-6 displayInline">
            
              
              <div class="p-3 p-lg-5 border">
             
                <div class="form-group row">
                  <div class="col-md-10">
                    <label for="email" class="text-black">Email <span class="text-danger">*</span></label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="example@email.com" required autofocus>
                    <p id="idmsg"></p>
                  </div>
                </div>
                
                <div class="form-group row" >
                  <div class="col-md-10" >
                    <label for="Password" class="text-black">비밀번호<span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
                  	<p id="pwmsg"></p> 
                  	
                  	 
                  </div>
                  
               </div>
                <div class="form-group row">
                  <div class="col-md-10">
                    <label for="confirmPassword" class="text-black">비밀번호 확인<span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>
                  	<p id="cpwmsg"></p>  
                  </div>
                  
               </div>
                
               <div class="form-group row">
                  <div class="col-md-6">
                    <label for="name" class="text-black">이름<span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="name" required>
                    
                  </div>
               </div>
               
               
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="birth" class="text-black" style="display: block;">생년월일</label>
                    <input type="number" class="col-md-3 form-control" style="display: inline-block;" id="yy" name="yy"><output class="ml-2">년</output>
                    <input type="number" class="col-md-3 ml-2 form-control" style="display: inline-block;" id="mm" name="mm"><output class="ml-2">월</output>
                    <input type="number" class="col-md-3 ml-2 form-control" style="display: inline-block;" id="dd" name="dd"><output class="ml-2">일</output>
                    <p id="yymsg"></p>
                  </div>
                </div>
				
                <div class="form-group row">
                  	<div class="col-md-12">
                    	<label for="phonenum" class="text-black" style="display: block;">휴대폰 번호<span class="text-danger">*</span> </label>
                    	<input type="number" class="col-md-3 form-control" style="display: inline-block;" id="firstP" name="firstP" required><output class="ml-2">ㅡ</output>                  
                    	<input type="number" class="col-md-3 ml-2 form-control" style="display: inline-block;" id="midP" name="midP" required><output  class="ml-2">ㅡ</output>                  
                    	<input type="number" class="col-md-3 ml-2 form-control" style="display: inline-block;" id="lastP" name="lastP" required>                 
                  	</div>
                </div>
                
               <div class="form-group row">
               		<div class="col-md-12">
               			<label for="address" class="text-black" style="display: block;">주소 입력</label>
               			<input type="text" class="col-md-6 form-control" style="display: inline-block;" id="postcode" name="postcode" placeholder="우편번호">
               			<input type="button" class="col-md-2 ml-3 btn btn-primary btn-lg" value="검색" style="display: inline-block;" onclick="joinPostcode()">
               			<input type="text" class="col-md-12 mt-3 form-control" id="address" name="address" placeholder="주소">
               			<input type="text" class="col-md-12 mt-3 form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
              		</div>
               </div>
                
                <div class="form-group row">

                  <div class="col-md-12 mt-3">
                    <input type="button" class="btn btn-primary btn-lg btn-block" value="join" onclick="join()">
                    
                  </div>
                    <div class="col-md-2"></div>
                </div>
              </div>
            
          </div>
          
               
		<!-- 약관동의 -->
		<!-- 2020.07.31 약관동의 - (필수란만 required 걸었음)-->
		<!-- 차후에 include 로 약관 내용 삽입하고, 본문에서는 약관 내용 지울 예정임 -->
		<!-- 본문 스타일이 마음에 들지 않으면, 약관 클릭시 모달창(=새창) 띄우는 형식으로 수정하고자 함 -->
			<div class="col-md-6 displayInline" style="float: right;">
			          
              <div class="border" style="padding: 2rem; height:100%;">
						<div class="form-group row" style="display: block; ">
							<label><input type="checkbox" onclick="AllClick()" id="AllCheck">전체 약관에 동의합니다</label>						
						<div>
							<label><input class="termCheck" type="checkbox" name="check" required>[필수]사이트 이용약관</label>
						</div>

						<div class="col-md-12" id="pre1">
							<!-- 	2020.08.06 -->
							<!--	약관 들고오는 부분 pre 태그 ===> div 태그로 수정 -->
							<div class="term">${terms1}</div>
						</div>


						<div>
							<label><input class="termCheck" type="checkbox" name="check" required>[필수]개인정보처리방침</label>
						</div>
						<div class="col-md-12" id="pre2">
							<div class="term">${terms2}</div>
						</div>

						<div>
							<label><input type="checkbox" name="check">[선택]개인정보 제3자 제공 동의</label>
						</div>
						<div class="col-md-12" id="pre3">
							<div class="term">${terms3}</div>
						</div>
					</div>
					</div> 
        		</div>
          </form>
          
          </div>
        		
        		
      		</div>
      		
      		
      	</div>
      		<!-- 로그인 페이지로 이동 -->
			<div class="link-to-search">
				
				<p><a href="${cpath }/loginForm/">로그인 화면으로</a></p>
				<p><a id="search_account" class="cursor_p">아이디 / 비밀번호 찾기</a></p>
			</div>
	      	
      	</div>
      	
      	
<!-- 전체약관 선택 -->
<!-- 2020.07.31 -->
<script type="text/javascript">
	function AllClick() {

	var AllCheck = document.getElementById('AllCheck');
    var check = document.getElementsByName('check');
    
    if (AllCheck.checked == true) {
    	for (i = 0; i < check.length; i++) {
    		check[i].checked = true;
    	}
    }
    else {
    	for (i = 0; i < check.length; i++) {
    		check[i].checked = false;
    	}
    }
}
</script>

<script type="text/javascript" src="${cpath }/js/joinPostcode.js"></script>
<script type="text/javascript" src="${cpath }/js/joinEvent.js"></script>
<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- 8.10 -->


		
<!-- 아이디/비밀번호 찾기 폼 -->
<%@include file="/WEB-INF/views/include/accountSearchForm.jsp" %>


<!-- Modal(아이디 비밀번호 찾기) -->
<script src="${cpath }/js/loginModal.js"></script>
	

	
<!-- 인증번호 받기 -->
<script src="${cpath }/js/verificationCode.js"></script>



<!-- 2020.08.13 -->
<!-- 이용약관 txt strong 태그 style주기  -->
<script type="text/javascript">
	window.onload = function() {
		var strongs = document.querySelectorAll("strong");
		for (i = 0; i < strongs.length; i++) {
			strongs[i].style.display = 'block';
			strongs[i].style.fontWeight = 'bold';

		}
	}

</script>


