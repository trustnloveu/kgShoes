const merchanNameDIV = document.querySelectorAll(".merchanName");
let merchanNameArr = new Array();


function check(merchanNameArr){
    for(i=0 ; i < merchanNameArr.length ; i++){
        if(merchanNameArr[i].length >= 10){
            let pre = merchanNameArr[i].substring(0,10);
            let suf = merchanNameArr[i].substring(10);
            
            let flag = pre.lastIndexOf(' ');
            let afterPre = pre.substring(0,flag);
            let afterSuf = pre.substring(flag);
            let lastString = afterPre + '<br/>' + afterSuf + suf;
          //  console.log(lastString);
            merchanNameDIV[i].innerHTML = lastString;             
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
