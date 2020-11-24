
function logout(){
	let con = confirm('로그아웃 하시겠습니까?');
	if(con == true){
		location.href = `${cpath}/logout/`;
	}
}
