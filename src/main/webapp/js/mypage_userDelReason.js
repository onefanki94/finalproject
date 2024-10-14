$(function(){
    $(document).on('click', '#userDel_next', function() {
        var delReason = $("#delReason").val();
        var delReasonDetail = $("#delReasonDetail").val();

        console.log(delReason);
        console.log(delReasonDetail);

        var data = {
            delReason : delReason,
            delReasonDetail : delReasonDetail
        }
        $.ajax({
            url: '/user/userDelReasonOK',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
            success: function(response) {
                location.href="/user/mypage_userDelAgree"
            },
            error: function(error) {
                console.log('탈퇴 사유 임시 저장 중 에러 발생:', error);
            }
        });
    })


})