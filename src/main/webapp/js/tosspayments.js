var token = localStorage.getItem("token"); //토근 값 가져오기

// UUID 생성 함수 (버전 4 UUID)
function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        const r = Math.random() * 16 | 0, v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

async function requestPayment(userid) {
    const customerKey = userid;//사용자코드
    const orderId = generateUUID();//주문번호
    let amount = parseInt($("#total_payPrice").val());

    // 조건 추가
    if($("#recipient").val()==""){
        alert("수령인을 입력하세요!");
        return false;
    }
    if($("#zipcode").val()==""||$("#addr").val()==""){
        alert("주소를 입력하세요!");
        return false;
    }
    if($("#addrdetail").val()==""){
        alert("상세주소를 입력하세요!\n없으면 없음이라고 적어주셔야합니다.");
        return false;
    }
    var tel = $("#tel1").val()+"-";
    tel += $("#tel2").val()+"-";
    tel += $("#tel3").val();

    if($("#tel2").val()==""||$("#tel3").val()==""){
        alert("연락처를 입력해주세요!");
        return false;
    }
    var regEx = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
    if(!regEx.test(tel)){
        alert("연락처를 잘못 입력했습니다.")
        return false;
    }
    if (!$('#chk_payment').prop('checked')) {
        alert("결제 방법을 선택해주세요!");
        return false;
    }
    if (!$('#chk_agree').prop('checked')) {
        alert("주문 약관에 동의해주세요!");
        return false;
    }

    // T_order에 저장할 데이터
    var recipient = $("#recipient").val();
    var zipcode = $("#zipcode").val();
    var addr = $("#addr").val();
    var addrdetail = $("#addrdetail").val();
    var request_memo = $("#request_memo").val();
    var use_point = $("#order_use_point").val();

    console.log("customerKey :",customerKey);
    console.log("userid :",userid);
    console.log("orderId :",orderId);
    console.log("amount :",amount);
    console.log("order_idx :",order_idx);

    console.log("recipient :",recipient);
    console.log("zipcode :",zipcode);
    console.log("addr :",addr);
    console.log("addrdetail :",addrdetail);
    console.log("request_memo :",request_memo);
    console.log("use_point :",use_point);
    console.log("tel :",tel);

    var data ={
        orderId: orderId,
        amount: amount,
        customerName: customerKey,
        order_idx: order_idx,
        recipient : recipient,
        zipcode : zipcode,
        addr : addr,
        addrdetail : addrdetail,
        request_memo : request_memo,
        use_point : use_point,
        tel : tel
    };

    // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요. -> /request WHY? 무결성때문
    // 서버로 결제 정보 저장 요청
    $.ajax({
        url: "/order/request",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
        headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            console.log("결제 요청 저장 완료");
        },
        error: function(error) {
            console.log("결제 요청 저장 실패", error);
        }
    }); //완료

    const clientKey = "test_ck_ZLKGPx4M3MGJP1NJGYWdrBaWypv1";
    const tossPayments = TossPayments(clientKey);

    const payment = tossPayments.payment({ customerKey });
    // orderList의 첫 번째 상품 이름과 전체 갯수를 결합한 orderName 생성
    let firstProductTitle = orderList[0].title; // 첫 번째 상품의 title
    let totalItemsCount = orderList.length;     // orderList의 전체 갯수

    // orderName 생성 ("상품명 외 n건" 형식)
    let orderName = `${firstProductTitle} 외 ${totalItemsCount - 1}건`;  // 외 2건 등으로 표현
    console.log("orderName : ",orderName);

    return false;


    await payment.requestPayment({
        method: "CARD", // 카드 결제
        amount: {
                currency: "KRW",
                value: amount,
        },  // 결제 금액
        orderId: orderId,  // 생성된 UUID로 주문번호 설정
        orderName: "토스 티셔츠 외 2건",  // 상품명
        successUrl: window.location.origin + "/order/success",  // 결제 성공시 리다이렉트 URL
        failUrl: window.location.origin + "/order/fail",  // 결제 실패시 리다이렉트 URL
        customerName: customerKey,
        card: {
            useEscrow: false,
            flowMode: "DEFAULT", // 통합결제창 여는 옵션
            useCardPoint: false,
            useAppCardOnly: false,
        },
    });
}

$(function(){
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