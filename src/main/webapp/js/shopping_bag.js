 $(function () {
    const $checkbox = $("#bascket_all_checkbox_hidden");
    const $control = $("#bascket_all_checkbox_control");
    const $labelcontrol = $("#bascket_all_checkbox");

    // 체크박스 상태가 변경될 때 data-state를 변경
    $checkbox.change(function () {
      if ($checkbox.is(":checked")) {
        $labelcontrol.attr("data-state", "checked");
        $control.attr("data-state", "checked");
      } else {
        $labelcontrol.attr("data-state", "unchecked");
        $control.attr("data-state", "unchecked");
      }
    });

    // 페이지 로드 시 초기 상태 설정
    if ($checkbox.is(":checked")) {
      $labelcontrol.attr("data-state", "checked");
      $control.attr("data-state", "checked");
    } else {
      $labelcontrol.attr("data-state", "unchecked");
      $control.attr("data-state", "unchecked");
    }

    // 주문하기 버튼 클릭시 ex
    $('#buy_btn').click(function() {
        var selectedProducts = [13, 14];

        // 로컬 스토리지에서 JWT 토큰 가져오기
        const token = localStorage.getItem("token");
        console.log(token);
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