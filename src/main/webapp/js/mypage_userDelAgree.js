// 비밀번호 확인 모달창
let tag=``;
function pwdCheckModal(){
    tag = ``; //태그내용 초기화
    tag +=`
        <div class="pwdCheck_modal_body">
          <div></div>
          <div class="pwdCheck_modal_container">
            <div class="pwdCheck_modal_container_flex" id="pwdCheck_modal_container_flex">
              <div>
                <span>비밀번호 확인</span>
                <i class="fa-solid fa-x" onclick="pwdCheckModal_exit()"></i>
              </div>
              <div id="pwdCheck_input_div">
                <input
                  type="password"
                  id="userpwd"
                  name="userpwd"
                  placeholder="현재 비밀번호를 입력하세요."
                />
                <button id="pwdCheck_btn">확인</button>
              </div>

            </div>
          </div>
        </div>
    `;
    $("body").append(tag);
}

function pwdCheckModal_exit(){
    $(".pwdCheck_modal_body").remove();
}

$(function(){
    // 회원정보 적립금 표시
     setTimeout(function() {
        // 공통 함수에서 업데이트된 데이터 사용
        var currentID = $('.currentID').text().replace(" 님", "");  // currentID에서 " 님"을 제거
        var reservePoint = $('.reservePoint').text();

        // 탈퇴 페이지의 DOM 요소 업데이트
        $('.delid').text(currentID);  // 첫 번째 span에 아이디 표시
        $('.delPoint').text(reservePoint + "원");  // 두 번째 span에 적립금 표시
    }, 500);

    const token = localStorage.getItem("token");

    $("#chk_agree").change(function () {
      if ($(this).prop("checked")) {
        $("label[for='chk_agree']").addClass("checkedLabel");
      } else {
        $("label[for='chk_agree']").removeClass("checkedLabel");
      }
    });

    $(document).on('click', '#userDel_OK', function() {
        console.log("Dd")
        // 1. 약관동의 체크 여부 확인
        if (!$('#chk_agree').prop('checked')) {
            alert("약관에 동의해주세요!");
            return false;
        }

        // 2. 비밀번호 확인 모달창 열기
        pwdCheckModal();
    })

    // 비밀번호 확인 버튼 클릭 시
    $(document).on('click', '#pwdCheck_btn', function() {
        var userpwd = $("#userpwd").val(); // 비밀번호 값 가져오기
        if (userpwd == "") {
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        // 이전 결과 태그 제거 (기존 메시지 초기화)
        $("#pwdCheck_input_div p").remove();

        $.ajax({
            url: "/user/checkPwd", // 서버의 비밀번호 확인 URL
            type: "POST",
            data: {
                userpwd: userpwd // 서버에 전송할 데이터
            },
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success: function(response) {
                console.log(response);
                tag = ``;
                tag += `<p>* 비밀번호가 일치합니다.</p>`;
                $("#pwdCheck_input_div").append(tag);

                tag = ``;
                tag += `
                    <div>
                        <p>정말로 탈퇴하시겠습니까?</p>
                        <button id="delYes">네</button>
                        <span>,</span>
                        <button onclick="location.href='/user/mypage_userEdit'">아니요</button>
                    </div>
                `;
                $("#pwdCheck_modal_container_flex").append(tag);
            },
            error: function(e) {
                console.log(e);
                $("#userpwd").val('');
                $("#userpwd").attr('placeholder', '비밀번호를 다시 입력하세요.');
                tag = ``;
                tag += `<p>* 비밀번호가 일치하지 않습니다! 다시 입력하세요.</p>`;
                $("#pwdCheck_input_div").append(tag);

            }
        });
    })

    // 회원 탈퇴 진행
    $(document).on('click', '#delYes', function() {
        console.log(token);
        $.ajax({
            url: "/user/userDelOk", // 서버의 비밀번호 확인 URL
            type: "POST",
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success: function(response) {
                localStorage.removeItem("token");
                alert("회원 탈퇴가 완료되었습니다!\n메인페이지로 이동합니다.");
                location.href="/"
            },
            error: function(e) {
                console.log(e);
            }
        });
    })

})//jquery 끝