// << 2020년 8월 20일 수정 >>
// 답글 추가 및 접기에 관한 js
// 중복 클릭 방지
var doubleSubmitFlag = false;
function doubleSubmitCheck() {
	if(doubleSubmitFlag){
	   return doubleSubmitFlag;
	}else{
	   doubleSubmitFlag = true;
	   return false;
	}	
}

// << 2020년 8월 20일 수정 >>
// 답글 추가 폼
function addrecomment(renum, index, customerCode, name){
	
	if(doubleSubmitCheck()) return;		// doubleSubmitCheck()이 false이면 수행, true이면 빠져나온다 
	
	recomment = document.getElementById("recomment" + index);
	form = document.getElementById('form');
	button = document.getElementById('button' + index).outerHTML = '<button class="reviewRead-btn-folder" id="button' + index + '" type="button" onclick="foldrecomment(\'' + renum + '\', \'' + index + '\', \'' + customerCode + '\', \'' + name + '\')"><span class="insert-recomment">답글접기</span></button>';
	
	ob = document.createElement('input');
	ob2 = document.createElement('input');
	ob3 = document.createElement('input');
	ob4 = document.createElement('input');
	
	if(customerCode == 0) {		// 관리자 계정일 때
		ob.type = 'text';
		ob.className = 'reviewRead-replywriter';
		ob.id = 'writer';
		ob.name = 'writer';
		ob.value = '관리자';
		ob.readOnly = 'true';
	}
	else {	// 그 외 나머지 계정일 때
		ob.type = 'text';
		ob.className = 'reviewRead-replywriter';
		ob.id = 'writer';
		ob.name = 'writer';
		ob.value = name;
		ob.readOnly = 'true';
	}
	
	ob2.type = 'text';
	ob2.className = 'reviewRead-replycontext';
	ob2.id = 'context';
	ob2.name = 'context';
	ob2.placeholder = '댓글을 입력하시오';
	
	ob3.type = 'hidden';
	ob3.id = 'renum';
	ob3.name = 'renum';
	ob3.value = renum;
	
	ob4.type = 'submit';
	ob4.className = 'reviewRead-replysubmit';
	ob4.id = 'submit';
	ob4.value = '답글달기';
	
	form.appendChild(ob);
	form.appendChild(ob2);
	form.appendChild(ob3);
	form.appendChild(ob4);
	recomment.appendChild(form);
}

//답글 접기 폼
function foldrecomment(renum, index, customerCode, name) {
	
	doubleSubmitFlag = false;	// 답글 접기를 클릭 했을 떄, doubleSubmitFlag를 다시 false로 바꿔서 답글 추가 폼이 작동되게 한다.
	
	writer = document.getElementById("writer");
	context = document.getElementById("context");
	renum2 = document.getElementById("renum");
	submit = document.getElementById('submit');

	writer.parentNode.removeChild(writer);
	context.parentNode.removeChild(context);
	renum2.parentNode.removeChild(renum2);
	submit.parentNode.removeChild(submit);
	
	button = document.getElementById('button' + index);
	
	button.outerHTML = '<button class="reviewRead-replybutton" id="button' + index + '" type="button" onclick="addrecomment(\'' + renum + '\', \'' + index + '\', \'' + customerCode + '\', \'' + name + '\')"><span class="insert-recomment">답글달기</span></button>';
}