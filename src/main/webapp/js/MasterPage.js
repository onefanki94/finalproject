$(document).ready(function() {
    $('.menu-item').click(function(e) {
        e.preventDefault(); // 기본 클릭 동작 방지
        $(this).nextAll('.submenu').slideToggle(); // 해당 메뉴의 서브메뉴 토글
    });
});
