
//2020.08.06
//결제방법 클릭 시 스크롤 입력 내용 표시여부
document.getElementById('button-bankPay').addEventListener('click',scrollShow);
document.getElementById('button-creditPay').addEventListener('click',scrollShow);
document.getElementById('button-mobilePay').addEventListener('click',scrollShow);

//2020.08.13
//카드번호 입력 시 자동 하이픈 붙이기
document.getElementById('c_card').addEventListener('onkeyup',autoHypen);