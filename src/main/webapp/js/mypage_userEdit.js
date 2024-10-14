$(function(){
    const token = localStorage.getItem("token");

    function userInfo(){
        $("#userEdit_form").empty();
        $.ajax({
            url: '/user/userInfo',
            type: 'POST',
            contentType: 'application/json',
            headers: {
                "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success:function(response){
                console.log(response.userinfo);
                console.log(response.reviewCompletedAmount);

                const reviewCompletedAmount = response.reviewCompletedAmount;
                // 내 리뷰 수 업데이트
                $('.afterCountSpan').text(reviewCompletedAmount);

                const userinfo = response.userinfo;
                // 로그인타입
                let login_type = "";
                if(userinfo.login_type==1){
                    login_type = "로컬";
                }else if(userinfo.login_type==2){
                    login_type = "카카오";
                }

                // 본인인증 상태
                let adult_state = "";
                let tag = ``;
                if(userinfo.adult_state==1){
                    adult_state = "완료";
                }else{
                    adult_state = "미완료";
                }

                // 주솟값 null인 경우
                let zipcode="";
                let addr="";
                let addrdetail="";
                if(userinfo.zipcode==null){
                    zipcode="";
                }else{
                    zipcode=userinfo.zipcode;
                }
                if(userinfo.addr==null){
                    addr="";
                }else{
                    addr=userinfo.addr;
                }
                if(userinfo.addrdetail==null){
                    addrdetail="";
                }else{
                    addrdetail=userinfo.addrdetail;
                }

                let tel1;
                let tel2="";
                let tel3="";
                // 전화번호 나누기 (010-1234-5678 형식)
                if(userinfo.tel!=null){
                    const telParts = userinfo.tel.split("-");
                    tel1 = telParts[0];
                    tel2 = telParts[1];
                    tel3 = telParts[2];

                    console.log(tel1);
                    console.log(tel2);
                    console.log(tel3);
                }

                $("#userEdit_form").append(`
                    <div class="useredit_input_group">
                        <label for="login_type">로그인 정보</label>
                        <input
                          type="text"
                          id="login_type"
                          name="login_type"
                          value="${login_type}"
                          readonly
                          class="input_readonly"
                        />
                    </div>
                    <div class="useredit_input_group">
                        <label for="userid">아이디</label>
                        <input
                          type="text"
                          name="userid"
                          id="userid"
                          value="${userinfo.userid}"
                          readonly
                          class="input_readonly"
                        />
                    </div>

                    <div class="useredit_input_group">
                        <label for="username">이름</label>
                        <input
                          type="text"
                          id="username"
                          name="username"
                          value="${userinfo.username}"
                          readonly
                          class="input_readonly"
                        />
                    </div>
                    <div class="useredit_input_group">
                        <label for="adult_state">본인인증</label>
                        <input
                          type="text"
                          id="adult_state"
                          name="adult_state"
                          value="${adult_state}"
                          readonly
                          class="input_readonly"
                        />
                        <div id="authButtonContainer"></div>
                    </div>
                    <div class="useredit_input_group">
                        <label for="useremail">이메일</label>
                        <input type="text" id="email" name="email" value="${userinfo.email}"/>
                    </div>
                    <div class="useredit_input_group">
                        <label for="tel">전화번호</label>
                        <select name="tel1" id="tel1">
                          <option value="010" ${tel1 === '010' ? 'selected' : ''}>010</option>
                          <option value="02" ${tel1 === '02' ? 'selected' : ''}>02</option>
                          <option value="070" ${tel1 === '070' ? 'selected' : ''}>070</option>
                        </select>
                        -
                        <input type="text" id="tel2" name="tel2" value="${tel2}"/>
                        -
                        <input type="text" id="tel3" name="tel3" value="${tel3}"/>
                    </div>
                    <div class="useredit_input_group">
                        <label for="zipcode">주소</label>
                        <input type="text" id="zipcode" name="zipcode" value="${zipcode}" />
                        <input
                          type="button"
                          class="zipcode_search_btn"
                          value="우편번호 찾기"
                          onclick="daumPostcode()"
                        />
                    </div>
                    <div class="useredit_input_group">
                        <label></label>
                        <input type="text" id="addr" name="addr" value="${addr}"/>
                    </div>
                    <div class="useredit_input_group">
                        <label></label>
                        <input
                          type="text"
                          id="addrdetail"
                          name="addrdetail"
                          placeholder="상세주소를 입력하세요."
                          value="${addrdetail}"
                        />
                    </div>
                    <div class="inputBtn_div">
                        <button class="userEdit_button">수정하기</button>
                        <button class="userDel_button" onclick="location.href='/user/mypage_userDelReason'">회원탈퇴</button>
                    </div>
                `)
                // 본인인증 버튼 추가
                if (userinfo.adult_state != 1) {
                    $('#authButtonContainer').append('<button>인증하기</button>');
                }
            },
             error: function(xhr, status, error) {
                console.log('오류 발생: ' + error);  // 에러 메시지 자체 출력
            }
        })//ajax 끝
    }//userInfo 함수 끝
    userInfo();

    //회원 수정
    $(document).on('click', '.userEdit_button', function() {
        var email = $("#email").val();
        var tel = $("#tel1").val()+"-";
        tel += $("#tel2").val()+"-";
        tel += $("#tel3").val();
        var zipcode = $("#zipcode").val();
        var addr = $("#addr").val();
        var addrdetail = $("#addrdetail").val();
        var adult_state = $("#adult_state").val();

        if(adult_state=="완료"){
            adult_state=1;
        }else{
            adult_state=0;
        }

        console.log(adult_state);

        if(email==""){
            alert("이메일을 입력하세요.")
            return false;
        }
        var regEx = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
        if(!regEx.test(tel)){
            alert("연락처를 잘못 입력했습니다.")
            return false;
        }

        // JSON 객체를 사용하여 데이터를 전송
        var data = {
            email: email,
            tel: tel,
            zipcode: zipcode,
            addr: addr,
            addrdetail: addrdetail,
            adult_state : adult_state
        };

        $.ajax({
            url: '/user/userEditOK',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
            headers: {
                    "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
            },
            success: function(response) {
                console.log(response);
                alert("회원 정보가 성공적으로 수정되었습니다.");
                userInfo();
            },
            error: function(error) {
                console.log('회원 수정 중 오류 발생:', error);
            }
        });

    })//회원 수정 끝
})//jquery 끝