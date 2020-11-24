// 후기 펼치기
function reviewScroll() {
	div = document.getElementById('review-fold');
	button = document.getElementById('review-con');
	
	div.style.display = 'block';		
	button.outerHTML = '<button class="view-btn review-con shopSingle-review-con" id="review-con" onclick="reviewFold();">후기접기</button>';
}

// 후기 접기
function reviewFold() {
	div = document.getElementById('review-fold');
	button = document.getElementById('review-con');
	
	div.style.display = 'none';
	button.outerHTML = '<button class="view-btn review-con" id="review-con" onclick="reviewScroll();">후기보기</button>';
}