// << 2020년 8월 19일 수정>>
// 후기 수정하기 폼
function reviews(rnum, merchanCode, cpath, writer, context, img) {
	div = document.getElementById("rewriter" + rnum);
	div2 = document.getElementById("rereview" + rnum);
	div3 = document.getElementById("reimg" + rnum);
	div4 = document.getElementById("rebutton" + rnum);
	div5 = document.getElementById("recancel" + rnum);
	div6 = document.getElementById("reimg2" + rnum);
	span = document.getElementById("span2");
	
	console.log(div3);
	console.log(div6);
	
	if(div3 == null) {		// 이미지가 없을 때
		span.outerText = "";
		cdiv = document.createElement('div');
		cdiv.id = 'reimg' + rnum;
		cdiv.className = 'review-photo-wrapper col-xs-3';
		input = document.createElement('input');
		input.type = 'file';
		input.name = 'userfile';
		cdiv.appendChild(input);
		div6.appendChild(cdiv);
	}
	if(div6 == null) {		// 이미지가 있을 때
		div3.innerHTML = '<input type="file" name="userfile">';
	}
	
	div.outerHTML = '<div id="rewriter' + rnum + '" class="title col-md-8"><span class="writer"><input class="reviewRead-reviewsUp-writer" type="text" name="writer" value="' + writer + '"></span></div>';
	div2.outerHTML = '<div id="rereview' + rnum + '" class="reviewRead-review"><input class="reviewRead-reviewsUp-context" type="text" name="context" placeholder="후기 수정" maxlength="300"></div>';
	div4.outerHTML = '<input id="rebutton' + rnum + '" class="btn update-btn" type="submit" value="수정하기">';
	div5.outerHTML = '<input id="recancel' + rnum + '" class="btn update-btn" style="margin-right: 10px;" type="button" value="취소하기" onclick="cancel(\'' + rnum + '\', \'' + merchanCode + '\', \'' + cpath + '\', \'' + writer + '\', \'' + context + '\', \'' + img + '\');">';
}

// 후기 취소하기 폼
function cancel(rnum, merchanCode, cpath, writer, context, img) {
	div = document.getElementById("rewriter" + rnum);
	div2 = document.getElementById("rereview" + rnum);
	div3 = document.getElementById("reimg" + rnum);
	div4 = document.getElementById("rebutton" + rnum);
	div5 = document.getElementById("recancel" + rnum);
	div6 = document.getElementById("reimg2" + rnum);
	
	console.log(div6);
	console.log(div3);
	
	if(div6 != null) {		// 이미지가 없을 때
		div6.outerHTML = '<div id="reimg2' + rnum + '" class="review-photo-wrapper col-xs-3"><span id="span2" style="color: black; font-weight: 700;">이미지가 없습니다.</span></div>';
	}
	else {		// 이미지가 있을 때
		div3.outerHTML = '<div id="reimg' + rnum + '" class="review-photo-wrapper col-xs-3"><img src="' + cpath + '/img/' + img + '"></div>';
	}
	
	div.outerHTML = '<div id="rewriter' + rnum + '" class="title col-md-8"><span class="writer">' + writer + '</span></div>';
	div2.outerHTML = '<div id="rereview' + rnum + '" class="reviewRead-review">' + context + '</div>';
	div4.outerHTML = '<button id="rebutton' + rnum + '" type="button" class="btn update-btn" onclick="reviews(\'' + rnum + '\', \'' + merchanCode + '\', \'' + cpath + '\', \'' + writer + '\', \'' + context + '\', \'' + img + '\')">수정</button>';
	div5.outerHTML = '<div id="recancel' + rnum + '" style="display: inline-block;"></div>';
}