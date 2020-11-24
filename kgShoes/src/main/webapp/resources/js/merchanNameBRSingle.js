const merchanNameDIV = document.querySelectorAll(".merchanName");
let merchanNameArr = new Array();


function check(merchanNameArr){
    for(i=0 ; i < merchanNameArr.length ; i++){
        if(merchanNameArr[i].length > 17){
        	let pre = merchanNameArr[i].substring(0,8);
        	//console.log('pre : ' + pre);
        	let mid = merchanNameArr[i].substring(8,17);
        	//console.log('mid : ' + mid);
        	let suf = merchanNameArr[i].substring(17);
        	//console.log('suf : ' + suf);
        	
        	let flag = pre.lastIndexOf(' ');
        	let prevPre = pre.substring(0, flag);
        	//console.log('prevPre : ' + prevPre);
        	let afterPre = pre.substring(flag);
        	//console.log('afterPre : ' + afterPre);
        	flag = mid.lastIndexOf(' ');
        	let afterMid = mid.substring(0, flag);
        	//console.log('afterMid : ' + afterMid);
        	let afterSuf = mid.substring(flag);
        	//console.log('afterSuf : ' + afterSuf);
        	
        	let lastString = prevPre + '<br/>' + afterPre + afterMid + '<br/>' + afterSuf + suf;
        	merchanNameDIV[i].innerHTML = lastString;
        	
        }
        
        else if(merchanNameArr[i].length > 8 && merchanNameArr[i].length <= 18){
            let pre = merchanNameArr[i].substring(0,8);
            let suf = merchanNameArr[i].substring(8);
            
            let flag = pre.lastIndexOf(' ');
            let afterPre = pre.substring(0,flag);
            let afterSuf = pre.substring(flag);
            let lastString = afterPre + '<br/>' + afterSuf + suf;
            //console.log(lastString);
            merchanNameDIV[i].innerHTML = lastString;             
        }else if(merchanNameArr[i].length <= 8){
        	
        	merchanNameDIV[i].innerHTNL = merchanNameDIV[i].innerHTNL + '<br/>';
        }
    }
}

function createArr(){
    for(i=0 ; i < merchanNameDIV.length ; i++){
        merchanNameArr.push(merchanNameDIV[i].innerHTML);
    }
    check(merchanNameArr);
}

function init(){
    //console.log(merchanNameDIV);
    createArr();
}

init();
