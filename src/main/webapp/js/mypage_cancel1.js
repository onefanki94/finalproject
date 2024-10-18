function formatNumber(number) {
    return number.toLocaleString();
}

$(function(){
    $('.pro_price').text(formatNumber(price)+"원");



})