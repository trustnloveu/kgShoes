// 상품 정렬
function sort(order) {	
	const li = document.querySelectorAll('li.imgRow.show');	// 필터로 처리된 줄만 가져온다
	const a = document.querySelectorAll('a.code'); // 정렬과 함께 링크도 같이 변경하기 위해 a태그의 id가 code인것을 전부 가져온다
    const rows = [];	// trs를 받아와서 rows에 저장하기 위해 선언
    
    // 상품 정보들을 list에 저장
	for(let i = 0; i < li.length; i++) {
		
		// 가격 비교를 위해 콤마 제거 후, 정수 변환
		p = li[i].children[0].children[0].children[6].innerText;	// 정렬을 위해 text값만 가져온다
		p2 = p.slice(0, -1);
		p2 = p.replace(",", "") * 1;
		
		// li의 값들과 a의 값들을 rows에 삽입
		rows.push({
			aTag: a[i].href,	// a의 href값만 변경해주기 위해 href값만 뽑아냄
			code: li[i].children[0].children[0].children[0].innerText,
			imgSrc: li[i].children[0].children[0].children[1].innerHTML,
			category: li[i].children[0].children[0].children[2].innerHTML,
			good: li[i].children[0].children[0].children[3].children[1].innerText,
			brand: li[i].children[0].children[0].children[4].innerHTML,
			merchanName: li[i].children[0].children[0].children[5].innerHTML,
			price: p2,
		});
	}
	console.log(rows);
	
	// order에 따른 정렬
	switch(order) {
    case "merchanName":
    	rows.sort(function(a, b){
    		return a.merchanName > b.merchanName ? 1 : -1;
    	});
    	break;
    case "priceAsc":
    	rows.sort(function(a, b){
            return a.price > b.price ? 1 : -1;
        });
        break;
    case "priceDesc":
    	rows.sort(function(a, b) {
			return a.price < b.price ? 1 : -1;
		});
    	break;
    case "brand":
    	rows.sort(function(a, b){
            return a.brand > b.brand ? 1 : -1;
        });
    	break;
    case "category":
    	rows.sort(function(a, b){
            return a.category > b.category ? 1 : -1;
        });
    	break;
    default:
        return;
	}
	
	// 정렬된 내용을 HTML에 적용
	for(let i = 0; i < rows.length; i++) {
		a[i].href = rows[i].aTag;
		li[i].children[0].children[0].children[1].innerHTML = rows[i].imgSrc
		li[i].children[0].children[0].children[2].innerHTML = rows[i].category;
		li[i].children[0].children[0].children[3].children[1].innerHTML = rows[i].good;
		li[i].children[0].children[0].children[4].innerHTML = rows[i].brand;
		li[i].children[0].children[0].children[5].innerHTML = rows[i].merchanName;
		li[i].children[0].children[0].children[6].innerHTML = "<label class='ml-label'>" + numberFormat(rows[i].price) + "</label>";
	}
	
    // 천단위 콤마
    function numberFormat(inputNumber) {
		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
}
