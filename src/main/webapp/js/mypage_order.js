function formatNumber(number) {
    return number.toLocaleString();
}

function getOrderListAll(page){
    const pageSize = 5; //한 페이지에 보여줄 항목 수

    $.ajax({
        url: '/user/getOrderListAll',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ page: page, pageSize: pageSize }),
        headers: {
            "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            displayOrderList(response.content);
            setupPagination(response.totalPages,response.page);
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
}

$(function(){
    getOrderListAll(1);
})

function displayOrderList(orderList) {
    const orderContainer = $(".order_list_bottom"); // 주문 목록이 출력될 컨테이너

    orderContainer.empty(); // 이전 목록을 지우고 새로 업데이트

    if (orderList.length === 0) {
        orderContainer.append("<p>주문 내역이 없습니다.</p>");
        return;
    }

    // 주문 리스트 순회
    orderList.forEach(order => {
        const orderHTML = `
            <li class="order_list_li">
              <div class="order_date_num">
                <a href="/user/mypage_order_detail/${order.order_idx}"><span>주문일자  </span>${order.order_date}</a>
                <a href="/user/mypage_order_detail/${order.order_idx}"><span>주문번호  </span>${order.orderId}</a>
              </div>
              <ul>
                  ${order.products.map(product => {
                    const formattedAmount = formatNumber(product.pro_price) + "원";
                    // orderState에 따라 버튼 출력 여부 결정
                    const packageButton = product.orderState >= 3
                        ? `<button class="order_package">CJ대한통운 <span>${order.trackingNum}</span></button>`
                        : '';
                    return `
                    <li>
                      <ul class="order_data_ulStyle">
                        <li class="order_data_list_one">
                          <a href="/user/mypage_order_detail/${order.order_idx}">
                            <div class="order_data_inform">
                              <div class="order_data_img"><img src="http://192.168.1.92:8000/${product.pro_image}"/></div>
                              <div style="padding: 5px 0;">
                                <p class="order_aniTitle">${product.pro_anititle}</p>
                                <p class="order_pro_name">${product.pro_title}</p>
                                <ul class="order_pro_option">
                                  <li>${formattedAmount}</li>
                                </ul>
                              </div>
                            </div>
                          </a>
                          <div class="order_delivery_fee_data">${product.order_pro_amount}</div>
                          <div class="order_state_div">
                            <div>
                              <div class="order_state_all">
                                <p class="order_state_data">${getOrderStateText(product.orderState)}</p>
                              </div>
                              ${packageButton} <!-- 버튼 삽입 -->
                            </div>
                          </div>
                        </li>
                      </ul>
                    </li>
                  `;}).join('')}
              </ul>
            </li>
        `;
        orderContainer.append(orderHTML);
    });
}

function getOrderStateText(orderState) {
    switch(orderState) {
        case 1:
            return "결제완료";
        case 2:
            return "상품준비중";
        case 3:
            return "배송시작";
        case 4:
            return "배송중";
        case 5:
            return "배송완료";
        case 6:
            return "구매확정";
        default:
            return "상태오류";
    }
}

function setupPagination(totalPages, currentPage) {
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
        $(".custom-pagination .pageNumber_span span").removeClass("clicked");
        $(this).addClass("clicked");
        getOrderListAll(page);
    });
}