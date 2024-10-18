<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 로그인</title>
    <script>
        // 서버에서 전달된 값들을 JavaScript 변수로 저장
         var errorMessage = "${errorMessage}" || null;

            // errorMessage가 존재할 경우 경고 메시지 표시
            if (errorMessage) {
                alert(errorMessage);
            }

            document.addEventListener("DOMContentLoaded", function() {
                const form = document.querySelector('form');
                form.addEventListener('submit', function(event) {
                    event.preventDefault();
                    const adminid = document.querySelector('#adminid').value;
                    const adminpwd = document.querySelector('#adminpwd').value;

                    adminLogin(adminid, adminpwd);  // 여기서 함수 호출
                });
            });


    </script>
    <link rel="stylesheet" href="/css/admin_login.css" type="text/css" />
    <script src="/js/JWTLogin.js"></script>
  </head>
  <body>
    <div class="adm_login_container">
      <h3>ADMIN LOGIN</h3>
      <div class="bar"></div>
      <div class="logo_img_div"><img src="/img/main_img/logo_ex.png" /></div>
      <form action="/master/masterLoginOK" method="post">
        <div>
          <input type="text" name="adminid" id="adminid" placeholder="아이디를 입력하세요." />
          <input type="password" name="adminpwd" id="adminpwd" placeholder="비밀번호를 입력하세요." />
        </div>
        <input type="submit" value="로그인" class="admlogin_btn" />
      </form>
      <div class="bottom_txtarea">
        <p>홈페이지 운영을 위한 관리자모드 로그인 페이지입니다.</p>
        <p>관리자 가입문의<span>010-8991-9506</span></p>
      </div>
    </div>
  </body>
</html>
<script src="/js/Master.js"></script>