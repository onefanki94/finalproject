$(document).ready(function() {
    $('.menu-item').click(function(e) {
        e.preventDefault(); // 기본 클릭 동작 방지
        $(this).nextAll('.submenu').slideToggle(); // 해당 메뉴의 서브메뉴 토글
    });
});


$(document).ready(function(){
    $('.tab-link').on('click', function() {
        // 모든 탭에서 active 클래스 제거
        $('.tab-link').removeClass('active');
        $('.tab-content').removeClass('active').hide();

        // 클릭된 탭에 active 클래스 추가
        $(this).addClass('active');

        // 클릭된 탭에 해당하는 콘텐츠 표시
        let target = $(this).data('tab');
        $('#' + target).addClass('active').show();
    });
});