// 찜하기 이벤트
function updateGood(merchanName) {
	p = document.getElementById('page').innerText;
	p2 = p.slice(1, 2);
	ob = {
		merchanName: merchanName,
		page : p2,
	}
	data = JSON.stringify(ob);
	console.log(data);
	
	const request = new XMLHttpRequest();
	request.open("PUT", cpath + "/good/", true);
	request.setRequestHeader('Content-type', 'application/json; text; charset=UTF-8');
	
	request.onreadystatechange = function() {
		
		if(request.readyState == 4 && request.status == 200) {
			response = request.response;
			console.log(response);
			if(response == 'true') {
				location.href = cpath + '/' + p2 + '/';		// 찜하기 클릭 시 해당 페이지로 넘겨주기 위해 페이지 값도 주소에 넣어준다
			}
			else {
				
			}
		}
	}
	request.send(data);
}