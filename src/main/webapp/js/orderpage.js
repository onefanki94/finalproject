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

    var fee = order_total_price >= 150000 ? 0 : 2500; // 15만원 이상이면 배송비 0원
    $('.order_fee').text(formatNumber(fee)+"원");

    // 사용 적립금
    var use_point = $("#order_use_point").val();
    // 총 결제 예정 금액
    // 주문상품금액 + 배송비 - (적립금사용액->아직 미구현)
    var total_payPrice = order_total_price+fee-use_point;
    $('.total_payPrice').text(formatNumber(total_payPrice)+"원");
    $("#total_payPrice").val(total_payPrice);
    // 적립 예정 금액
    $('.point_accumulated').text(formatNumber(order_total_price/100)+"원");






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