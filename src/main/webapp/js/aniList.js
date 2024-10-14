/* =============슬라이더============= */
$(document).ready(function() {
    // 슬라이드 초기화
    $('.similar_ani_slider ul').slick({
        slidesToShow: 3,  // 한 번에 보여줄 슬라이드 수
        slidesToScroll: 1, // 스크롤할 슬라이드 수
        dots: true,        // 페이지네이션 점 표시
        infinite: true,    // 무한 슬라이드
        responsive: [      // 반응형 설정
            {
                breakpoint: 768, // 화면 크기가 768px 이하일 때
                settings: {
                    slidesToShow: 2, // 슬라이드 수 조정
                }
            },
            {
                breakpoint: 480, // 화면 크기가 480px 이하일 때
                settings: {
                    slidesToShow: 1, // 슬라이드 수 조정
                }
            }
        ]
    });
});

/*@@@@@@@@@@@@@장르@@@@@@@@@@*/

$(document).ready(function () {
    // 애니메이션 카드 클릭 시 모달 열기
    $('.list_img_bg').on('click', function () {
        const title = $(this).data('title'); // 클릭한 카드의 제목 가져오기
        const imageSrc = $(this).find('img').attr('src'); // 클릭한 카드의 이미지 경로 가져오기

        // 모달 내용 업데이트
        $('.animodal_item_infoDiv h1').text(title);
        $('.animodal_item_imgBack img').attr('src', imageSrc); // 모달 이미지 업데이트
        $('.animodal_item_bottom_nav div > div > div > div').text(`비슷한 작품 - ${title}`); // 비슷한 작품 제목 업데이트 (예시)

        // 모달 열기
        $('.animodal_body').fadeIn();
    });

    // 모달 닫기 (X 버튼 클릭 시)
    $(".fa-x").click(function() {
        $(".animodal_body").fadeOut(); // 모달을 닫기 위해 fadeOut 효과를 사용
    });

    // 모달 닫기 (배경 클릭 시)
    $(".animodal_background").click(function() {
        $(".animodal_body").fadeOut();
    });

    // 애니메이션 줄거리 모달 열기
    $('.ouline_more').on('click', function () {
        // 애니메이션 제목과 정보를 가져와서 모달에 표시
        const summaryTitle = $(this).closest('.animodal_infoHead').find('h1').text();
        const summaryContent = $(this).closest('.animodal_infoBody').find('.ani_outline span').text();

        $('.aniInfo_modal_container .item-detail-info-modal section span').eq(0).text(summaryTitle);
        $('.aniInfo_modal_container .item-detail-info-modal section span').eq(1).text(summaryContent);

        // 줄거리 모달 열기
        $('.aniInfo_modal_body').fadeIn();
    });

    // 줄거리 모달 닫기 (X 버튼 클릭 시)
    $('.aniInfo_modal_container_flex .fa-solid.fa-x').on('click', function () {
        $('.aniInfo_modal_body').fadeOut();
    });

    // 줄거리 모달 닫기 (배경 클릭 시)
    $('.aniInfo_modal_body > div:first-child').on('click', function () {
        $('.aniInfo_modal_body').fadeOut();
    });
});