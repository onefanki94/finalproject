$(function(){
    $('.pro_price').each(function(index) {
        // 배열에서 해당 상품의 가격 가져오기
        var productPrice = prices[index];
        // 가격을 포맷하여 해당 요소에 출력
        $(this).text(formatNumber(productPrice) + "원");
    });
})

// 체크박스
$(document).on('change', '.chk_product', function () {
    if ($(this).prop("checked")) {
        $(this).next("label").addClass("checkedLabel");
    } else {
        $(this).next("label").removeClass("checkedLabel");
    }
});

//수량 버튼 클릭
//+
$(document).on('click', '.cancelAmount_plus', function() {
    var inputAmount = $(this).closest('.cancel_amount_count').find('#cancel_amount'); // 수량 input
    var currentAmount = parseInt(inputAmount.val());
    var index = $(this).closest('tr').index(); // 해당 상품의 index 가져오기

    if(currentAmount < maxAmounts[index]){
        var newAmount = currentAmount + 1;
        inputAmount.val(newAmount); // 수량 업데이트
        console.log("inputAmount",inputAmount.val());
    }else {
        alert("취소 수량은 최대 구매하신 수량만큼 선택 가능합니다.");
    }
});
//-
$(document).on('click', '.cancelAmount_minus', function() {
    var inputAmount = $(this).closest('.cancel_amount_count').find('#cancel_amount'); // 수량 input
    var currentAmount = parseInt(inputAmount.val());

    if(currentAmount > 1){
        var newAmount = currentAmount - 1;
        inputAmount.val(newAmount); // 수량 업데이트
        console.log("inputAmount",inputAmount.val());
    }else {
        alert("취소 수량은 1개 이상이어야 합니다.");
    }
});

// 다음으로 버튼 클릭시 ajax 호출
$(document).on('click', '#next_cancelPage', function() {
    var selectedProducts = {};
    // 체크된 상품만 pro_idx, 취소수량 저장
    $('.chk_product:checked').each(function() {
        var pro_idx = $(this).val(); // 상품의 pro_idx 값
        var cancelCount = $(this).closest('tr').find('.cancel_amount_input').val(); // 취소할 수량
        selectedProducts[pro_idx] = cancelCount; // Map 형태로 추가
    });

    // 선택된 상품이 없으면 알림
    if (Object.keys(selectedProducts).length === 0) {
        alert("취소할 상품을 선택해주세요.");
        return;
    }

    console.log("selectedProducts", selectedProducts);

    $.ajax({
        url: '/order/cancel_countInfo',
        type: 'POST',
        data: JSON.stringify({
                cancelProducts: selectedProducts
        }),
        contentType: 'application/json',
        headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            location.href = `/order/mypage_cancel2`;
        },
        error: function(error) {
            console.log('취소 페이지 이동중 에러 발생:', error);
        }
    });
});