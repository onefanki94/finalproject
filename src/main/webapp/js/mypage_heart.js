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

function createPaginationGoods(totalPages, currentPage) {
    $(".custom-pagination-goods").empty();

    // 이전 페이지 버튼 추가 (첫 페이지가 아닐 때만 표시)
    if (currentPage > 1) {
        $(".custom-pagination-goods").append(`
            <span class="pageNumber_span">
                <span data-page="${currentPage - 1}" class="prev-page">&lt;</span>
            </span>
        `);
    }

    // 페이지 번호 버튼 생성
    for (let i = 1; i <= totalPages; i++) {
        $(".custom-pagination-goods").append(`
            <span class="pageNumber_span">
                <span data-page="${i}">${i}</span>
            </span>
        `);
    }

    // 다음 페이지 버튼 추가 (마지막 페이지가 아닐 때만 표시)
    if (currentPage < totalPages) {
        $(".custom-pagination-goods").append(`
            <span class="pageNumber_span">
                <span data-page="${currentPage + 1}" class="next-page">&gt;</span>
            </span>
        `);
    }

    // 현재 페이지에 'clicked' 클래스를 추가
    $(`.custom-pagination-goods .pageNumber_span span[data-page='${currentPage}']`).addClass("clicked");

    // 페이지네이션 버튼 클릭 이벤트 설정
    $(".custom-pagination-goods .pageNumber_span span").on('click', function() {
        const page = $(this).data('page');
        $(".custom-pagination-goods .pageNumber_span span").removeClass("clicked");
        $(this).addClass("clicked");
        mypageGoodsLike(page);
    });
}

function createPaginationAni(totalPages, currentPage) {
    $(".custom-pagination-ani").empty();

    // 이전 페이지 버튼 추가 (첫 페이지가 아닐 때만 표시)
    if (currentPage > 1) {
        $(".custom-pagination-ani").append(`
            <span class="pageNumber_span">
                <span data-page="${currentPage - 1}" class="prev-page">&lt;</span>
            </span>
        `);
    }

    // 페이지 번호 버튼 생성
    for (let i = 1; i <= totalPages; i++) {
        $(".custom-pagination-ani").append(`
            <span class="pageNumber_span">
                <span data-page="${i}">${i}</span>
            </span>
        `);
    }

    // 다음 페이지 버튼 추가 (마지막 페이지가 아닐 때만 표시)
    if (currentPage < totalPages) {
        $(".custom-pagination-ani").append(`
            <span class="pageNumber_span">
                <span data-page="${currentPage + 1}" class="next-page">&gt;</span>
            </span>
        `);
    }

    // 현재 페이지에 'clicked' 클래스를 추가
    $(`.custom-pagination-ani .pageNumber_span span[data-page='${currentPage}']`).addClass("clicked");

    // 페이지네이션 버튼 클릭 이벤트 설정
    $(".custom-pagination-ani .pageNumber_span span").on('click', function() {
        const page = $(this).data('page');
        $(".custom-pagination-ani .pageNumber_span span").removeClass("clicked");
        $(this).addClass("clicked");
        mypageAniLike(page);
    });
}

function mypageGoodsLike(page){
    const pageSize = 16; //한 페이지에 보여줄 항목 수

    $(".goods_list_all").empty();
    $(".no_heart_goods").empty();

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

            if (likeGoodsList && likeGoodsList.length > 0) {
                likeGoodsList.forEach(likeGoodsList => {
                    const formattedAmount = formatNumber(likeGoodsList.price) + "원"; // 여기서 형식화된 금액을 변수로 저장
                    $(".goods_list_all").append(`
                        <li class="goods_list_li">
                          <input type="hidden" id="idx" value="${likeGoodsList.idx}">
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
                createPaginationGoods(totalPages, page);
            }else{
                $(".no_heart_goods").append(`
                    <p>좋아요한 굿즈 내역이 없습니다.</p>
                `);
                $(".custom-pagination-goods").empty(); // 페이지네이션 초기화
            }
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
}

function mypageAniLike(page){
    const pageSize = 20; //한 페이지에 보여줄 항목 수

    $(".ani_list_all").empty();
    $(".no_heart_ani").empty();

    $.ajax({
        url: '/user/myHeartAniList',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ page: page, pageSize: pageSize }),
        headers: {
            "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            console.log(response);
            const likeAniList = response.likeAniList;
            const totalPages = response.totalPages;
            const aniTotalCount = response.aniTotalCount;
            $('.aniCount').text("("+aniTotalCount+")");

            if (likeAniList && likeAniList.length > 0) {
                likeAniList.forEach(likeAniList => {
                    $(".ani_list_all").append(`
                        <li class="ani_list_li">
                          <input type="hidden" id="idx" value="${likeAniList.idx}">
                          <div class="prd_b">
                            <a>
                              <div class="ani_img_bx">
                                <img src="http://192.168.1.92:8000/${likeAniList.post_img}" />
                                <div class="heart_state"><i class="fa-solid fa-heart ani_heart"></i></div>
                              </div>
                              <div class="ani_imform">
                                <strong>${likeAniList.title}</strong>
                              </div>
                            </a>
                          </div>
                        </li>
                    `);
                });
                // 페이지네이션 버튼 생성, 현재 페이지를 전달
                createPaginationAni(totalPages, page);
            }else{
                $(".no_heart_ani").append(`
                    <p>좋아요한 애니 내역이 없습니다.</p>
                `);
                $(".custom-pagination-ani").empty(); // 페이지네이션 초기화
            }
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
}


$(function(){
    mypageGoodsLike(1);
    mypageAniLike(1);

    $(document).on('click', '.fa-heart', function () {
        event.preventDefault();
        event.stopPropagation();

        var pro_idx= $(this).closest(".goods_list_li").find('#idx').val();
        var ani_idx= $(this).closest(".ani_list_li").find('#idx').val();
        console.log(pro_idx);
        console.log(ani_idx);

        if (confirm("좋아요를 취소하시겠습니까?")) {
            // 만약 pro_idx 또는 ani_idx가 undefined일 경우 null로 설정
            const data = {
                pro_idx: pro_idx ? parseInt(pro_idx, 10) : null,  // pro_idx가 undefined이면 null로 설정
                ani_idx: ani_idx ? parseInt(ani_idx, 10) : null   // ani_idx가 undefined이면 null로 설정
            };

            console.log("전송 데이터:", data); // 데이터를 확인하기 위해 콘솔에 출력

            $.ajax({
                url: '/user/likeDelOk',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                headers: {
                    "Authorization": `Bearer ${token}`
                },
                success: function(response) {
                    alert("좋아요가 취소되었습니다.");
                    mypageGoodsLike(1);
                    mypageAniLike(1);
                },
                error: function(error) {
                    console.log('좋아요 취소 중 오류 발생:', error);
                }
            });
        }
    });
})