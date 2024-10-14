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
        var pro_idx=$("#pro_idx").val();
        var amount = $("#amount").val();
        var totalPrice = document.getElementById("total-price").textContent;
        $("#total").val(totalPrice);
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

})//jquery 끝