var tag=``;

// 장바구니 모달창 닫기
function basketmodal_exit(){
    $(".basketmodal_body").remove();
}

$(function(){
    const token = localStorage.getItem("token");
    // 1. 장바구니 클릭
    // 로직 : ajax로 장바구니테이블에 데이터 저장 -> 계속 쇼핑? 장바구니 이동? 모달
    $(document).on('click', '#basket_in_btn', function() {
        if (!token) {
            alert('로그인이 필요합니다.');
            return;
        }
        var pro_idx=$("#pro_idx").val();
        var amount = $("#amount").val();

        var totalPrice = document.getElementById("total-price").textContent;
        var totalPriceWithoutComma = totalPrice.replace(/,/g, ''); // 콤마 제거
        var totalPriceInt = parseInt(totalPriceWithoutComma, 10);
        $("#total").val(totalPriceInt);
        var total = $("#total").val();

        console.log("pro_idx : ",pro_idx);
        console.log("amount : ",amount);
        console.log("total : ",total);

        var data={
            pro_idx:pro_idx,
            amount:amount,
            total:total
        }

        $.ajax({
            url: '/basketOK',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
            headers: {
                    "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success: function(response) {
                tag=``;
                tag+=`
                    <div class="basketmodal_body">
                      <div class="basketmodal_background"></div>
                      <div class="basketmodal_container">
                        <div class="basketmodal_layer">
                          <div class="basketmodal_content">
                            <img class="icon" src="/img/store/icon_cart.20b2004d.gif" />
                            <div>장바구니에 추가되었습니다.</div>
                          </div>
                          <div class="basketmodal_btnDiv">
                            <a class="basket_move" href="/shoppingBag">장바구니 이동</a>
                            <a class="keep_shopping" onclick="basketmodal_exit()">계속 쇼핑하기</a>
                          </div>
                        </div>
                      </div>
                    </div>
                `;
                $("body").append(tag);
            },
            error: function(jqXHR, textStatus, errorThrown) { // 여기서 xhr을 jqXHR로 변경
                if (jqXHR.status === 409) {
                    // 장바구니에 이미 존재하는 경우
                    console.log("장바구니에 이미 존재 ");
                    tag=``;
                    tag+=`
                        <div class="basketmodal_body">
                          <div class="basketmodal_background"></div>
                          <div class="basketmodal_container">
                            <div class="basketmodal_layer">
                              <div class="basketmodal_content">
                                <img class="icon" src="/img/store/icon_error.570da666.gif" />
                                <div>이미 장바구니에 담겨있는 상품입니다.</div>
                              </div>
                              <div class="basketmodal_btnDiv">
                                <a class="basketmodal_exit" onclick="basketmodal_exit()">확인</a>
                              </div>
                            </div>
                          </div>
                        </div>
                    `;
                    $("body").append(tag);
                } else {
                    console.log("장바구니에 상품 담기 실패! " + errorThrown);
                }
            }
        });
    })//장바구니 클릭 끝

    // 2. 바로구매 클릭
    $('#order_buy_btn').click(function() {
        // 체크된 상품의 idx 값을 배열에 저장
        var selectedProducts = [];
        // 체크된 상품의 주문 갯수
        var selectedProductsCounts = [];

        var pro_idx=$("#pro_idx").val();
        var amount = $("#amount").val();
        selectedProducts.push(pro_idx); // 선택된 상품의 idx 값을 배열에 추가
        selectedProductsCounts.push(amount);

        var totalPrice = document.getElementById("total-price").textContent;
        var totalPriceWithoutComma = totalPrice.replace(/,/g, ''); // 콤마 제거
        var totalPriceInt = parseInt(totalPriceWithoutComma, 10);
        $("#total").val(totalPriceInt);
        var totalAmount = $("#total").val();
        var fee = totalAmount >= 150000 ? 0 : 2500; // 15만원 이상이면 배송비 0원
        totalAmount = parseInt(totalAmount)+parseInt(fee);

        if (!token) {
            alert('로그인이 필요합니다.');
            return;
        }
        if (selectedProducts.length === 0) {
            alert("구매할 상품을 선택해주세요.");
            return;
        }

        console.log("주문 상품 pro_idx :", selectedProducts);
        console.log("주문 상품 갯수 :", selectedProductsCounts);
        console.log("주문 총 금액 :", totalAmount);
        return;
        // Ajax로 주문 데이터 전송
        $.ajax({
            url: '/order/submit',
            type: 'POST',
            contentType: 'application/json',
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            data: JSON.stringify({
                products: selectedProducts,
                productsCounts : selectedProductsCounts,
                total_price: totalAmount
            }),
            success: function(response) {
                // 주문 완료 후 주문 페이지로 이동
                console.log(response);
                // 주문 완료 후 order_idx를 받아 페이지로 이동
                if (response.order_idx) {
                    window.location.href = '/order/orderpage/' + response.order_idx;
                } else {
                    alert("구매 실패!");
                    console.log('order_idx가 없습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.log('오류 발생: ' + error);  // 에러 메시지 자체 출력
                console.log('상태: ' + status);  // HTTP 상태 코드 출력
                console.log('응답 텍스트: ' + xhr.responseText);  // 서버에서 반환한 오류 내용 출력
            }
        });
    })



})//jquery 끝