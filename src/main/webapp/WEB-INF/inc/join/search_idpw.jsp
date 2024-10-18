<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="stylesheet" href="/css/search_idpw.css" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="/js/search_idpw.js"></script>
  </head>

  <body>
    <div class="serachIdPw_div">
      <div class="serachIdPw_back_div">
        <div class="serachIdPw_back_img" style="background: url('/img/join_img/join_back1.png')"></div>
        <div class="serachIdPw_back_img" style="background: url('/img/join_img/join_back2.png')"></div>
        <div class="serachIdPw_back_img" style="background: url('/img/join_img/join_back3.png')"></div>
        <div class="serachIdPw_back_img" style="background: url('/img/join_img/join_back4.png')"></div>
        <div class="serachIdPw_back_img" style="background: url('/img/join_img/join_back1.png')"></div>
      </div>
      <div class="serachIdPw_back_div_color"></div>
      <div class="serachIdPw_div_pa">
        <div class="serachIdPw_div_ch">
          <div class="login_tab">
            <ul>
              <li onclick="reviewTab('tab1')">아이디 찾기</li>
              <li class="search_off" onclick="reviewTab('tab2')">비밀번호 찾기</li>
            </ul>
          </div>
          <div class="serachIdPw_bottom on" id="tab1">
            <h1>
              아이디를 잊으셨나요?
              <span>가입시 입력하신 정보로 아이디를 찾으실 수 있습니다.</span>
            </h1>
            <div class="serachIdPw_input">
              <input type="text" id="username" name="username" placeholder="이름을 입력하세요." />
              <input type="text" id="email" name="email" placeholder="이메일을 입력하세요." />
            </div>
            <div class="serachIdPw_qna">위의 정보로 아이디 찾기가 불가능 하신가요?<br /><a href="/customer/0">고객센터로 문의하기</a></div>
            <div class="serachIdPw_btn"><button>아이디 찾기</button></div>
          </div>
          <div class="serachIdPw_bottom off" id="tab2">
            <h1>
              비밀번호를 잊으셨나요?
              <span>가입시 입력하신 정보로 비밀번호를 찾으실 수 있습니다.</span>
            </h1>
            <div class="serachIdPw_input">
              <input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요." />
              <input type="text" id="username" name="username" placeholder="이름을 입력하세요." />
              <input type="text" id="email" name="email" placeholder="이메일을 입력하세요." />
            </div>
            <div class="serachIdPw_qna">위의 정보로 비밀번호 찾기가 불가능 하신가요?<br /><a href="/customer/0">고객센터로 문의하기</a></div>
            <div class="serachIdPw_btn"><button>비밀번호 찾기</button></div>
          </div>
        </div>
      </div>
    </div>
    <!-- <div class="success_modal_body">
      <div></div>
      <div class="success_modal_container">
        <div class="success_modal_container_flex">
          <div>
            <span>아이디 찾기</span>
            <i class="fa-solid fa-x"></i>
          </div>
          <div>회원님이 찾으신 아이디는 <span>sing2727</span> 입니다.</div>
          <div><button onclick="location.href='/user/login'">로그인 하러가기</button></div>
        </div>
      </div>
    </div> -->
  </body>
</html>
