<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/login.css" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 서버에서 전달된 값들을 JavaScript 변수로 저장
     var errorMessage = "${errorMessage}" || null;
        var isBanned = "${isBanned}" || null;
        var isDeleted = "${isDeleted}" || null;

        // errorMessage가 존재할 경우 경고 메시지 표시
        if (errorMessage) {
            alert(errorMessage);
        }

        // 사용자가 정지된 상태일 경우 경고 메시지 표시
        if (isBanned === 'true') {
            alert("로그인이 정지된 사용자입니다.");
        }

        // 사용자가 탈퇴된 상태일 경우 경고 메시지 표시
        if (isDeleted === 'true') {
            alert("회원 탈퇴된 사용자입니다.");
        }


      $(document).ready(function() {
          console.log("페이지가 로드되었습니다.");
          console.log("현재 URL:", window.location.href);  // 현재 URL 출력

          const urlParams = new URLSearchParams(window.location.search);
          console.log("URL 파라미터:", urlParams.toString());  // URL 파라미터 출력
          const code = urlParams.get('code'); // Google 인증 코드 추출

          if (code) {
              console.log("인증 코드가 발견되었습니다:", code);  // 인증 코드 출력
              socialLogin(code);
          } else {
              console.error("인증 코드가 URL에 없습니다.");
              alert("인증 코드가 없어서 로그인을 진행할 수 없습니다.");
          }
      });

      function socialLogin(code) {
          if (!code) {
              console.error("구글 인증 코드가 없습니다.");
              alert("로그인에 실패했습니다.");
              return;
          }

          console.log("소셜 로그인 요청을 시작합니다. 코드:", code); // 확인용 로그 추가
          $.ajax({
              url: '/user/socialLogin',
              type: 'POST',
              contentType: 'application/json',
              data: JSON.stringify({ code: code }),
              success: function(response) {
                  console.log("서버 응답:", response);
                  if (response && response.token) {
                      const token = response.token;
                      console.log("받은 토큰:", token); // 받은 토큰 로그 출력
                      localStorage.setItem("token", token);
                      alert("로그인 성공!");
                      window.location.href = response.redirectUrl || "/";
                  } else {
                      console.error("유효하지 않은 응답 또는 토큰이 없습니다.");
                      alert("로그인 실패: " + (response.errorMessage || "다시 시도해 주세요."));
                  }
              },
              error: function(xhr, status, error) {
                  console.error("로그인 중 오류 발생:", error);
                  console.log("XHR 상태:", xhr);
                  console.log("상태 코드:", status);
                  alert("로그인 실패: 다시 시도해 주세요.");
              }
          });
          }


</script>
  </head>
  <body>
    <div class="join_div">
      <div class="join_back_div">
        <div
          class="join_back_img"
          style="background: url('/img/join_img/join_back1.png')"
        ></div>
        <div
          class="join_back_img"
          style="background: url('/img/join_img/join_back2.png')"
        ></div>
        <div
          class="join_back_img"
          style="background: url('/img/join_img/join_back3.png')"
        ></div>
        <div
          class="join_back_img"
          style="background: url('/img/join_img/join_back4.png')"
        ></div>
        <div
          class="join_back_img"
          style="background: url('/img/join_img/join_back1.png')"
        ></div>
      </div>
      <div class="join_back_div_color"></div>
      <div class="login_div_pa">
        <div class="login_div_ch">
          <a href="/"><img id="logo_img" src="/img/main_img/logo_ex.png"/></a>
          <form class="login-form" action="/user/loginOk" method="POST">
            <div class="login_input-group">
              <input
                type="text"
                id="userid"
                name="userid"
                placeholder="아이디를 입력하세요"
              />
            </div>
            <div class="login_input-group">
              <input
                type="password"
                id="userpwd"
                name="userpwd"
                placeholder="비밀번호를 입력하세요."
                required
              />
            </div>
            <button type="submit" class="login_button">로그인</button>
          </form>
          <div class="login_bottom">
            <a href="/user/idSearch">아이디 찾기</a>
            <span>•</span>
            <a href="/user/pwdSearch">비밀번호 찾기</a>
            <span>•</span>
            <a href="/user/join">회원가입</a>
          </div>
          <div class="login_bottom_line">
            <div class="or_line"></div>
            <div class="or_txt">SNS 계정으로 시작하기</div>
            <div class="or_line"></div>
          </div>
          <div class="sns_login_div">
            <div class="sns_login google">
              <a href="/oauth2/authorization/google" onclick="socialLogin()"><svg
                  width="100%"
                  height="100%"
                  viewBox="0 0 24 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                  class="sc-e9517e64-8 dbIvDr"
                >
                  <circle cx="12" cy="12" r="12" fill="#F5F5F5"></circle>
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M12 9.825c.666 0 1.115.288 1.37.529l1.002-.978A3.406 3.406 0 0 0 12 8.455a3.542 3.542 0 0 0-3.167 1.954l1.146.89A2.143 2.143 0 0 1 12 9.825Z"
                    fill="#EA4335"
                  ></path>
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M15.403 12.079c0-.292-.023-.505-.075-.725H12v1.316h1.954c-.04.326-.252.819-.725 1.15l1.12.867c.669-.619 1.054-1.529 1.054-2.608Z"
                    fill="#4285F4"
                  ></path>
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M9.983 12.701a2.178 2.178 0 0 1-.004-1.403l-1.146-.89a3.546 3.546 0 0 0 0 3.184l1.15-.89Z"
                    fill="#FBBC05"
                  ></path>
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M12 15.545c.957 0 1.76-.315 2.348-.858l-1.119-.867c-.3.21-.7.354-1.229.354a2.134 2.134 0 0 1-2.017-1.473l-1.147.89A3.538 3.538 0 0 0 12 15.545Z"
                    fill="#34A853"
                  ></path></svg>
                </a>
            </div>
            <div class="sns_login kakao">
              <a href="#">
                <svg
                  width="100%"
                  height="100%"
                  viewBox="0 0 24 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                  class="sc-e9517e64-8 dbIvDr"
                >
                  <circle cx="12" cy="12" r="12" fill="#FEE500"></circle>
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M12.296 8.455c-2.122 0-3.841 1.314-3.841 2.936 0 1.008.665 1.897 1.677 2.426l-.426 1.54a.152.152 0 0 0 .062.164.158.158 0 0 0 .178.002l1.868-1.22c.158.015.318.024.48.024 2.122 0 3.842-1.315 3.842-2.936s-1.72-2.936-3.841-2.936"
                    fill="#000"
                    fill-opacity="0.9"
                  ></path>
                  </svg>
                </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
