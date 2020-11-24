/**
 * 	cart.jsp에서 사용되는 함수
 */

function setResultPrice() {
	totalprice = 0;
	prices = document.querySelectorAll('.merchanPrice');
	prices.forEach(element => {
		console.log(element.innerText.split(' ')[0]);
		totalprice = totalprice + +element.innerText.split(' ')[0];
	});
	console.log('totalprice : ' + totalprice);
	document.getElementById('resultPrice').innerText = totalprice + ' 원';
}

const quantityPlus = (merchanCode, shoeSize, singlePrice) => {	
    var quantityText = document.getElementById(merchanCode + '*' + shoeSize + 'Ammount');
    var priceText = document.getElementById(merchanCode + '*' + shoeSize + 'price');
    
    axios.get(cpath + '/getQuantity/' + merchanCode + '/' + shoeSize + '/')
    .then((response) => {
    	quantityText.value = (+quantityText.value) + 1;
    	var maxQuantity = response.data;
    	if (+maxQuantity < +quantityText.value) {
    		quantityText.value = maxQuantity;
    	}
		priceText.innerText = (+quantityText.value * +singlePrice) + ' 원';
		setResultPrice();
    });    
}

const quantityMinus = (merchanCode, shoeSize, singlePrice) => {
	var quantityText = document.getElementById(merchanCode + '*' + shoeSize + 'Ammount');
    var priceText = document.getElementById(merchanCode + '*' + shoeSize + 'price');

	quantityText.value = (+quantityText.value) - 1;
	if (+quantityText.value <= 0) {
		quantityText.value = 1;
    }

	priceText.innerText = (+quantityText.value * +singlePrice) + ' 원';
	setResultPrice();
}

const quantityKeyup = (merchanCode, shoeSize, singlePrice) => {
	var quantityText = document.getElementById(merchanCode + '*' + shoeSize + 'Ammount');
    var priceText = document.getElementById(merchanCode + '*' + shoeSize + 'price');
    
    axios.get(cpath + '/getQuantity/' + merchanCode + '/' + shoeSize + '/')
    .then((response) => {
    	var maxQuantity = response.data;
    	if (+maxQuantity < +quantityText.value) {
    		quantityText.value = maxQuantity;
    	}
		priceText.innerText = (+quantityText.value * +singlePrice) + ' 원';
		setResultPrice();
    });

}

const itemDelete = (merchanCode, shoeSize) => {	// 비회원일 경우 : 쿠키 제거, 회원일 경우 : DB데이터 제거
    var tr = document.getElementById(merchanCode + '*' + shoeSize);
    console.log(tr);
    var flag = confirm('상품을 제거하시겠습니까?');
    if (flag) {
    	axios.get(cpath + '/deleteItem/' + merchanCode + '/' + shoeSize + '/')
    	.then((response) => {
			tr.remove();
			setResultPrice();
    	});    	
    }
}