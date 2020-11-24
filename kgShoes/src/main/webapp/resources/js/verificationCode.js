function verificationCode(searchType) {
	
	// 이름과 전화번호가 같음을 전제(기능추가, 구현안할듯)
	// DB 정보와 동일할 경우 아래 코드 진행
	
	var verifiCode = "<div class='form-group row d-flex' data-aos='zoom-in' style='margin: auto;'>";

	verifiCode += "<div class='col-md-6 mt-2'>";
	verifiCode += "<label for='v_subject' class='text-black mb-0 pb-0'>인증번호(미구현)";
	verifiCode += "<span class='text-danger'>*</span>";
	verifiCode += "</label>";
	verifiCode += "<input id='v_subject' class='form-control' type='text' name='vCode' placeholder='인증코드' maxlength='6' required>";
	verifiCode += "</div>";

	verifiCode += "<div class='col-md-6 mt-2'>";
	verifiCode += "<span class='text-black'>타이머(미구현)</span>";	
	verifiCode += "<div class='form-control' style='background-color: beige'>";	
	verifiCode += "00:<span id='timer'>60</span>";
	verifiCode += "</div>";
	verifiCode += "</div>";

	verifiCode += "</div>";
	
	
	var verifiDiv;
	
	if (searchType === "id") {
		verifiDiv = document.getElementById('verifi_code_id');
		verifiDiv.innerHTML = verifiCode;
		
//		input type > button > submit 변환
		var submitBtn = document.getElementById('id_search_input');
		submitBtn.type = "submit";
		submitBtn.onclick = "";
		console.log(submitBtn);
		console.log(submitBtn.onclick);
	}
	
	else if (searchType === "pw") {
		verifiDiv = document.getElementById('verifi_code_pw');
		verifiDiv.innerHTML = verifiCode;
		
//		input type > button > submit 변환
		var submitBtn = document.getElementById('pw_search_input');
		submitBtn.type = "submit";
		submitBtn.onclick = "";
		console.log(submitBtn);
		console.log(submitBtn.onclick);
	}
	
	
}
