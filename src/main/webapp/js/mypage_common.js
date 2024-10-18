function formatNumber(number) {
    return number.toLocaleString();
}

// 로그아웃 기능 구현
function logout() {
    // 로컬 스토리지에서 토큰 제거
    localStorage.removeItem("token");  // 로컬 스토리지에서 토큰 제거
    alert("로그아웃 성공");
    location.href = '/'; // 메인 페이지로 이동
}

const token = localStorage.getItem("token");

function mypageCommInfo(){
    $.ajax({
        url: '/user/mypageCommInfo',
        type: 'POST',
        contentType: 'application/json',
        headers: {
            "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success:function(response){
            console.log(response.currentID);
            console.log(response.reservePoint);
            console.log(response.reviewCompletedAmount);

            const currentID = response.currentID;
            const reservePoint = response.reservePoint;
            const reviewCompletedAmount = response.reviewCompletedAmount;
            // 내 아이디 정보
            $('.currentID').text(currentID+" 님");
            //내 적립금 현황
            $('.reservePoint').text(formatNumber(reservePoint));
            // 내 리뷰 수 업데이트
            $('.afterCountSpan').text(reviewCompletedAmount);
        },
         error: function(error) {
            console.log('오류 발생: ' + error);  // 에러 메시지 자체 출력
        }
    })
}


$(function(){
    mypageCommInfo();
});