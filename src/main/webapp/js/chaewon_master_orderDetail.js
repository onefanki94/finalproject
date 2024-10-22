function formatNumber(number) {
    return number.toLocaleString();
}

$(function(){
    $(".order_orderPrice").text(formatNumber(order_amount) + "원");
    $(".order_usePoint").text(formatNumber(use_point) + "원");
    $('.order_productPrice').each(function(index) {
        // 배열에서 해당 상품의 가격 가져오기
        var productPrice = prices[index];
        var productAmount = amounts[index];

        var orderProductPrice = productPrice*productAmount;
        // 가격을 포맷하여 해당 요소에 출력
        $(this).text(formatNumber(orderProductPrice) + "원");
    });

    $('.order_productState').each(function(index) {
        // 배열에서 해당 상품의 상태 가져오기
        var productState = orderStates[index];

        $(this).text(getOrderStateText(productState));

        // 상태관리 버튼
        var buttonContainer = $(this).closest('td').find('.btn-secondary');
        var buttonGroupContainer = $(this).closest('td').find('.button-group');

        // 버튼 초기화
        buttonContainer.text('').hide().removeAttr('id'); // id 초기화
        buttonGroupContainer.empty(); // 교환/환불 버튼 초기화

        switch(productState) {
            case 1: // 결제완료
            case 8: // 부분취소 완료
                buttonContainer.text('상품준비').attr('id', 'btn_prepare').show();
                break;
            case 3: // 배송시작
            case 4: // 배송중
            case 6: // 구매확정
            case 7: // 전체취소 완료
            case 11:
            case 14:
                buttonContainer.hide();
                break;
            case 5: // 배송완료
                // 교환 및 환불 버튼 두 개 추가
                buttonGroupContainer.append('<button class="btn btn-secondary" id="btn_exchange">교환</button>');
                buttonGroupContainer.append('<button class="btn btn-secondary" id="btn_refund">환불</button>');
                break;
            case 10: // 교환 처리중
                buttonContainer.text('교환완료').attr('id', 'btn_exchange_complete').show();
                break;
            case 13: // 환불 처리중
                buttonContainer.text('환불완료').attr('id', 'btn_refund_complete').show();
                break;
            default:
                $buttonContainer.hide();
                break;
        }
    });

})

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
        case 7:
            return "전체취소 완료";
        case 8:
            return "부분취소 완료";
        case 9:
            return "교환접수 완료";
        case 10:
            return "교환 처리중";
        case 11:
            return "교환 처리완료";
        case 12:
            return "환불접수 완료";
        case 13:
            return "환불 처리중";
        case 14:
            return "환불 처리완료";
        default:
            return "상태오류";
    }
}

//운송장 등록
$(document).on('click', '#order_trackingNum_btn', function() {
    // order_idx url에서 찾기
    var urlParams = new URLSearchParams(window.location.search);
    var order_idx = urlParams.get('order_idx');  // URL에서 order_idx 가져옴

    var trackingNumCell = $('#trackingNumCell');

    // input 필드가 이미 존재? 값 저장
    if (trackingNumCell.find('input').length > 0) {
        var trackingNum = trackingNumCell.find('input').val();
        trackingNumCell.text(trackingNum);  // 입력된 값을 텍스트로 표시
        // 운송장 번호 디비에 저장
        saveTrackingNumber(trackingNum, order_idx);
        // 버튼을 "수정"으로 변경
        $(this).text('수정');
    } else {
        // 기존 운송장 번호 값을 저장하고, input 필드로 변경
        var currentTrackingNum = trackingNumCell.text();
        trackingNumCell.html('<input type="text" class="form-control" id="trackingNumInput" value="' + currentTrackingNum + '" />');

        // 버튼의 텍스트를 "저장"으로 변경
        $(this).text('저장');
    }
});

const token = localStorage.getItem("token");
// 운송장 번호 디비에 저장 함수
function saveTrackingNumber(trackingNum, order_idx) {
    console.log(trackingNum);
    console.log(order_idx);
    $.ajax({
        url: '/master/saveTrackingNumber',
        type: 'POST',
        data: JSON.stringify({ trackingNum: trackingNum, order_idx: order_idx }),
        contentType: 'application/json',
        headers: {
            "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            alert('운송장 번호가 저장되었습니다.');
            location.reload();
        },
        error: function(error) {
            alert('운송장 번호 저장 중 오류가 발생했습니다.');
            console.log(error);
        }
    });
}

// 버튼 클릭시 상태 변경
// 상품준비중
$(document).on('click', '#btn_prepare', function() {
    var idx = $(this).closest('tr').find('#idx').val();
    console.log(idx);
    updateOrderState(idx, 2); // 상품준비중으로 변경
});
//교환
$(document).on('click', '#btn_exchange', function() {
    var idx = $(this).closest('tr').find('#idx').val();
    updateOrderState(idx, 10); // 교환 처리중으로 변경
});
$(document).on('click', '#btn_exchange_complete', function() {
    var idx = $(this).closest('tr').find('#idx').val();
    updateOrderState(idx, 11); // 교환완료로 변경
});
//환불
$(document).on('click', '#btn_refund', function() {
    var idx = $(this).closest('tr').find('#idx').val();
    updateOrderState(idx, 13); // 환불 처리중으로 변경
});

// 주문 상태 업데이트 함수
function updateOrderState(idx, newState) {
    $.ajax({
        url: '/master/updateOrderState',
        type: 'POST',
        data: JSON.stringify({ idx: idx, orderState: newState }),
        contentType: 'application/json',
        headers: {
            "Authorization": `Bearer ${token}`
        },
        success: function(response) {
            alert('주문 상태가 업데이트되었습니다.');
            location.reload(); // 상태 업데이트 후 새로고침
        },
        error: function(error) {
            alert('상태 업데이트 중 오류가 발생했습니다.');
            console.log(error);
        }
    });
}