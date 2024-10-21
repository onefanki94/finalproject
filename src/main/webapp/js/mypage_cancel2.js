$(function(){
    $('.pro_price').each(function(index) {
        // 배열에서 해당 상품의 가격 가져오기
        var productPrice = prices[index];
        // 가격을 포맷하여 해당 요소에 출력
        $(this).find(".pro_price_span").text(formatNumber(productPrice) + "원");
    });
})

$(document).on('click', '#next_cancelPage', function() {
    var cancelReasonSelect = $("#cancelReason").val();
    var cancelReasonDetail = $("#cancelReasonDetail").val();

    var cancelReason = cancelReasonSelect+cancelReasonDetail;
    console.log(cancelReason);

    $.ajax({
        url: '/order/cancel_reasonInfo',
        type: 'POST',
        data: JSON.stringify({
                cancelReason: cancelReason
        }),
        contentType: 'application/json',
        headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            location.href = `/order/mypage_cancel3?cancelReason=${cancelReason}`;
        },
        error: function(error) {
            console.log('취소 페이지 이동중 에러 발생:', error);
        }
    });
})