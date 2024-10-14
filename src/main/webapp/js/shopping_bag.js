var basketListData;
//1000 단위 , 표시
function formatNumber(number) {
    return number.toLocaleString();
}


$(function () {
    const token = localStorage.getItem("token");
    //장바구니 데이터 뿌려주기
    function basket_list(){
        /*$("#userEdit_form").empty();*/
        $.ajax({
            url: "/basketList", // 서버의 비밀번호 확인 URL
            type: "POST",
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success: function(response) {
                console.log(response);
                basketListData = response.basketList;

                //장바구니 리스트 for문
                response.basketList.forEach(function(basketList,index){
                    $("#bascket_product_ul").append(`
                        <li class="bascket_product_li">
                          <div class="basket_list_li_chkbx">
                            <input type="checkbox" id="chk_product" name="chk_product" value="${basketList.pro_idx}"/>
                            <label for="chk_product"></label>
                          </div>
                          <div class="basket_list_li_proinfo_div">
                            <div class="basket_list_li_proinfo">
                              <a href=""><img src="http://192.168.1.92:8000/${basketList.thumImg}" /></a>
                              <div class="basket_list_proinfo_detail">
                                <a class="basket_list_protitle" href="">${basketList.title}</a>
                                <div class="basket_list_proprice">
                                  <span>${formatNumber(basketList.price)}원</span>
                                </div>
                              </div>
                            </div>
                            <button class="bascket_del_btn" type="button"></button>
                          </div>
                          <div class="basket_list_li_amount_div">
                            <div>
                              <div>
                                <button id="del_product_btn" class="basket_list_amount_del" type="button">-</button>
                                <input class="basket_list_amount" autocapitalize="none" id="number_of_products" type="text" inputmode="numeric" value="${basketList.amount}" />
                                <button
                                  id="add_product_btn"
                                  class="basket_list_amount_add"
                                  type="button"
                                >
                                  +
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="basket_list_li_price_div">
                            <div><span>${formatNumber(basketList.total)}</span>원</div>
                            <div class="basket_list_buy_btn_div">
                              <button class="edes2n119 css-1z3id8 ejv90e57" type="button">
                                <span class="ruler-button-text css-mfi8cj ejv90e50" color="onColor">구매하기</span>
                              </button>
                            </div>
                          </div>
                          <div class="basket_list_li_fee_div">
                            ${basketList.fee}
                            <p>150,000원 이상 구매시 무료배송됩니다.</p>
                          </div>
                        </li>
                    `);
                })//장바구니 리스트 for문 종료
            },
            error: function(e) {
                console.log("에러에러",e);
            }
        });
    }
    basket_list();

    //체크박스 기능구현
    //전체 선택 체크박스
    $("#all_chk_product").change(function () {
      if ($(this).prop("checked")) {
        $("label[for='all_chk_product']").addClass("checkedLabel");
      } else {
        $("label[for='all_chk_product']").removeClass("checkedLabel");
      }
    });

    //idx 값으로 선택 체크박스
    $("#chk_product").change(function () {
      if ($(this).prop("checked")) {
        $("label[for='chk_product']").addClass("checkedLabel");
      } else {
        $("label[for='chk_product']").removeClass("checkedLabel");
      }
    });

    // 주문하기 버튼 클릭시 ex
    $('#buy_btn').click(function() {
        var selectedProducts = [13, 14];
        if (!token) {
            alert('로그인이 필요합니다.');
            return;
        }

        // Ajax로 주문 데이터 전송
        $.ajax({
            url: '/order/submit',  // 주문 처리 엔드포인트
            type: 'POST',
            contentType: 'application/json',
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            data: JSON.stringify({
                products: selectedProducts,
                total_price: 50000  // 임시로 총 가격을 50000으로 지정
            }),
            success: function(response) {
                // 주문 완료 후 주문 페이지로 이동
                console.log(response);
                // 주문 완료 후 order_idx를 받아 페이지로 이동
                if (response.order_idx) {
                    window.location.href = '/order/orderpage/' + response.order_idx;
                } else {
                    console.log('order_idx가 없습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.log('오류 발생: ' + error);  // 에러 메시지 자체 출력
                console.log('상태: ' + status);  // HTTP 상태 코드 출력
                console.log('응답 텍스트: ' + xhr.responseText);  // 서버에서 반환한 오류 내용 출력
            }
        });
    });
});