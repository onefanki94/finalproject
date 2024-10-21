$(function(){
    $('.pro_price').each(function(index) {
        // 배열에서 해당 상품의 가격 가져오기
        var productPrice = prices[index];
        // 가격을 포맷하여 해당 요소에 출력
        $(this).find(".pro_price_span").text(formatNumber(productPrice) + "원");
    });

    $('.refundDeliveryFee').text(formatNumber(refundDeliveryFee) + "원");

    calculateRefund();  // calculateRefund 함수 호출
});

function truncatePrice(number) {
    return Math.floor(number);  // 소수점 아래 자리를 모두 버림
}

function calculateRefund() {
    let cancelAmount = 0;  // 실제 카드 환불될 금액
    let cancelProductPrice = 0;  // 취소 상품 금액 합산
    let totalRefundUsePoint = 0;  // 적립금 총 사용 금액
    let refundUsePoint = 0;  // 개별 상품의 적립금 환불 금액
    let totalRoundedCancelAmount = 0;  // 소수점 버림 후 총 취소 금액 합계
    let lastProductIndex = prices.length - 1;  // 마지막 상품 인덱스
    let totalDifference = 0; // 전체 차이 값 저장

    // 상품 가격과 취소 수량을 기준으로 취소 금액을 계산
    for (let i = 0; i < prices.length; i++) {
        let productCancelPrice = prices[i] * cancelCounts[i];  // 개별 상품 가격 * 수량
        cancelProductPrice += productCancelPrice;  // 취소 상품 금액 합산

        // 적립금 비율을 계산하여 적용
        refundUsePoint = Math.floor(use_point * (productCancelPrice / totalProductPrice));

        totalRefundUsePoint += refundUsePoint;  // 적립금 총 사용 금액 합산

        // 소수점 버림 후 취소 금액 합산
        totalRoundedCancelAmount += Math.floor(productCancelPrice);

        // 마지막 항목에선 소수점 잔여 차이를 반영하지 않고, 마지막에서 보정
        if (i === lastProductIndex) {
            totalDifference = cancelProductPrice - totalRoundedCancelAmount;
        }
    }

    // 마지막 상품에서 발생한 소수점 차이 보정
    if (totalDifference > 0) {
        cancelProductPrice -= totalDifference;  // 소수점 차이만큼 마지막 금액에서 보정
    }

    // 최종 카드 환불 금액 계산
    cancelAmount = Math.floor(cancelProductPrice - totalRefundUsePoint + refundDeliveryFee);

    // 환불 예정 금액을 화면에 표시
    $('.cancelProductPrice').text(formatNumber(cancelProductPrice) + "원");
    $('.pay_totalPrice').text(formatNumber(cancelAmount) + "원");
    $('.cancel_totalPrice').text(formatNumber(cancelAmount + totalRefundUsePoint) + "원");
    $('.cancel_amount').text(formatNumber(cancelAmount) + "원");

    // 적립금 환불 예정 금액 표시
    $('.order_usePoint').text(formatNumber(totalRefundUsePoint) + "원");
    $('.cancel_point').text(formatNumber(totalRefundUsePoint) + "원");
}

// 결제 취소하기
$(document).on('click', '#cancel_input_btn', function() {
    let cancelAmount = $('.cancel_amount').text().replace("원", "").replace(",", "");
    let refundUsePoint = $('.cancel_point').text().replace("원", "").replace(",", "");

    console.log("cancelAmount", cancelAmount);
    console.log("refundUsePoint", refundUsePoint);

    if(confirm("선택한 상품을 삭제하시겠습니까?")) {
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
                alert("상품 결제를 취소하셨습니다.");
                location.href = "/user/mypage_order";
            },
            error: function(xhr, status, error) {
                alert("결제 취소 중 오류가 발생했습니다. 관리자에게 문의해주세요.\n" + xhr.responseText);
                console.log('상품 결제 취소 중 에러 발생:', error);
            }
        });
    }
});
