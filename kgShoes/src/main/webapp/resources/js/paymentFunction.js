
//2020.08.06
//클릭한 종류에 따라 스크롤 표시
function scrollShow(event){
	console.log('========클릭==========');
	// 클릭 종류 id
	buttonId = event.target.id;
	// 클릭 종류에 대한 스크롤 id
	showId = buttonId.split('-');
	
	// 클릭 id에 따라 스크롤 표시여부
	switch(buttonId){
	case 'button-bankPay':
		if(document.getElementById(showId[1]).className === 'collapse mt-4 show'){	// 스크롤이 표시돼있는경우
			document.getElementById(showId[1]).className = 'collapse mt-4';			// 미표시
			
//			2020.08.13
//			input hidden값 value 바꾸기
//			2020.08.18
//			모든 getElementById('orderPayoption')코드 ==> getElementById('checkPay')로 수정
			document.getElementById('checkPay').value = '';
		}
		else {
			document.getElementById('bankPay').className = 'collapse mt-4 show'; // 표시
			document.getElementById('checkPay').value = 'checkBank';
		}
		document.getElementById('creditPay').className = 'collapse mt-4';	// 다른 스크롤들 미표시
		document.getElementById('mobilePay').className = 'collapse mt-4';
		break;
	case 'button-creditPay':
		if(document.getElementById(showId[1]).className === 'collapse mt-4 show'){	// 스크롤이 표시돼있는경우
			document.getElementById(showId[1]).className = 'collapse mt-4';			// 미표시
			document.getElementById('checkPay').value = '';
		}
		else {
			document.getElementById('creditPay').className = 'collapse mt-4 show';
			document.getElementById('checkPay').value = 'checkCredit';
		}
		document.getElementById('bankPay').className = 'collapse mt-4';
		document.getElementById('mobilePay').className = 'collapse mt-4';
		break;
	case 'button-mobilePay':
		if(document.getElementById(showId[1]).className === 'collapse mt-4 show'){	// 스크롤이 표시돼있는경우
			document.getElementById(showId[1]).className = 'collapse mt-4';			// 미표시
			document.getElementById('checkPay').value = '';
		}
		else {
			document.getElementById('mobilePay').className = 'collapse mt-4 show';
			document.getElementById('checkPay').value = 'checkMobile';
		}
		document.getElementById('bankPay').className = 'collapse mt-4';
		document.getElementById('creditPay').className = 'collapse mt-4';
		break;
	}
}

//2020.08.13
//결제 넘기기
function completePayment(){
//	결제내역 확인 체크
	var chk = document.getElementById('chk-pay-agreement');
	var payoption = document.getElementById('checkPay').value;
	var shipDifferentAddress = document.getElementById('c_ship_different_address');
	console.log('payoption : ' + payoption);
	
	var recieveName = document.getElementById('recieve-name').value;
	var recievepNum = document.getElementById('recieve-pNum').value;
	var postcode = document.getElementById('postcode').value;
	var address = document.getElementById('address').value;
	var detailAddress = document.getElementById('detailAddress').value;
	
	
	if(chk.checked && payoption != '' ){	// 체크 되었다면 form넘기기
		document.getElementById('paymentForm').submit();
	}else if(chk.checked && payoption != '' && recieveName != '' && 
			 recievepNum != '' && postcode != '' && address != '' && detailAddress != ''){
		document.getElementById('paymentForm').submit();
	}else if(payoption == ''){
		alert('결제 내역을 입력해주세요');
	}else{
		alert('결제 내역을 확인해주세요');
	}
}

// 2020.08.13
// 카드번호 입력 자동 하이픈 붙이기
//2020.08.19
//코드 수정
function autoHypen(event){
	console.log('cardclick');
	
	var number = event.value.replace(/[^0-9]/g, "");
    var card = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 8) {
    	card += number.substr(0, 4);
    	card += "-";
    	card += number.substr(4,4);
    } else if(number.length < 12) {
    	card += number.substr(0, 4);
    	card += "-";
    	card += number.substr(4, 4);
    	card += "-";
    	card += number.substr(8,4);
    } else{
    	card += number.substr(0, 4);
    	card += "-";
    	card += number.substr(4, 4);
    	card += "-";
    	card += number.substr(8, 4);
    	card += "-";
    	card += number.substr(12, 4);
    }
    event.value = card;
}

//2020.08.19
//카드만료일 자동 / 넣기
function autoSlash(event){
	
	var number = event.value.replace(/[^0-9]/g, "");
	var date = "";
	
	if(number.length < 2){
		return number;
	}else{
		date += number.substr(0,2);
		date += "/";
		date += number.substr(2,2);
	}
	event.value = date;
}

//2020.08.13
//주소입력
function payPostcode() {
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