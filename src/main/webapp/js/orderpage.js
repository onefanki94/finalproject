function formatNumber(number) {
    return number.toLocaleString();
}

$(function () {
    // 금액들 1000원 단위로 포맷
    $('.order_product_price').each(function() {
        var price = $(this).data('price');
        $(this).text(formatNumber(price));
    });

    var order_total_price=0;
    $('.order_product_totalPrice').each(function() {
        var price = $(this).closest(".order_product_li").find(".order_product_price").data('price');
        var amount = $(this).closest(".order_product_li").find(".order_product_amount").data('amount');
        var proTotal = price * amount;
        console.log(proTotal);
        $(this).text(formatNumber(proTotal));
        // 전체 총 금액에 상품 총 가격 합산
        order_total_price += proTotal;
    });

    $('.order_proAll_price').text(formatNumber(order_total_price)+"원");
    $('.user_point_info').text(formatNumber(user_point)+"P");
    //사용가능한 적립금 보여주기
    var max_use_point = Math.floor(order_total_price * 0.1); // 총 주문 금액의 10%
    // 실제 사용할 수 있는 적립금은 보유 적립금과 주문 금액의 10% 중 작은 값
    var available_point = Math.min(user_point, max_use_point);
    console.log("사용 가능 적립금: " + available_point);
    $('.available_point').text(formatNumber(available_point)+"P");

    var fee = order_total_price >= 150000 ? 0 : 2500; // 15만원 이상이면 배송비 0원
    $('.order_fee').text(formatNumber(fee)+"원");

    //적립금 모두 사용 버튼 클릭시
    $(document).on('click', '#order_usePoint_btn', function() {
        $("#order_use_point").val(available_point);
        updateTotalPrice();
    });

    // 사용 적립금 입력 이벤트
    $(document).on('input', '#order_use_point', function() {
        updateTotalPrice();
    });

    // 총 결제 금액 및 적립금 사용 관련 업데이트 함수
    function updateTotalPrice() {
        // 사용 적립금
        var use_point =  parseInt($("#order_use_point").val()) || 0;
        if (use_point > available_point) {
            use_point = available_point;
            $("#order_use_point").val(use_point);
        }
        $('.order_usePoint_info').text("-"+formatNumber(use_point)+"P");

        // 총 결제 예정 금액
        // 주문상품금액 + 배송비 - 적립금사용액
        var total_payPrice = order_total_price + fee - use_point;
        $('.total_payPrice').text(formatNumber(total_payPrice)+"원");
        $("#total_payPrice").val(total_payPrice);
        // 적립 예정 금액
        $('.point_accumulated').text(formatNumber(order_total_price/100)+"원");
    }

    updateTotalPrice();

    $("#chk_payment").change(function () {
      if ($(this).prop("checked")) {
        $("label[for='chk_payment']").addClass("divClick");
      } else {
        $("label[for='chk_payment']").removeClass("divClick");
      }
    });

    $("#chk_agree").change(function () {
      if ($(this).prop("checked")) {
        $("label[for='chk_agree']").addClass("checkedLabel");
      } else {
        $("label[for='chk_agree']").removeClass("checkedLabel");
      }
    });



  });