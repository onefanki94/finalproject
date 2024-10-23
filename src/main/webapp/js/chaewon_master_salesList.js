let currentStartDate = null;
let currentEndDate = null;
let currentOrderDate= null;

$(function(){
    getOrderList(1);

    $("#endDate, #startDate").on('change', function() {
        const startDate = $("#startDate").val();
        const endDate = $("#endDate").val();

        // 유효성 검사: 종료일이 시작일보다 빠른 경우
        if (startDate && endDate && endDate < startDate) {
            alert("종료일은 시작일보다 늦어야 합니다.");
            $("#endDate").val(""); // 유효하지 않은 경우 endDate 필드 초기화
        }
    });

    // 날짜 필터 버튼 클릭 시
    $("#date_search").on('click', function() {
    console.log("dsa");
        const startDate = $("#startDate").val();
        const endDate = $("#endDate").val();

        if (!startDate || !endDate) {
            alert("시작일과 종료일을 모두 선택해주세요.");
            return false;
        }

        // 입력된 날짜 값들을 전역 변수에 저장
        currentStartDate = startDate;
        currentEndDate = endDate;

        // 필터링 된 날짜로 데이터 요청
        getOrderList(1, startDate, endDate);
    });

    //차트 띄우기
    //월/일별 매출차트
    $(document).on('click', '#day_salesChart', function() {
        $.ajax({
            url: '/master/getDayChart',
            type: 'POST',
            success: function(response) {
                console.log(response);
                //가져온 데이터 가공
                const monthLabels = response.monthlySales.map(sale => `${sale.orderDate}월`);
                const monthData = response.monthlySales.map(sale => sale.totalSales);
                const dayLabels = response.dailySales.map(sale => sale.orderDate);
                const dayData = response.dailySales.map(sale => sale.totalSales);

                tag=``;
                if (!$('.chart_modal_body').length) {
                    tag+=`
                        <div class="chart_modal_body">
                          <div></div>
                          <div class="chart_modal_container">
                            <div class="chart_modal_container_flex">
                              <div>
                                <span>일/월별 매출 그래프</span>
                                <i class="fa-solid fa-x close_modal"></i>
                              </div>
                              <div class="chart-day-info-modal">
                                <div>
                                  <p>월별 매출</p>
                                  <canvas id="month_sales_chart"></canvas>
                                </div>
                                <div>
                                  <p>일별 매출</p>
                                  <canvas id="day_sales_chart"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>`;
                    $("body").append(tag);
                    // 모달 닫기 기능
                    $('.close_modal').on('click', function () {
                        $('.chart_modal_body').remove();  // 모달 제거
                    });
                }
                // 모달 창을 보여줌
                $(".chart_modal_body").show();
                drawSalesChart(monthLabels,monthData,dayLabels,dayData);
            },
            error: function(error) {
                console.log('Error:', error);
                alert("차트를 불러오는중 오류가 발생했습니다.");
            }
        });
    });
    //상품별 매출차트
    $(document).on('click', '#product_salesChart', function() {
        $.ajax({
            url: '/master/getProductChart',
            type: 'POST',
            success: function(response) {
                console.log(response);
                //가져온 데이터 가공
                const topN = 5; // 상위 N개 애니만 표시
                const aniSales = response.aniSales.sort((a, b) => b.totalSales - a.totalSales); // 매출 순으로 정렬
                const topSales = aniSales.slice(0, topN); // 상위 N개 추출
                const otherSales = aniSales.slice(topN); // 나머지 데이터 추출

                const topLabels = topSales.map(sale => sale.aniTitle);
                const topData = topSales.map(sale => sale.totalSales);
                const otherTotal = otherSales.reduce((acc, sale) => acc + sale.totalSales, 0);

                if (otherTotal > 0) {
                    topLabels.push("기타");
                    topData.push(otherTotal);
                }

                const categoryNames = {
                    1: "의류",
                    2: "완구/취미",
                    3: "문구/오피스",
                    4: "생활용품"
                    // 필요에 따라 더 추가
                };
                const categoryLabels = response.categorySales.map(sale => categoryNames[sale.category]);
                const categoryData = response.categorySales.map(sale => sale.totalSales);

                tag=``;
                if (!$('.chart_modal_body').length) {
                    tag+=`
                        <div class="chart_modal_body">
                          <div></div>
                          <div class="chart_modal_container">
                            <div class="chart_modal_container_flex">
                              <div>
                                <span>상품별 매출 그래프</span>
                                <i class="fa-solid fa-x close_modal"></i>
                              </div>
                              <div class="chart-day-info-modal">
                                <div class="chart-product">
                                  <p>애니별 매출</p>
                                  <canvas id="ani_sales_chart"></canvas>
                                </div>
                                <div class="chart-product-category">
                                  <p>카테고리별 매출</p>
                                  <canvas id="category_sales_chart"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>`;
                    $("body").append(tag);
                    // 모달 닫기 기능
                    $('.close_modal').on('click', function () {
                        $('.chart_modal_body').remove();  // 모달 제거
                    });
                }
                // 모달 창을 보여줌
                $(".chart_modal_body").show();
                drawProductChart(topLabels, topData, categoryLabels, categoryData);
            },
            error: function(error) {
                console.log('Error:', error);
                alert("차트를 불러오는중 오류가 발생했습니다.");
            }
        });
    });
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
                            <input type="hidden" id="orderDT" value="${salesList.orderDate}">
                            <td>${salesList.orderCount}건</td>
                            <td>${formattedTotalAmount}원</td>
                            <td>${formattedCharge}원</td>
                            <td>
                                <button class="btn btn-secondary" id="sales_detail_btn">상세정보</button>
                            </td>
                        </tr>
                    `);
                });
                createPaginationOrder(totalPages, page);
            }else{
                $(".user_orderList").empty();
                $(".user_orderList").append(`
                    <tr>
                        <td colspan="5" style="text-align:center;vertical-align: middle;">주문 내역이 없습니다.</td>
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

function createPaginationSales(totalPages, currentPage) {
    $(".sales_pagination").empty();

    // 이전 페이지 버튼 추가 (첫 페이지가 아닐 때만 표시)
    if (currentPage > 1) {
        $(".sales_pagination").append(`
            <li class="page-item"><a class="page-link" data-page="${currentPage - 1}">이전</a></li>
        `);
    }

    // 페이지 번호 버튼 생성
    for (let i = 1; i <= totalPages; i++) {
        $(".sales_pagination").append(`
            <li class="page-item"><a class="page-link" data-page="${i}">${i}</a></li>
        `);
    }

    // 다음 페이지 버튼 추가 (마지막 페이지가 아닐 때만 표시)
    if (currentPage < totalPages) {
        $(".sales_pagination").append(`
            <li class="page-item"><a class="page-link" data-page="${currentPage + 1}">다음</a></li>
        `);
    }

    // 현재 페이지에 'clicked' 클래스를 추가
    $(`.sales_pagination .page-item a[data-page='${currentPage}']`).addClass("clicked");
    // 페이지네이션 버튼 클릭 이벤트 설정
    $(".sales_pagination .page-item a").on('click', function() {
        const page = $(this).data('page');
        $(".sales_pagination .page-item a").removeClass("clicked");
        $(this).addClass("clicked");

        getSalesDetailList(page,currentOrderDate);
    });
}

function getSalesDetailList(page,orderDate){
    const pageSize = 6; //한 페이지에 보여줄 항목 수

    let requestData = { page: page, pageSize: pageSize, orderDate:orderDate };

    $.ajax({
        url: '/master/getSalesDetails',
        type: 'POST',
        contentType: 'application/json',
         data: JSON.stringify(requestData),
        success: function(response) {
            console.log(response);
            const salesDetailList = response.salesDetailList;
            const totalPages = response.totalPages;
            tag=``;
            if (!$('.sales_modal_body').length) {
                tag+=`
                    <div class="sales_modal_body">
                      <div></div>
                      <div class="sales_modal_container">
                        <div class="sales_modal_container_flex">
                          <div>
                            <span>${orderDate} 매출</span>
                            <i class="fa-solid fa-x close_modal"></i>
                          </div>
                          <div class="sales-day-info-modal">
                            <table class="table table-hover table-bordered">
                              <thead class="th-color">
                                <tr>
                                  <th style="width: 11%">주문번호</th>
                                  <th style="width: 11%">주문명</th>
                                  <th style="width: 4%">주문자 아이디</th>
                                  <th style="width: 4%">결제금액</th>
                                  <th style="width: 4%"></th>
                                </tr>
                              </thead>
                              <tbody class="tr_input">

                              </tbody>
                            </table>
                          </div>
                          <div class="orderPageing">
                            <nav>
                              <ul class="sales_pagination pagination justify-content-center"></ul>
                            </nav>
                          </div>
                        </div>
                      </div>
                    </div>
                `;
                $("body").append(tag);
                // 모달 닫기 기능
                $('.close_modal').on('click', function () {
                    $('.sales_modal_body').remove();  // 모달 제거
                });
            }

            $(".tr_input").empty();
            salesDetailList.forEach(salesDetailList => {
                const formattedTotalAmount = formatNumber(salesDetailList.amount); // 여기서 형식화된 금액을 변수로 저장
                $(".tr_input").append(`
                    <tr class="user_orderList_tr">
                        <input type="hidden" id="order_idx" value="${salesDetailList.order_idx}" />
                        <td>${salesDetailList.orderId}</td>
                        <td style="width: 10%">
                            <span class="orderName_td">${salesDetailList.orderName}<span>
                        </td>
                        <td>${salesDetailList.customerName}</td>
                        <td>${formattedTotalAmount}</td>
                        <td>
                            <button class="btn btn-secondary" id="order_detail_btn">상세정보</button>
                        </td>
                    <tr>
                `);
            });
            createPaginationSales(totalPages, page);
            // 모달 창을 보여줌
            $(".sales_modal_body").show();
        },
        error: function(error) {
            console.log('Error:', error);
            alert("일자에 맞는 매출내역 상세 정보를 불러오는 중 오류가 발생했습니다.");
        }
    });
}

//상세정보 보기
$(document).on('click', '#sales_detail_btn', function() {
    //해당 일자에 맞는 주문들이 보여져야함
    const orderDate = $(this).closest('tr').find('#orderDT').val();
    currentOrderDate=orderDate;
    getSalesDetailList(1,orderDate);
});

$(document).on('click', '#order_detail_btn', function () {
    var order_idx= $(this).closest(".user_orderList_tr").find('#order_idx').val();
    console.log(order_idx);

    window.open('/master/orderDetail?order_idx=' + order_idx, '_blank');
});

//월/일별 차트 그리기
function drawSalesChart(monthLabels,monthData,dayLabels,dayData) {
    //bar_chart - 일별
    const day_data = {
      labels: dayLabels,
      datasets: [
        {
          label: "주간매출",
          data: dayData,
          backgroundColor: "#359c95",
          borderWidth: 1,
        },
      ],
    };

    const config = {
      type: "bar",
      data: day_data,
    };

    new Chart(document.getElementById("day_sales_chart"), config);

    //line_chart - 월별
    const month_data = {
      labels: monthLabels,
      datasets: [
        {
          label: "2024년도 매출액",
          data: monthData,
          fill: false,
          borderColor: "#359c95",
          tension: 0.1,
        },
      ],
    };

    const config2 = {
      type: "line",
      data: month_data,
    };

    new Chart(document.getElementById("month_sales_chart"), config2);
}

//상품별 차트 그리기
function drawProductChart(aniLabels,aniData,categoryLabels,categoryData) {
    //애니별
    new Chart(document.getElementById("ani_sales_chart"), {
      type: "doughnut",
      data: {
        labels: aniLabels,
        datasets: [
          {
            data: aniData,
            backgroundColor: ["#F9B2D0", "#F98CC1", "#B2D5EB", "#97C4E3","#FCD793","#FAB567"],
            hoverOffset: 4,
          },
        ],
      },
    });

    //카테고리별
    new Chart(document.getElementById("category_sales_chart"), {
      type: "doughnut",
      data: {
        labels: categoryLabels,
        datasets: [
          {
            data: categoryData,
            backgroundColor: ["#F9B2D0", "#C997CA", "#B2D5EB", "#FCD793"],
            hoverOffset: 4,
          },
        ],
      },
    });
}
