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
                            <div>
                                <input type="hidden" id="total_product_price" name="total_product_price" value="${basketList.total}">
                                <span id="total_product_price_span">${formatNumber(basketList.total)}</span>원
                            </div>
                            <div class="basket_list_buy_btn_div">
                              <button type="button" id="buy_btn_one">
                                구매하기
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
                calculateTotal();
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
        calculateTotal();

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
         calculateTotal();
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
        var allDelProducts = [];//장바구니에 존재하는 모든 idx값을 담을 배열
        $('.chk_product').each(function() {
            var idx = $(this).closest(".bascket_product_li").find('#idx').val();
            allDelProducts.push(idx);
        });

        //모든 상품 선택 ui
        $('#all_chk_product').prop('checked', true);
        $("label[for='all_chk_product']").addClass("checkedLabel");
        $('.chk_product').each(function() {
            $(this).prop('checked', true);
            $(this).next('label').addClass('checkedLabel');
        });

        console.log(allDelProducts);

        setTimeout(function() {//ui업데이트가 먼저 일어나야하기 때문
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
        },100);
    });

    // 상품 갯수 count
    // - (감소)
    $(document).on('click', '.basket_list_amount_del', function() {
        var inputAmount = $(this).closest('.basket_list_li_amount_div').find('.basket_list_amount'); // 수량 input
        var price = parseInt($(this).closest('.bascket_product_li').find('.basket_list_proprice span').text().replace(/[^0-9]/g, '')); // 상품 가격
        var totalSpan = $(this).closest('.bascket_product_li').find('#total_product_price_span'); // 총 가격을 보여줄 span
        var totalInput = $(this).closest('.bascket_product_li').find('#total_product_price'); // 숨겨진 input에 총 가격 저장

        var currentAmount = parseInt(inputAmount.val());

        if (currentAmount > 1) { // 수량이 1 이상일 때만 감소
            var newAmount = currentAmount - 1;
            inputAmount.val(newAmount); // 수량 업데이트
            var newTotal = price * newAmount; // 새로운 총 가격 계산
            totalSpan.text(formatNumber(newTotal)); // span 총 가격 업데이트
            totalInput.val(newTotal); // 숨겨진 input 총 가격 업데이트
        } else {
            alert("수량은 1개 이상이어야 합니다.");
            return false;
        }
        /*console.log("수량:", inputAmount.val(), "상품가격:", price, "총 가격:", newTotal);*/

        var idx = $(this).closest(".bascket_product_li").find('#idx').val();
        $.ajax({
            url: '/basket_minusCount',
            type: 'POST',
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            data: {
                idx: idx
            },
            success: function(response) {

            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    // + (증가)
    $(document).on('click', '.basket_list_amount_add', function() {
        var inputAmount = $(this).closest('.basket_list_li_amount_div').find('.basket_list_amount'); // 수량 input
        var price = parseInt($(this).closest('.bascket_product_li').find('.basket_list_proprice span').text().replace(/[^0-9]/g, '')); // 상품 가격
        var totalSpan = $(this).closest('.bascket_product_li').find('#total_product_price_span'); // 총 가격을 보여줄 span
        var totalInput = $(this).closest('.bascket_product_li').find('#total_product_price'); // 숨겨진 input에 총 가격 저장

        var currentAmount = parseInt(inputAmount.val());

        if(currentAmount <=100){
            var newAmount = currentAmount + 1;
            inputAmount.val(newAmount); // 수량 업데이트
            var newTotal = price * newAmount; // 새로운 총 가격 계산
            totalSpan.text(formatNumber(newTotal)); // span 총 가격 업데이트
            totalInput.val(newTotal); // 숨겨진 input 총 가격 업데이트
        }else {
            alert("수량은 100개까지 선택 가능합니다.");
            return false;
        }
        /*console.log("수량:", inputAmount.val(), "상품가격:", price, "총 가격:", newTotal);*/

        var idx = $(this).closest(".bascket_product_li").find('#idx').val();
        $.ajax({
            url: '/basket_plusCount',
            type: 'POST',
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            data: {
                idx: idx
            },
            success: function(response) {

            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    // 하단에 총 가격 + 배송비 = 총 결제금액 구현
    function calculateTotal() {
        let totalOrderAmount = 0; //총 주문금액

        // 장바구니에 있는 각 상품의 총 가격을 합산해야하니까 for문
        $('.chk_product:checked').each(function() {
            let productTotal = parseInt($(this).closest('.bascket_product_li').find('#total_product_price').val());//상품별 총가격
            totalOrderAmount += productTotal;
        });

        // 배송비
        let fee = totalOrderAmount >= 150000 ? 0 : 2500; // 15만원 이상이면 배송비 0원

        // 총 결제 금액
        let totalPaymentAmount = totalOrderAmount + fee;

        // 화면에 값 업데이트
        $('#total_order_amount').text(formatNumber(totalOrderAmount));
        $('#fee_order_amount').text(formatNumber(fee));
        $('#total_payment_amount').text(formatNumber(totalPaymentAmount));

        // hidden input에 총 결제 금액 저장
        $('#total_payAmount').val(totalPaymentAmount);
    }

    // 상품 수량이 변경될 때마다 호출
    $(document).on('click', '.basket_list_amount_del, .basket_list_amount_add', function() {
        calculateTotal(); // 상품 수량이 변경되면 다시 계산
    });


    // 구매하기 버튼 클릭시(선택상품 전체)
    $('#buy_btn_all').click(function() {
        // 체크된 상품의 idx 값을 배열에 저장
        var selectedProducts = [];
        // 체크된 상품의 주문 갯수
        var selectedProductsCounts = [];
        $('.chk_product:checked').each(function() {
            var pro_idx = $(this).val(); // 체크된 상품의 idx 값을 가져옴
            var amount = $(this).closest(".bascket_product_li").find('#number_of_products').val();
            selectedProducts.push(pro_idx); // 선택된 상품의 idx 값을 배열에 추가
            selectedProductsCounts.push(amount);
        });
        // 총 주문 금액
        var totalAmount = $("#total_payAmount").val();

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
    });

    // 구매하기 버튼 클릭시(선택상품 주문)
    $(document).on('click', '#buy_btn_one', function() {
        // 체크된 상품의 idx 값을 배열에 저장
        var selectedProducts = [];
        // 체크된 상품의 주문 갯수
        var selectedProductsCounts = [];

        var pro_idx = $(this).closest(".bascket_product_li").find('.chk_product').val();
        var amount = $(this).closest(".bascket_product_li").find('#number_of_products').val();
        selectedProducts.push(pro_idx);
        selectedProductsCounts.push(amount);

        // 주문 금액
        var totalAmount = $(this).closest(".bascket_product_li").find("#total_product_price").val();
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
    });
});