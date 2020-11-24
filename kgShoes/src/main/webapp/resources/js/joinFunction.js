
/*8.6 Bong -- className을 통쨰로 바꾸면 형식이 깨지므로 classList활용*/
const WARN_CN = 'reborder';


//이메일의 keyup event 발생시 이메일 형식 체크 함수 실행 
function checkEmailFormat(event){		
	const email = document.getElementById('email');	// joinForm의 이메일 받아오기
	idmsg = document.getElementById('idmsg');	// 이메일 중복값 확인하는 idmsg
	

	const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	// 이메일 형식
	if(regExp.test(email.value) == false){
		idmsg.innerText = '잘못된 이메일 형식입니다';
		idmsg.style.color = 'red';
		//event.target.className = 'reborder';
		//email.className = 'reborder';
		email.classList.add(WARN_CN);
		return false;
	}else{
		email.classList.remove(WARN_CN);
		return true;
	}
}

//이메일의 blur event 발생 시 이메일 중복 체크 함수 실행
function checkEmail(event){		
	const email = document.getElementById('email');
	idmsg = document.getElementById('idmsg'); 
	const request = new XMLHttpRequest();
	request.open('POST', cpath + '/checkEmail/');
	request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	request.send("email=" + email.value);
	request.onreadystatechange = function() {
		if(checkEmailFormat() === false)		// 이메일 형식이 맞는지 체크
			return;		
		else {				// 이메일 형식 맞을 경우 밑의 코드 실행
			if(request.readyState == 4 && request.status == 200){
				if(request.responseText === '이미 사용중인 계정입니다'){
					idmsg.innerHTML = request.responseText;
					idmsg.style.color = 'red';
					email.classList.add(WARN_CN);
					//event.target.className = 'reborder';
				}
				else{
					idmsg.innerHTML = request.responseText;
					email.classList.remove(WARN_CN);
					idmsg.style.color = 'blue';
				}
			}
		}
	}
}

// 비밀번호 정규식 체크
//2020.07.31 
//password => Password 수정 / mccheckPasswordComplexity() 함수 추가 / checkPassword 함수 수정
function checkPasswordComplexity(event){
	const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/; // 대소문자, 특수문자, 숫자의 조합으로 6자 이상

	const password = document.getElementById('password');
	const pwmsg = document.getElementById('pwmsg');

	if(regExp.test(password.value) == false){		// 비밀번호 정규식과 입력값이 안맞는 경우
		password.classList.add(WARN_CN);
		pwmsg.innerHTML = '비밀번호는 영문,숫자, 특수문자의 조합으로 6이상';
		pwmsg.style.color = 'red';
		pwmsg.className = 'error';
	}
	else {
		//event.target.className = '';
		password.classList.remove(WARN_CN);
		
		pwmsg.className = '';
		pwmsg.innerHTML = '비밀번호 사용 가능';
		pwmsg.style.color = 'blue';
	}
}

function mccheckPasswordComplexity(event){
	const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/; // 대소문자, 특수문자, 숫자의 조합으로 6자 이상
	
	const password = document.getElementById('password');
	const pwmsg = document.getElementById('pwmsg');
	
	console.log('=============' + password.value.length);
	if(password.length == 0){
		pwmsg.className = '';
		pwmsg.innerHTML = '';
	}
	else if(regExp.test(password) == false){		// 비밀번호 정규식과 입력값이 안맞는 경우
		console.log('=============' + password.value);
		pwmsg.innerHTML = '비밀번호는 영문,숫자, 특수문자의 조합으로 6이상';
		pwmsg.style.color = 'red';
		pwmsg.className = 'error';
	}
	else {
		pwmsg.className = '';
		pwmsg.innerHTML = '비밀번호 사용 가능';
		pwmsg.style.color = 'blue';
	}
}

// 비밀번호, 비밀번호 확인 값 비교
function checkPassword(event) {
	const password = document.getElementById('password');
	const cPassword = document.getElementById('confirmPassword');
	const cpwmsg = document.getElementById('cpwmsg');

	if(password.value.length == 0){
		cpwmsg.innerHTML = '';
		cpwmsg.className = '';
	}
	else if(password.value === cPassword.value){
		cpwmsg.innerHTML = '비밀번호 일치';
		cpwmsg.style.color = 'blue';
		//event.target.className = '';
		cPassword.classList.remove(WARN_CN);
		cpwmsg.className = '';
	}
	else{
		document.getElementById('cpwmsg').innerHTML = '비밀번호가 일치하지 않습니다';
		document.getElementById('cpwmsg').style.color = 'red';
		//event.target.className = 'reborder';
		cPassword.classList.add(WARN_CN);
		cpwmsg.className = 'error';
	}
}

// 태어난 년도 4자리 확인하기
function checkYear(event){
	console.log('checkyyyyyyyy');
	const year = document.getElementById('yy');
	const yymsg = document.getElementById('yymsg');
	
	
	if(year.value.length != 4){
		yymsg.style.display = 'block';
		yymsg.innerHTML = '태어난 년도 4자리를 입력하세요';
		yymsg.style.color = 'red';
		year.classList.add(WARN_CN);
		//event.target.className = 'reborder';
	}else{
		//event.target.className = '';
		year.classList.remove(WARN_CN);
		yymsg.style.display = 'none';
	}
}

// 회원가입
function join(){
	inputs = document.querySelectorAll('input');
	termsChks = document.querySelectorAll('.termCheck');
//	console.log(inputs.length);
	cnt = 0;
	
	for(i=0 ; i<termsChks.length ; i++){
		if(!termsChks[i].checked)	{		// 필수항목이 체크가 안되어있을시
			cnt++;							

		}
	}
	
	console.log("cnt : " + cnt);
	
	for(i=0; i<inputs.length; i++){
		if(inputs[i].className.indexOf(WARN_CN) !== -1 ){	// input의 기본 클래스이름 = 없음, 입력조건에 안맞을 시 클래스이름 = reborder
//			console.log(inputs[i].className);
			cnt++;								// input 클래스이름이 reborder인 것 카운트 
		}
	}
	console.log(cnt);
	
	if(cnt != 0) {		// cnt가 0이 아닐 경우 reborder클래스가 있는 경우로 보고 submit 안되게 한다
		alert('필수항목을 입력해 주세요	');
		return;	
	}
	else{
		console.log("submit!");
		document.getElementById('joinForm').submit();	// 모든 조건 만족 시 joinForm submit
	}
}

//2020.07.31 
//회원정보 수정 버튼 누르고 넘어가기
function mychange(){
	ps = document.querySelectorAll('p');
	cnt = 0;
	for(i=0; i<ps.length; i++){
		if(inputs[i].className === 'error') cnt++;								
	}
	if(cnt != 0) {	
		alert('비밀번호를 확인해 주세요');
		return;	
	}
	else{
		document.getElementById('mychangeForm').submit();	// 모든 조건 만족 시 mychangeForm submit
	}
}

// 이용약관 모두 체크
function checkAll(){
	checks = document.getElementsByName('check');
	console.log(checks.length);
	if(document.getElementById('checkAll').checked){	// 모두체크 체크 시 
		for(i=0; i<checks.length; i++){
			checks[i].checked = true;		// 약관 모두 체크
		}
	}else{
		for(i=0; i<checks.length; i++){
			checks[i].checked = false;		// 모두체크 해제시 체크된 모든 항목 체크 해제
		}
	}
}


