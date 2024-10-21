
$371(document).ready(function() {
    $371('.carousel-banner-images').slick({
        dots: true,               // 슬라이더 하단에 네비게이션 점 표시
        infinite: true,           // 슬라이더가 무한히 반복되도록 설정
        speed: 1500,               // 슬라이드 전환 속도 (밀리초 단위)
        slidesToShow: 1,          // 한 번에 보여줄 슬라이드 수
        slidesToScroll: 1,        // 한 번에 스크롤할 슬라이드 수
        autoplay: true,           // 슬라이더 자동 재생 활성화
        autoplaySpeed: 1400,      // 자동 재생 속도 (밀리초 단위)
        arrows: true,             // 좌우 화살표 표시
        prevArrow: '<button class="slick-prev"></button>', // 이전 버튼 커스텀
        nextArrow: '<button class="slick-next"></button>', // 다음 버튼 커스텀
        fade: false,              // 페이드 효과 사용 (true로 설정 시 페이드 전환)
        pauseOnHover: true        // 슬라이더 위에 마우스가 올려질 때 자동 재생 일시 중지
    });
    console.log('Slick initialized'); // 초기화 확인을 위한 로그 출력
});

function moveSlide(sectionId, direction) {
    var $section = $('#' + sectionId + ' .pop-carousel-images, #' + sectionId + ' .carousel-goods-images, #' + sectionId + ' .new-carousel-images, #' + sectionId + ' .md-images');
    var slideWidth = $section.find('.product, .goods-item').outerWidth(true); // 슬라이드 너비 계산
    var newPosition = $section.scrollLeft() + (direction * slideWidth); // 이동할 위치 계산

    $section.animate({
        scrollLeft: newPosition
    }, 800); // 부드럽게 스크롤
}

$371(document).ready(function() {
    $371('.pop-carousel-images').slick({
        infinite: true,
        slidesToShow: 6,
        slidesToScroll: 1,
        arrows: true,             // 좌우 화살표 표시
        prevArrow: '<button class="slick-prev"></button>', // 이전 버튼 커스텀
        nextArrow: '<button class="slick-next"></button>', // 다음 버튼 커스텀
    });
    console.log('Slick initialized'); // 초기화 확인을 위한 로그 출력
});

$371(document).ready(function() {
    $371('.origin-carousel-images').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,             // 좌우 화살표 표시
        prevArrow: '<button class="slick-prev"></button>', // 이전 버튼 커스텀
        nextArrow: '<button class="slick-next"></button>', // 다음 버튼 커스텀
    });
    console.log('Slick initialized'); // 초기화 확인을 위한 로그 출력
});


$371(document).ready(function() {
    $371('.new-carousel-images').slick({
        infinite: true,
        slidesToShow: 6,
        slidesToScroll: 1,
        arrows: true,             // 좌우 화살표 표시
        prevArrow: '<button class="slick-prev"></button>', // 이전 버튼 커스텀
        nextArrow: '<button class="slick-next"></button>', // 다음 버튼 커스텀
    });
    console.log('Slick initialized'); // 초기화 확인을 위한 로그 출력
});

$371(document).ready(function() {
    $371('.md-carousel-images').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,             // 좌우 화살표 표시
        prevArrow: '<button class="slick-prev"></button>', // 이전 버튼 커스텀
        nextArrow: '<button class="slick-next"></button>', // 다음 버튼 커스텀
    });
    console.log('Slick initialized'); // 초기화 확인을 위한 로그 출력
});

//공지사항이동
function goToNoticePage() {
    window.location.href = "/allnotice"; // notice 페이지로 이동
}

