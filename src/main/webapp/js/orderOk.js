function formatNumber(number) {
    return number.toLocaleString();
}

$(function(){
    var order_total_price=0;
    // 주문 상품 1000원 단위로 포맷
    $('.order_product_price').each(function() {
        var price = $(this).data('price');
        $(this).text(formatNumber(price)+"원");
        var amount = $(this).closest(".pay_product_table_data").find(".order_product_amount").data('amount');
        var proTotal = price * amount;
        console.log(proTotal);
        order_total_price += proTotal;
    });

    var fee = order_total_price >= 150000 ? 0 : 2500; // 15만원 이상이면 배송비 0원
    $('.order_fee').text(formatNumber(fee)+"원");

    var use_point = $('.order_usePoint').data('usepoint')|| 0;
    $('.order_usePoint').text(formatNumber(use_point)+"원");

    var total_price = $('.order_totalPrice').data('totalprice')|| 0;
    $('.order_totalPrice').text(formatNumber(total_price)+"원");

})