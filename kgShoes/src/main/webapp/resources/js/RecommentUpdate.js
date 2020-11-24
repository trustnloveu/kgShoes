// << 2020년 8월 20일 수정 >>
// 댓글 수정버튼에 대한 js
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
// 댓글 수정 폼
function recommentUpdate(renum, context, writer, customerCode, name) {
	
	if(doubleSubmitCheck()) return;		// doubleSubmitCheck()이 false이면 수행, true이면 빠져나온다
	
	console.log("custom : " + customerCode);
	console.log("name : " + name);
	
	div = document.getElementById("renum" + renum);
	div2 = document.getElementById("context" + renum);
	div3 = document.getElementById("writer" + renum);
	div4 = document.getElementById("update" + renum);
	div5 = document.getElementById("updatecancel" + renum);
	div6 = document.getElementById("span" + renum);
	
	div.outerHTML = '<div id="renum' + renum + '"><input type="hidden" name="renum" value="' + renum + '"></div>';
	div2.outerHTML = '<div id="context' + renum + '" class="comment-content col-md-8"><input class="reviewRead-inputReplyUpdate" style="width: 600px;" type="text" name="context" placeholder="댓글 수정" maxlength="300"></div>';
	
	if(customerCode == 0) {		// 관리자 계정일 때
		div3.outerHTML = '<div id="writer' + renum + '" class="comment-writer col-md-2"><input class="reviewRead-inputReplyUpdate" style="width: 130px;" type="text" name="writer" value="관리자" readOnly></div>';
	}
	else {		// 나머지 계정일 때
		div3.outerHTML = '<div id="writer' + renum + '" class="comment-writer col-md-2"><input class="reviewRead-inputReplyUpdate" style="width: 130px;" type="text" name="writer" value="' + name + '" readOnly></div>';
	}
	
	div4.outerHTML = '<span id="update' + renum + '" class="update-comment"><input class="reviewRead-replyUpdateSubmit" type="submit" value="수정하기"></span>';
	div5.outerHTML = '<div id="updatecancel' + renum + '" class="update-comment" style="display: inline-block;"><input class="reviewRead-replybutton" type="button" value="취소하기" onclick="updatecancel(\'' + renum + '\', \'' + context + '\', \'' + writer + '\', \'' + customerCode + '\', \'' + name + '\');"></div>';
	div6.style.display = 'inline-block';
}

// 댓글 수정취소하기 폼
function updatecancel(renum, context, writer, customerCode, name) {
	
	doubleSubmitFlag = false;			// 다시 수정버튼 클릭이 가능하게 false로 바꿔준다
	
	div = document.getElementById("renum" + renum);
	div2 = document.getElementById("context" + renum);
	div3 = document.getElementById("writer" + renum);
	div4 = document.getElementById("update" + renum);
	div5 = document.getElementById("updatecancel" + renum);
	div6 = document.getElementById("span" + renum);
	
	div.outerHTML = '<div id="renum' + renum + '"></div>';
	div2.outerHTML = '<div id="context' + renum + '" class="comment-content col-md-8">' + context + '</div>';
	div3.outerHTML = '<div id="writer' + renum + '" class="comment-writer col-md-2">' + writer + '</div>';
	div4.outerHTML = '<span id="update' + renum + '" class="update-comment">수정</span>';
	div5.outerHTML = '<div id="updatecancel' + renum + '" class="update-comment" style="display: inline-block;"></div>';
	div6.style.display = 'none';
}