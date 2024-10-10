<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/admin_login.css" type="text/css" />
  </head>
  <body>
    <div class="adm_login_container">
      <h3>ADMIN LOGIN</h3>
      <div class="bar"></div>
      <div class="logo_img_div"><img src="/img/main_img/logo_ex.png" /></div>
      <form>
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
