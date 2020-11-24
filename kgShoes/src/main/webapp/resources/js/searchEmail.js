const searchEmail = () => {	
    var name = document.getElementById('searchForName').value;
    var phone = document.getElementById('searchForPhone').value;
    console.log(name);

   	axios.get(cpath + '/helpEmail/' + name + '/' + phone + '/')
    	.then((response) => {
    	
    		if(response.data === ''){
    	
    			alert('해당하는 아이디를 찾을 수 없습니다. ');
    	
    		}else{
    			alert(name + '님의 아이디는 ' + response.data + '입니다.');
                location.href = cpath + '/loginForm/';
    		}
    		
    		
    		
    	});    	
    }

