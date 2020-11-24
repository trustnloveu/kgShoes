<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<head>
	<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
</head>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body> 

<script type="text/javascript">
// 새 비밀번호 정규식 확인
function checkPasswordComplexity(event){
	const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/; // 대소문자, 특수문자, 숫자의 조합으로 6자 이상

	console.log('click');
	const password = event.value;
	console.log(password);
	const pwmsg = document.getElementById('pwmsg');

	if(regExp.test(password) == false){		// 비밀번호 정규식과 입력값이 안맞는 경우
		pwmsg.innerHTML = '비밀번호는 영문,숫자, 특수문자의 조합으로 6이상';
		pwmsg.style.color = 'red';
		pwmsg.className = 'error';
	}
	else {
		//event.target.className = '';
		
		pwmsg.className = '';
		pwmsg.innerHTML = '비밀번호 사용 가능';
		pwmsg.style.color = 'blue';
	}
}

// 비밀번호, 비밀번호 확인 값 비교
function checkPassword(event) {
	const password = document.getElementById('password');
	const cPassword = event.value;
	console.log(cPassword);
	const cpwmsg = document.getElementById('cpwmsg');

	if(password.value.length == 0){
		cpwmsg.innerHTML = '';
		cpwmsg.className = '';
	}
	else if(password.value === cPassword){
		cpwmsg.innerHTML = '비밀번호 일치';
		cpwmsg.style.color = 'blue';
		//event.target.className = '';
		cpwmsg.className = '';
	}
	else{
		document.getElementById('cpwmsg').innerHTML = '비밀번호가 일치하지 않습니다';
		document.getElementById('cpwmsg').style.color = 'red';
		//event.target.className = 'reborder';
		cpwmsg.className = 'error';
	}
}

//회원정보 수정 버튼 누르고 넘어가기
function mychange(){
	ps = document.querySelectorAll('p');
	cnt = 0;
	for(i=0; i<ps.length; i++){
		if(ps[i].className === 'error') cnt++;								
	}
	if(cnt != 0) {	
		alert('비밀번호를 확인해 주세요');
		return;	
	}
	else{
		document.getElementById('mychangeForm').submit();	// 모든 조건 만족 시 mychangeForm submit
	}
}

function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>

<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>

			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>

	<!-- 경로 줄 -->
	<!-- 2020.08.03 -->
	<header class="site-navbar" role="banner">
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a><span class="mx-2 mb-0">/</span>
							<a href="${cpath }/myPage/">My Page</a><span class="mx-2 mb-0">/</span>
							<strong	class="text-black">My Change</strong>
						</div>
					</div>
				</div>
			</div>
		</header>
	
		<!-- 개인정보 변경 입력란 -->
		<!-- 2020.07.22 -->
		<!-- 2020.07.31 : 아이디부분 joinForm 과 일치화시킴 -->
		<div class="site-section">
			<div class="container">
			
			<div class="row mb-12">
				<!-- 12칸 중에서 9칸 차지 -->
				<div class="col-md-9 order-2">
					<div class="row ml-2">

						<form method="POST" class="col-md-12" id="mychangeForm">

							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<!-- 이름 -->
									<div class="col-md-12">
										<label for="name" class="text-black">이름</label>
										<input type="text" class="form-control" id="name" name="name" value="${login.name }">
									</div>
								</div>
								<!-- 이메일 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="email" class="text-black">Email</label>
										<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" value="${login.email }" readonly>
									</div>
								</div>
								<!-- 비밀번호 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="Password" class="text-black">비밀번호<span class="text-danger">*</span></label>
										<input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="비밀번호를 입력하세요" required>
									</div>
								</div>
<!-- 								변경 할 비밀번호 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="Password" class="text-black">새 비밀번호<span class="text-danger"></span></label>
										<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" onkeyup="checkPasswordComplexity(this);">
										<p id="pwmsg"></p> 
									</div>
								</div>
								<!-- 비밀번호 확인 -->
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_subject" class="text-black">비밀번호 확인<span class="text-danger"></span></label>
										<input type="password" class="form-control" id="userpwck" name="userpwck" placeholder="비밀번호를 다시 입력하세요" onkeyup="checkPassword(this)">
										<p id="cpwmsg"></p> 
									</div>
								</div>
								<!-- 휴대폰 번호 -->
								<div class="form-group row">
									<div class="col-md-12">
									<label for="phonenum" class="text-black" style="display: block;">휴대폰 번호</label>
                    				<input type="text" class="form-control" style="display: inline-block;" id="phone" name="phone" maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${login.phone }">                  
									</div>
								</div>
								<!-- 주소 -->
								<!-- 나중에 도로명주소 API 가져오자 -->								
								<div class="form-group row">
									<div class="col-md-12">
			               			<label for="address" class="text-black" style="display: block;">주소 입력</label>
            			   			<input type="text" class="col-md-6 form-control" style="display: inline-block;" id="postcode" name="postcode" placeholder="우편번호" value="${postcode }">
               						<input type="button" class="col-md-3 ml-3 btn btn-primary btn-lg" value="검색" style="display: inline-block;" onclick="Postcode()">
               						<input type="text" class="col-md-12 mt-3 form-control" id="address" name="address" placeholder="주소" value="${address }">
               						<input type="text" class="col-md-12 mt-3 form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${detailAddress }">
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-lg-12">
										<input type="button" class="btn btn-primary btn-lg btn-block"
											value="회원정보 수정" onclick="mychange()">
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
			
							
				<!-- 왼쪽 사이드바 -->
				<!-- 2020.08.03 -->
				<jsp:include page="/WEB-INF/views/include/myleftsidebar.jsp" flush="false" />		
				
			</div>
			</div>	
		</div>
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false" />

</body>
</html>