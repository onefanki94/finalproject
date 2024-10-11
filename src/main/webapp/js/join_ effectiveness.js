function formCheck(){
    //아이디
    if(document.getElementById("userid").value==''){
        alert("아이디를 입력하세요!");
        return false;
    }

    //비밀번호
    if(document.getElementById("userpwd").value==''){
        alert("비밀번호를 입력하세요!");
        return false;
    }
    if(document.getElementById("userpwd").value != document.getElementById("userpwd2").value){
        alert("비밀번호가 같지 않습니다!");
        return false;
    }

    //이름
    var username = document.getElementById("username").value;
    var regEx = /^[가-힣]{2,15}$/;
    if(!regEx.test(username)){
        alert("이름을 잘못 입력했습니다!");
        return false;
    }
    return true
}

