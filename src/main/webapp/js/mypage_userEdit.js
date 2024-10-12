$(function(){
    const token = localStorage.getItem("token");

    function userInfo(){
        $.ajax({
            url: '/user/userInfo',
            type: 'POST',
            contentType: 'application/json',
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success:function(response){
                console.log(response.userinfo);
                console.log(response.reviewCompletedAmount);
            },
             error: function(xhr, status, error) {
                console.log('오류 발생: ' + error);  // 에러 메시지 자체 출력
            }
        })//ajax 끝
    }//userInfo 함수 끝
    userInfo();
})//jquery 끝