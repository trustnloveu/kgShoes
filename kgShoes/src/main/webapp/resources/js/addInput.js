// Encoding: UTF-8

param = document.getElementById('param');
arrInput = [];
	
function addInput() {
	// 기존 input에 파일이 지정되었는지 확인하고 나서 추가해주기
	test = (() => {
		for(i = 0; i < param.children.length; i++) {
			if(param.children[i].children[0].value === '')
				return false;
		}
		return true;
	})();	// 화살표 함수를 만들어서 그 함수를 실행한 결과를 test에 저장한다 (boolean이 저장됨)
	
//	if(test === false) {	// 활성화 하면 한번에 여러 input을 추가 못함 (업로드에는 지장 없음)
//		alert('파일을 지정한 이후 추가하세요');
//		return;
//	}
	
	fs = document.createElement('fieldset');
	fs.style.margin = '20px';
	fs.style.width = '300px';
	
	ob = document.createElement('input');
	ob2 = document.createElement('input');
	ob3 = document.createElement('input');
	ob4 = document.createElement('input');
	ob5 = document.createElement('input');
	ob6 = document.createElement('input');
	
	ob.type = 'text';
	ob.name = 'merchandiseName';
	ob.placeholder = '상품이름';
	
	ob2.type = 'number';
	ob2.name = 'price';
	ob2.placeholder = '가격입력';
	
	ob3.type = 'text';
	ob3.name = 'brand';
	ob3.placeholder = '브랜드명 입력';
	
	ob4.type = 'text';
	ob4.name = 'category';
	ob4.placeholder = '카테고리 입력';
	
	ob5.type = 'number';
	ob5.name = 'quantity';
	ob5.placeholder = '수량 입력';	
	
	ob6.type = 'file';
	ob6.name = 'userFile';	
	
	fs.appendChild(ob);
	fs.appendChild(ob2);
	fs.appendChild(ob3);
	fs.appendChild(ob4);
	fs.appendChild(ob5);
	fs.appendChild(ob6);
	param.appendChild(fs);
}