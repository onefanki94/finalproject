function reviewTab(tabId) {
    // 모든 탭을 숨김
    document.getElementById("tab1").classList.remove("on");
    document.getElementById("tab1").classList.add("off");
    document.getElementById("tab2").classList.remove("on");
    document.getElementById("tab2").classList.add("off");

    // 클릭한 탭만 보여줌
    document.getElementById(tabId).classList.remove("off");
    document.getElementById(tabId).classList.add("on");

    // heart_on_tab 클래스를 설정
    const tabs = document.querySelectorAll(".heart_tabmenu li");
    tabs.forEach((tab) => tab.classList.remove("heart_on_tab"));

    // 클릭한 탭에 heart_on_tab 추가
    if (tabId === "tab1") {
      tabs[0].classList.add("heart_on_tab");
    } else if (tabId === "tab2") {
      tabs[1].classList.add("heart_on_tab");
    }
}

function formatNumber(number) {
    return number.toLocaleString();
}
const token = localStorage.getItem("token");

function createPagination(totalPages, currentPage) {
    $(".custom-pagination").empty();

    // 이전 페이지 버튼 추가 (첫 페이지가 아닐 때만 표시)
    if (currentPage > 1) {
        $(".custom-pagination").append(`
            <span class="pageNumber_span">
                <span data-page="${currentPage - 1}" class="prev-page">&lt;</span>
            </span>
        `);
    }

    // 페이지 번호 버튼 생성
    for (let i = 1; i <= totalPages; i++) {
        $(".custom-pagination").append(`
            <span class="pageNumber_span">
                <span data-page="${i}">${i}</span>
            </span>
        `);
    }

    // 다음 페이지 버튼 추가 (마지막 페이지가 아닐 때만 표시)
    if (currentPage < totalPages) {
        $(".custom-pagination").append(`
            <span class="pageNumber_span">
                <span data-page="${currentPage + 1}" class="next-page">&gt;</span>
            </span>
        `);
    }

    // 현재 페이지에 'clicked' 클래스를 추가
    $(`.custom-pagination .pageNumber_span span[data-page='${currentPage}']`).addClass("clicked");

    // 페이지네이션 버튼 클릭 이벤트 설정
    $(".custom-pagination .pageNumber_span span").on('click', function() {
        const page = $(this).data('page');

        // 모든 페이지 번호에서 'clicked' 클래스 제거
        $(".custom-pagination .pageNumber_span span").removeClass("clicked");
        // 클릭된 요소에 'clicked' 클래스 추가
        $(this).addClass("clicked");

        // 선택한 페이지로 데이터 로드
        mypageGoodsLike(page);
    });
}

function mypageGoodsLike(page){
        const pageSize = 16; //한 페이지에 보여줄 항목 수

        $.ajax({
            url: '/user/myHeartGoodsList',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ page: page, pageSize: pageSize }),
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success: function(response) {
                console.log(response);
                const likeGoodsList = response.likeGoodsList;
                const totalPages = response.totalPages;
                const goodsTotalCount = response.goodsTotalCount;
                console.log("goodsTotalCount",goodsTotalCount);
                $('.goodsCount').text("("+goodsTotalCount+")");

                // 데이터를 화면에 출력 (예: #product_list에 추가)
                $(".goods_list_all").empty();
                likeGoodsList.forEach(likeGoodsList => {
                    const formattedAmount = formatNumber(likeGoodsList.price) + "원"; // 여기서 형식화된 금액을 변수로 저장
                    $(".goods_list_all").append(`
                        <li class="goods_list_li">
                          <div class="prd_b">
                            <a href="/storeDetail/${likeGoodsList.idx}">
                              <div class="goods_img_bx">
                                <img src="http://192.168.1.92:8000/${likeGoodsList.thumImg}" />
                                <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                              </div>
                              <div class="goods_imform">
                                <p class="goods_imform_aniTitle">${likeGoodsList.ani_title}</p>
                                <p class="goods_imform_title">${likeGoodsList.title}</p>
                                <p>${formattedAmount}</p>
                              </div>
                            </a>
                          </div>
                        </li>
                    `);
                });

                // 페이지네이션 버튼 생성, 현재 페이지를 전달
                createPagination(totalPages, page);
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    }

$(document).on('click', '.custom-pagination .pageNumber_span span', function() {
    // 모든 페이지 번호에서 'clicked' 클래스 제거
    $(".custom-pagination .pageNumber_span span").removeClass("clicked");
    // 클릭된 요소에 'clicked' 클래스 추가
    $(this).addClass("clicked");
});


$(function(){
    mypageGoodsLike(1);


})