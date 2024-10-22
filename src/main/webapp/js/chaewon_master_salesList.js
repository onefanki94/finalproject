let currentStartDate = null;
let currentEndDate = null;

$(function(){
    getOrderList(1);
})

function formatNumber(number) {
    return number.toLocaleString();
}

function getOrderList(page, startDate = null, endDate = null){
    const pageSize = 6; //한 페이지에 보여줄 항목 수
    $(".user_orderList").empty();

    let requestData = { page: page, pageSize: pageSize };

    // 필터링 값이 있으면 requestData에 추가
    if (startDate && endDate) {
        requestData.startDate = startDate;
        requestData.endDate = endDate;
    }

    $.ajax({
        url: '/master/getSalesList',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(requestData),
        success: function(response) {
            const salesList = response.salesList;
            const totalPages = response.totalPages;

            console.log(salesList);

            if (salesList && salesList.length > 0) {
                salesList.forEach(salesList => {
                    const formattedTotalAmount = formatNumber(salesList.totalSales); // 여기서 형식화된 금액을 변수로 저장
                    const formattedCharge = formatNumber(Math.floor(salesList.totalSales * 0.0198));
                    $(".user_orderList").append(`
                        <tr class="user_orderList_tr">
                            <td>${salesList.orderDate}</td>
                            <input type="hidden" id="orderDT" value="${salesList.orderDT}">
                            <td>${salesList.orderCount}건</td>
                            <td>${formattedTotalAmount}원</td>
                            <td>${formattedCharge}원</td>
                            <td>
                                <button class="btn btn-secondary" id="order_detail_btn">상세정보</button>
                            </td>
                        </tr>
                    `);
                });
                createPaginationOrder(totalPages, page);
            }else{
                $(".user_orderList").empty();
                $(".user_orderList").append(`
                    <tr>
                        <td colspan="7" style="text-align:center;vertical-align: middle;">주문 내역이 없습니다.</td>
                    </tr>
                `); // 기본 데이터가 없을 때를 처리

                $(".pagination").empty(); // 페이지네이션을 비움
            }
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
}

// 날짜 필터 버튼 클릭 시
$(".date-btn").on('click', function() {
    const filterType = $(this).data('date');
    let startDate, endDate;

    endDate = new Date().toISOString().split('T')[0];
    // 날짜 범위 설정
    switch (filterType) {
        case 'today':
            startDate = new Date().toISOString().split('T')[0];
            break;
        case 'week':
            startDate = new Date(new Date().setDate(new Date().getDate() - 7)).toISOString().split('T')[0];
            break;
        case 'month1':
            startDate = new Date(new Date().setMonth(new Date().getMonth() - 1)).toISOString().split('T')[0];
            break;
        case 'month3':
            startDate = new Date(new Date().setMonth(new Date().getMonth() - 3)).toISOString().split('T')[0];
            break;
        case 'month6':
            startDate = new Date(new Date().setMonth(new Date().getMonth() - 6)).toISOString().split('T')[0];
            break;
    }
    // 필터링 된 날짜를 전역 변수에 저장
    currentStartDate = startDate;
    currentEndDate = endDate;

    // 필터링 된 날짜로 데이터 요청
    getOrderList(1, startDate, endDate);
});

function createPaginationOrder(totalPages, currentPage) {
    $(".pagination").empty();

    // 이전 페이지 버튼 추가 (첫 페이지가 아닐 때만 표시)
    if (currentPage > 1) {
        $(".pagination").append(`
            <li class="page-item"><a class="page-link" data-page="${currentPage - 1}">이전</a></li>
        `);
    }

    // 페이지 번호 버튼 생성
    for (let i = 1; i <= totalPages; i++) {
        $(".pagination").append(`
            <li class="page-item"><a class="page-link" data-page="${i}">${i}</a></li>
        `);
    }

    // 다음 페이지 버튼 추가 (마지막 페이지가 아닐 때만 표시)
    if (currentPage < totalPages) {
        $(".pagination").append(`
            <li class="page-item"><a class="page-link" data-page="${currentPage + 1}">다음</a></li>
        `);
    }

    // 현재 페이지에 'clicked' 클래스를 추가
    $(`.pagination .page-item a[data-page='${currentPage}']`).addClass("clicked");
    // 페이지네이션 버튼 클릭 이벤트 설정
    $(".pagination .page-item a").on('click', function() {
        const page = $(this).data('page');
        $(".pagination .page-item a").removeClass("clicked");
        $(this).addClass("clicked");

        // 기존에 필터된 날짜나 검색어가 있다면 유지, 없다면 전체 데이터 가져오기
        getOrderList(page, currentStartDate, currentEndDate);
    });
}
