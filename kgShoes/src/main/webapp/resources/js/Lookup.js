// 단일 조회에 필요한 기능 js파일

var result;


    
const displayNoneAxios = () => {
      console.log('displayNoneAxios executed');
     axios.get(cpath + '/getShoesQuantity/' + merchanCode + '/')
     .then( (response) => {
         const result = response.data;
             for(key in result){
                if(+result[key].quantity === 0){
                    document.getElementById(result[key].shoeSize + 'span').style.display='none'; 
                }
            }
        })
        .catch((e) => {
            console.log('exception : ' + e);
        });
}

    
const axiosTest = () => {
	console.log('axiosTest');
    axios.get(cpath + '/getShoesQuantity/' + merchanCode + '/')
    .then((response) => {
    	result = response.data;
        for (key in result) {
        	if(+result[key].quantity === 0) {
                document.getElementById(result[key].shoeSize + '').innerText = result[key].shoeSize + '(품절)';
                document.getElementById(result[key].shoeSize + '').disabled = true;   // 품절 상품이면 비활성화 - 07.21 bong
            }
            else if(+result[key].quantity <= 10) {
                document.getElementById(result[key].shoeSize + '').innerText = result[key].shoeSize + '(' + result[key].quantity + '개)';
            }
		}
    })
    .catch((e) => {
        console.log('exception : ' + e);
    });
}


//2020-08-03 axiosAddCart(), quantityPlus(), quantityMinus(), quantityKeydown() 수정 및 추가 (조재일)
// 2020-08-06 수정 (조재일) 
const axiosAddCart = () => {
    var Ammount = document.getElementById('itemAmmount').value;
    var shoesSize = document.getElementById('shoesSize').value;
    
    if (shoesSize === 'Size') {
    	alert('사이즈를 선택해주세요.');
    }
    else {
    	axios.get(cpath + '/addCart/' + merchanCode + '/?Ammount=' + Ammount + '&shoesSize=' + shoesSize + '&price=' + price)	// 수정
    	.then((response) => {
    		console.log(response);
    		if (response.data === 1) {
    			alert('장바구니에 등록되었습니다.');
    			location.href = cpath + '/shopSingle/'+ merchanCode + '/';
    		}
    	})
    	.catch((e) => {
    		console.log('exception : ' + e);
    	});    		
    }
}


const quantityPlus = () => {
    var quantityText = document.getElementById('itemAmmount');
    var shoesSizeSelect = document.getElementById('shoesSize').value;
    var priceText = document.getElementById('priceText');
    
    
    if (shoesSizeSelect !== 'Size') {
        quantityText.value = (+quantityText.value) + 1;
        for(key in result) {
        	if (result[key].shoeSize + '' === shoesSizeSelect + '' && +result[key].quantity < +quantityText.value) {
                quantityText.value = result[key].quantity;
        	}
        }
    }
    else {
    	alert('사이즈를 선택해주세요.');
    }

    priceText.innerText = (+quantityText.value * +price) + ' 원';
}

const quantityMinus = () => {
    var quantityText = document.getElementById('itemAmmount');
    var priceText = document.getElementById('priceText');

	quantityText.value = (+quantityText.value) - 1;
	if (+quantityText.value <= 0) {
		quantityText.value = 1;
    }

    priceText.innerText = (+quantityText.value * +price) + ' 원';
}

const quantityKeydown = () => {
    var quantityText = document.getElementById('itemAmmount');
    var shoesSizeSelect = document.getElementById('shoesSize').value;
    var priceText = document.getElementById('priceText');

    for(key in result) {
        if (result[key].shoeSize + '' === shoesSizeSelect + '' && +result[key].quantity < +quantityText.value) {
            quantityText.value = result[key].quantity;
        }
    }

    priceText.innerText = (+quantityText.value * +price) + ' 원';
}

//2020.08.03 
//결제창 넘어가기
function payment(){
	ammount = document.getElementById('itemAmmount').value;
	var list = document.getElementById('shoesSize');
	var size = list.options[list.selectedIndex].value;

	console.log()
	
	location.href = cpath+"/payment?code="+merchanCode+"&ammount="+ammount+"&size="+size;
	
}

function stockcheck(){	
//	2020.08.06
//	결재정보 form형식으로 으로 보내기
	var form = document.getElementById('reportForm');
	
	var input_code = document.createElement('input');

	input_code.setAttribute('type', 'hidden');

	input_code.setAttribute('name', 'code');     		  //name 속성 지정
	input_code.setAttribute('value', merchanCode);        //value 값 설정

	form.appendChild(input_code);                 		  //from 태그에 추가
	
	form.submit();
}


