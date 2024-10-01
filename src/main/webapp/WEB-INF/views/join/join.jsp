<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/join.css" type="text/css" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/js/daum_api.js"></script>
    <script src="/js/join_ effectiveness.js"></script>
  </head>
  <body>
    <div class="join_div">
      <div class="join_back_div">
        <div class="join_back_img" style="background: url('/img/join_img/join_back1.png')"></div>
        <div class="join_back_img" style="background: url('/img/join_img/join_back2.png')"></div>
        <div class="join_back_img" style="background: url('/img/join_img/join_back3.png')"></div>
        <div class="join_back_img" style="background: url('/img/join_img/join_back4.png')"></div>
        <div class="join_back_img" style="background: url('/img/join_img/join_back1.png')"></div>
      </div>
      <div class="join_back_div_color"></div>
      <div class="join_div_pa">
        <div class="join_div_ch">
          <h1 style="color: #fff; margin: 0 0 40px">회원가입</h1>
          <form class="join-form" method="POST" action="#" onsubmit="return formCheck()">
            <div class="join_input-group">
              <span>아이디 *</span>
              <input type="text" id="userid" name="userid" />
              <input type="button" class="id_check_btn" value="중복확인" />
            </div>
            <div class="join_input-group">
              <span>비밀번호 *</span>
              <input type="password" id="userpwd" name="userpwd" />
            </div>
            <div class="join_input-group">
              <span>비밀번호 확인</span>
              <input type="password" id="userpwd2" name="userpwd2" />
            </div>
            <div class="join_input-group">
              <span>이름 *</span>
              <input type="text" id="username" name="username" />
            </div>
            <div class="join_input-group">
              <span>이메일 *</span>
              <input type="text" id="email" name="email" />
            </div>
            <!--
            <div class="join_input-group">
              <span>전화번호</span>
              <input type="text" id="username" name="username" />
            </div>
            -->
            <div class="join_input-group">
              <span>우편번호</span>
              <input type="text" id="zipcode" name="zipcode" />
              <input type="button" class="zipcode_search_btn" value="우편번호 찾기" onclick="daumPostcode()"/>
            </div>
            <div class="join_input-group">
              <span>기본주소</span>
              <input type="text" id="addr" name="addr" />
            </div>
            <div class="join_input-group">
              <span>상세주소</span>
              <input type="text" id="addrdetail" name="addrdetail" />
            </div>

            <input type="submit" class="join_button" value="회원가입">
          </form>
          <!-- <div class="join_bottom_line">
            <div class="or_line"></div>
            <div class="or_txt">SNS 계정으로 회원가입</div>
            <div class="or_line"></div>
          </div>
          <div class="sns_join_div">
            <div class="sns_join google">
              <a href="#"
                ><svg width="100%" height="100%" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="sc-e9517e64-8 dbIvDr">
                  <circle cx="12" cy="12" r="12" fill="#F5F5F5"></circle>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M12 9.825c.666 0 1.115.288 1.37.529l1.002-.978A3.406 3.406 0 0 0 12 8.455a3.542 3.542 0 0 0-3.167 1.954l1.146.89A2.143 2.143 0 0 1 12 9.825Z" fill="#EA4335"></path>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M15.403 12.079c0-.292-.023-.505-.075-.725H12v1.316h1.954c-.04.326-.252.819-.725 1.15l1.12.867c.669-.619 1.054-1.529 1.054-2.608Z" fill="#4285F4"></path>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M9.983 12.701a2.178 2.178 0 0 1-.004-1.403l-1.146-.89a3.546 3.546 0 0 0 0 3.184l1.15-.89Z" fill="#FBBC05"></path>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M12 15.545c.957 0 1.76-.315 2.348-.858l-1.119-.867c-.3.21-.7.354-1.229.354a2.134 2.134 0 0 1-2.017-1.473l-1.147.89A3.538 3.538 0 0 0 12 15.545Z" fill="#34A853"></path>
                </svg>
              </a>
            </div>
            <div class="sns_join kakao">
              <a href="#"
                ><svg width="100%" height="100%" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="sc-e9517e64-8 dbIvDr">
                  <circle cx="12" cy="12" r="12" fill="#FEE500"></circle>
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M12.296 8.455c-2.122 0-3.841 1.314-3.841 2.936 0 1.008.665 1.897 1.677 2.426l-.426 1.54a.152.152 0 0 0 .062.164.158.158 0 0 0 .178.002l1.868-1.22c.158.015.318.024.48.024 2.122 0 3.842-1.315 3.842-2.936s-1.72-2.936-3.841-2.936"
                    fill="#000"
                    fill-opacity="0.9"
                  ></path></svg
              ></a>
            </div>
          </div> -->
        </div>
      </div>
    </div>
  </body>
</html>
