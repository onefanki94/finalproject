// UUID 생성 함수 (버전 4 UUID)
function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        const r = Math.random() * 16 | 0, v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

async function requestPayment(userid) {
    // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
    // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
    const clientKey = "test_ck_ZLKGPx4M3MGJP1NJGYWdrBaWypv1";
    const customerKey = userid;
    const tossPayments = TossPayments(clientKey);

    const payment = tossPayments.payment({ customerKey });

    const orderId = generateUUID();

    console.log("customerKey : ",customerKey);
    console.log("userid : ",userid);
    console.log("orderId : ",orderId);
    console.log("amount : ",amount);

    await payment.requestPayment({
        method: "CARD", // 카드 결제
        amount: {
                currency: "KRW",
                value: amount,
        },  // 결제 금액
        orderId: orderId,  // 생성된 UUID로 주문번호 설정
        orderName: "토스 티셔츠 외 2건",  // 상품명
        successUrl: window.location.origin + "/success",  // 결제 성공시 리다이렉트 URL
        failUrl: window.location.origin + "/fail",  // 결제 실패시 리다이렉트 URL
        customerName: userid,
        card: {
            useEscrow: false,
            flowMode: "DEFAULT", // 통합결제창 여는 옵션
            useCardPoint: false,
            useAppCardOnly: false,
        },
    });
}

$(function(){
    var token = localStorage.getItem("token"); //토근 값 가져오기
    if(token != "" && token != null){
        $.ajax({
            url:"/order/getuserid",
            type:"GET",
            data:{ Authorization:token },
            success: function(userid){
                console.log("로그인된 사용자 ID:" + userid);
                // 버튼 클릭 시 결제 요청
                $("#payBtn").on("click", function() {
                    requestPayment(userid);  // 버튼 클릭 시 결제 요청 함수 호출
                });
            },
            error: function(e){
                console.log(e);
            }
        });
    }
})