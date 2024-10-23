var token;
var userid;
var useridx;

setTimeout(function() {
    token = localStorage.getItem("token"); // 토큰 값 가져오기

    if (token && token.trim() !== "") { // 토큰이 존재하는지 확인
        $.ajax({
            url: "/getuser",
            type: "get",
            data: { Authorization: token },
            success: function(vo) {
                userid = vo.userid;
                useridx = vo.idx;

            }
        });
    }
    console.log("1초 후에 실행됩니다.");
}, 100);

