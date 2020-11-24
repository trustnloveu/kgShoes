const searchPw = () => {	
    var name = document.getElementById('nameForPw').value;
    var email = document.getElementById('emailForPw').value;
    var phone = document.getElementById('phoneForPw').value;
    console.log(name + email + phone);

   	axios.get(cpath + '/helpPw/' + name + '/' + email + '/' + phone + '/')
    	.then((response) => {
    		console.log('123123');
    		if(response.data === ''){
    	
    			alert('입력하신 정보와 일치하는 계정이 없습니다. ');
    	
    		}else{
    			alert(name + '님의 임시비멀번호를 ' + email + '로 보내드렸습니다.');
                location.href = cpath + '/loginForm/';
    		}
    		
    	});    	
}

