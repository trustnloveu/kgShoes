boxs = document.getElementById('filter').querySelectorAll('input[type="checkbox"]');	// filter의 input의 checkbox인것들을 모두 가져온다 
li = document.querySelectorAll('li.imgRow');	// tr을 모두 받아온다
filter = [];		// filter에 뭐가 들어가있는지 확인하기 위해 선언(작업 확인용)
notChecked = true;	// 체크여부
filterType = '';	// 체크타입(중복체크 여부를 결정할 때 사용된다)
doubleChecked = false;	// 중복체크여부

for(i in boxs) {	// boxs 하나 하나에 대해 
boxs[i].onclick = function click() {	// 체크가 되면
	
	// 체크 된 className을 판단해서
	switch (this.className) {	
	case "brandCheck":
		f = this.id;	// f에 해당 className의 id를 저장
		// 체크가 되었으면 filterType에 brandCheck의 약자인 b를 저장 아니면 비우기
        filterType = this.checked ? filterType += 'b' : filterType.replace('b', '');	
        break;
	case "categoryCheck":
		f = this.id;
        filterType = this.checked ? filterType += 'c' : filterType.replace('c', '');
        break;
	case "priceCheck":
		f = this.id;
		switch (f) {	// 받아온 priceCheck 값을 숫자로 치환하기 위해서 switch ~ case 사용(금액 값을 받아와서 비교해야 하기 때문에 숫자로 치환한다)
		case "6만원 미만":
			f = 59999;	
			break;
		case "6만원 이상 ~ 10만원 미만":
			f = 99999;
			break;
		case "10만원 이상 ~ 14만원 미만":
			f = 139999;
			break;
		case "14만원 이상":
			f = 140000;
			break;
		default:
			return;
		}
        filterType = this.checked ? filterType += 'p' : filterType.replace('p', '');
        break;
	}
	this.checked ? filter.push(f) : filter.splice(filter.indexOf(f), 1);
	notChecked = filter.length == 0;
	
	console.log(filter);
	console.log('filterType : ' + filterType);
	console.log('notChecked : ' + notChecked);
	
	// 중복 체크 확인
	doubleChecked = (filterType.indexOf('b') != -1 && filterType.indexOf('c') != -1) || 
					(filterType.indexOf('b') != -1 && filterType.indexOf('p') != -1) ||
					(filterType.indexOf('c') != -1 && filterType.indexOf('p') != -1);
	console.log('doubleChecked : ' + doubleChecked);
    
    // 만약 체크가 되었다면
    if(notChecked == false) {
    	for(i = 0; i < li.length; i++) {
    		cond1 = li[i].children[0].children[0].children[2].outerText;
    		cond2 = li[i].children[0].children[0].children[4].outerText;
    		cond3 = li[i].children[0].children[0].children[6].outerText;
    		
    		// 천단위 콤마 제거 후 정수로 변환
    		cond4 = cond3.replace(",", "") * 1;
    		
    		console.log('cond1 : ' + cond1);
    		console.log('cond2 : ' + cond2);
    		console.log('cond4 : ' + cond4);
    		console.log('==================')
    		
    		// 금액의 범위에 따라 cond1에 정수값 저장
    		if(cond4 < 60000){	// 만약 받아온 금액이 6만원 미만이면 cond1에 59999를 저장
    			cond4 = 59999;
    		}
    		else if(cond4 >= 60000 && cond4 < 100000) {
    			cond4 = 99999;
    		}
    		else if(cond4 >= 100000 && cond4 < 140000) {
    			cond4 = 139999;
    		}
    		else if(cond4 >= 140000){
    			cond4 = 140000;
    		}
    		
    		// 중복체크가 안되어 있고, filter에 cond값이 존재하지 않으면 해당 row를 숨긴다 
    		if(doubleChecked == false && filter.indexOf(cond1) == -1 && filter.indexOf(cond2) == -1 && filter.indexOf(cond4) == -1) {
                li[i].className = 'imgRow none';
            }
    		
    		// 중복체크가 되어 있고, cond중 하나라도 값이 없으면 해당 row를 숨긴다
    		else if (doubleChecked == true && (filter.indexOf(cond1) == -1 || filter.indexOf(cond2) == -1) && 
    				(filter.indexOf(cond1) == -1 || filter.indexOf(cond4) == -1) && 
    				(filter.indexOf(cond2) == -1 || filter.indexOf(cond4) == -1)){
    			li[i].className = 'imgRow none';
            }
    		else {	// 위에 해당하지 않으면 table에서 해당 row를 원래대로 돌린다
    			li[i].className = 'imgRow show';
            }
    	}
    }
    // 체크가 안되어 있다면 row를 보여준다
    else {
    	for(i = 0; i < li.length; i++) {
    		li[i].className = 'imgRow show';
            }
        }
	};
}