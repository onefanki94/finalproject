var basketListData;
//1000 단위 , 표시
function formatNumber(number) {
    return number.toLocaleString();
}


$(function () {
    const token = localStorage.getItem("token");
    //장바구니 데이터 뿌려주기
    function basket_list(){
        $("#bascket_product_ul").empty();
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
                          <input type="hidden" name="idx" id="idx" value="${basketList.idx}">
                          <div class="basket_list_li_chkbx">
                            <input type="checkbox" class="chk_product" id="chk_product_${index}" name="chk_product" value="${basketList.pro_idx}" checked/>
                            <label for="chk_product_${index}" class="checkedLabel"></label>
                          </div>
                          <div class="basket_list_li_proinfo_div">
                            <div class="basket_list_li_proinfo">
                              <a href=""><img src="http://192.168.1.92:8000/${basketList.thumImg}" /></a>
                              <div class="basket_list_proinfo_detail">
                                <p class="ani_title_p">${basketList.ani_title}</p>
                                <a class="basket_list_protitle" href="">${basketList.title}</a>
                                <div class="basket_list_proprice">
                                  <span>${formatNumber(basketList.price)}</span>
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
                            <div>
                                <input type="hidden" id="total_product_price" name="total_product_price" value="${basketList.total}">
                                <span id="total_product_price_span">${formatNumber(basketList.total)}</span>원
                            </div>
                            <div class="basket_list_buy_btn_div">
                              <button class="edes2n119 css-1z3id8 ejv90e57" type="button">
                                <span class="ruler-button-text css-mfi8cj ejv90e50" color="onColor">구매하기</span>
                              </button>
                            </div>
                          </div>
                          <div class="basket_list_li_fee_div">
                            ${formatNumber(basketList.fee)}원
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
     $(document).on('change', '#all_chk_product', function() {
        let isChecked = $(this).prop("checked");

        // 전체 체크박스 상태에 따라 개별 체크박스 상태 변경
        $('.chk_product').prop('checked', isChecked);

        // 개별 체크박스 라벨 스타일도 변경
        if (isChecked) {
            $("label[for='all_chk_product']").addClass("checkedLabel");
            $('.chk_product').next('label').addClass('checkedLabel');
        } else {
            $("label[for='all_chk_product']").removeClass("checkedLabel");
            $('.chk_product').next('label').removeClass('checkedLabel');
        }
    });

    //idx 값으로 선택 체크박스 -> 동적으로 생성되고 있기 때문
    $(document).on('change', '.chk_product', function () {
        // 선택된 체크박스 개수와 전체 체크박스 개수가 같지 않으면 전체 선택 체크박스를 해제
        if ($('.chk_product:checked').length !== $('.chk_product').length) {
            $('#all_chk_product').prop('checked', false);
            $("label[for='all_chk_product']").removeClass('checkedLabel');
        } else {
            $('#all_chk_product').prop('checked', true);
            $("label[for='all_chk_product']").addClass('checkedLabel');
        }

        if ($(this).prop("checked")) {
            $(this).next("label").addClass("checkedLabel");
        } else {
            $(this).next("label").removeClass("checkedLabel");
        }
    });

    //bascket_del_btn -> 장바구니에서 상품 삭제(x버튼)
    $(document).on('click', '.bascket_del_btn', function () {
        var idx= $(this).closest(".bascket_product_li").find('#idx').val();
        console.log(idx);

        if(confirm("선택한 상품을 삭제하시겠습니까?")){
            $.ajax({
                url: '/basketDelOk',
                type: 'POST',
                data: {
                        idx:idx
                }, // 데이터를 JSON 문자열로 변환하여 전송
                headers: {
                        "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
                },
                success: function(response) {
                    alert("선택한 상품이 삭제되었습니다.");
                    basket_list();
                },
                error: function(error) {
                    console.log('선택한 상품 삭제 중 오류 발생:', error);
                }
            });
        }
    });

    // 선택 상품 삭제 버튼
    $(document).on('click', '#choice_delBtn', function () {
            // 체크된 상품의 idx 값을 배열에 저장
            var choiceDelProducts = [];
            $('.chk_product:checked').each(function() {
                var idx = $(this).closest(".bascket_product_li").find('#idx').val(); // 체크된 상품의 idx 값을 가져옴
                choiceDelProducts.push(idx); // 선택된 상품의 idx 값을 배열에 추가
            });

            if (choiceDelProducts.length === 0) {
                alert("삭제할 상품을 선택해주세요.");
                return;
            }

            console.log(choiceDelProducts);

            if(confirm("선택한 상품을 삭제하시겠습니까?")){
                $.ajax({
                    url: '/basketChoiceDelOk',
                    type: 'POST',
                    contentType: 'application/json',
                    headers: {
                        "Authorization": `Bearer ${token}`
                    },
                    data: JSON.stringify({
                        idxList: choiceDelProducts  // 선택한 상품들의 idx 배열 전송
                    }),
                    success: function(response) {
                        alert("선택한 상품이 삭제되었습니다.");
                        basket_list();
                    },
                    error: function(error) {
                        console.log('선택한 상품 삭제 중 오류 발생:', error);
                    }
                });
            }
        });

    //전체 상품 삭제
    $(document).on('click', '#all_delBtn', function () {
        // 체크된 상품의 idx 값을 배열에 저장
        var allDelProducts = [];
        $('.chk_product').each(function() {
            var idx = $(this).closest(".bascket_product_li").find('#idx').val(); // 체크된 상품의 idx 값을 가져옴
            allDelProducts.push(idx); // 선택된 상품의 idx 값을 배열에 추가
        });
        // 전체 체크박스와 라벨 스타일 업데이트 (모든 상품 선택 UI 반영)
        $('#all_chk_product').prop('checked', true);
        $("label[for='all_chk_product']").addClass("checkedLabel");
        // 개별 체크박스와 라벨 스타일 업데이트
        $('.chk_product').each(function() {
            $(this).prop('checked', true); // 체크박스를 선택 상태로
            $(this).next('label').addClass('checkedLabel'); // 해당 라벨에 스타일 적용
        });

        console.log(allDelProducts);

        requestAnimationFrame(function() {
            if(confirm("전체 상품을 삭제하시겠습니까?")){
                $.ajax({
                    url: '/basketAllDelOk',
                    type: 'POST',
                    contentType: 'application/json',
                    headers: {
                        "Authorization": `Bearer ${token}`
                    },
                    data: JSON.stringify({
                        idxList: allDelProducts  // 선택한 상품들의 idx 배열 전송
                    }),
                    success: function(response) {
                        alert("전체 상품이 삭제되었습니다.");
                        basket_list();
                    },
                    error: function(error) {
                        console.log('전체 상품 삭제 중 오류 발생:', error);
                    }
                });
            }
        });
    });

    // 상품 갯수 count
    // - (감소)
    $(document).on('click', '.basket_list_amount_del', function() {
        var inputAmount = $(this).closest('.basket_list_li_amount_div').find('.basket_list_amount'); // 수량 input
        var price = parseInt($(this).closest('.bascket_product_li').find('.basket_list_proprice span').text().replace(/[^0-9]/g, '')); // 상품 단가
        var totalSpan = $(this).closest('.bascket_product_li').find('#total_product_price_span'); // 총 가격을 보여줄 span
        var totalInput = $(this).closest('.bascket_product_li').find('#total_product_price'); // 숨겨진 input에서 총 가격 저장

        var currentAmount = parseInt(inputAmount.val());

        if (currentAmount > 1) { // 수량이 1 이상일 때만 감소
            var newAmount = currentAmount - 1;
            inputAmount.val(newAmount); // 수량 업데이트
            var newTotal = price * newAmount; // 새 총 가격 계산
            totalSpan.text(formatNumber(newTotal)); // span의 총 가격 업데이트
            totalInput.val(newTotal); // 숨겨진 input의 총 가격 업데이트
        } else {
            alert("수량은 1 이상이어야 합니다."); // 수량이 1 이하로 내려갈 수 없음을 알림
        }
        console.log("수량:", inputAmount.val(), "단가:", price, "총 가격:", newTotal);
    });

    // + (증가)
    $(document).on('click', '.basket_list_amount_add', function() {
        var inputAmount = $(this).closest('.basket_list_li_amount_div').find('.basket_list_amount'); // 수량 input
        var price = parseInt($(this).closest('.bascket_product_li').find('.basket_list_proprice span').text().replace(/[^0-9]/g, '')); // 상품 단가
        var totalSpan = $(this).closest('.bascket_product_li').find('#total_product_price_span'); // 총 가격을 보여줄 span
        var totalInput = $(this).closest('.bascket_product_li').find('#total_product_price'); // 숨겨진 input에서 총 가격 저장

        var currentAmount = parseInt(inputAmount.val());

        var newAmount = currentAmount + 1;
        inputAmount.val(newAmount); // 수량 업데이트
        var newTotal = price * newAmount; // 새 총 가격 계산
        totalSpan.text(formatNumber(newTotal)); // span의 총 가격 업데이트
        totalInput.val(newTotal); // 숨겨진 input의 총 가격 업데이트
        console.log("수량:", inputAmount.val(), "단가:", price, "총 가격:", newTotal);
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