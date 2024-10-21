$(function(){
    $('.pro_price').each(function(index) {
        // 배열에서 해당 상품의 가격 가져오기
        var productPrice = prices[index];
        // 가격을 포맷하여 해당 요소에 출력
        $(this).find(".pro_price_span").text(formatNumber(productPrice) + "원");
    });

    $('.refundDeliveryFee').text(formatNumber(refundDeliveryFee)+"원");

    calculateRefund();
})

function calculateRefund() {
    let cancelAmount = 0; //실제 카드환불될 금액
    // 취소 상품 금액을 합산
    let cancelProductPrice = 0;
    for (let i = 0; i < prices.length; i++) {
        cancelProductPrice += prices[i] * cancelCounts[i]; // 가격 * 수량을 합산
    }

    // 적립금은 환불 금액의 비율에 따라 계산
    let refundUsePoint = use_point * (cancelProductPrice / totalProductPrice);

    // 최종 환불 금액 계산 = 취소 상품 금액 - 적립금 사용 금액 + 배송비
    cancelAmount = cancelProductPrice - refundUsePoint + refundDeliveryFee;

    // 환불 예정 금액을 화면에 표시
    $('.cancelProductPrice').text(formatNumber(cancelProductPrice)+"원");
    $('.pay_totalPrice').text(formatNumber(cancelAmount)+"원");
    $('.cancel_totalPrice').text(formatNumber(cancelAmount+refundUsePoint)+"원");
    $('.cancel_amount').text(formatNumber(cancelAmount)+"원");

    // 적립금 환불 예정 금액 표시
    $('.order_usePoint').text(formatNumber(refundUsePoint)+"원");
    $('.cancel_point').text(formatNumber(refundUsePoint)+"원");
}

// 결제 취소하기
$(document).on('click', '#cancel_input_btn', function() {
    let cancelAmount = $('.cancel_amount').text().replace("원", "").replace(",", "");
    let refundUsePoint = $('.cancel_point').text().replace("원", "").replace(",", "");

    console.log("cancelAmount",cancelAmount);
    console.log("refundUsePoint",refundUsePoint);

    if(confirm("선택한 상품을 삭제하시겠습니까?")){
        $.ajax({
            url: '/order/cancel',
            type: 'POST',
            data: JSON.stringify({
                cancelAmount: cancelAmount,
                refundUsePoint: refundUsePoint
            }),
            contentType: 'application/json',
            headers: {
                    "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success: function(response) {
                alert("상품 결제를 취소하셨습니다.")
                location.href = "/user/mypage_order";
            },
            error: function(xhr, status, error) {
                alert("결제 취소 중 오류가 발생했습니다. 관리자에게 문의해주세요.\n" + xhr.responseText);
                console.log('상품 결제 취소 중 에러 발생:', error);
            }
        });
    }
})