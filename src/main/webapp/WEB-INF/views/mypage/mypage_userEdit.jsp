<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/page_header.jspf"%>

<link rel="stylesheet" href="/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="/css/mypage_userEdit.css" type="text/css" />
<script src="/js/mypage_userEdit.js"></script>

<div class="mypage_wrap">
  <div class="mypage_main_wrap">
    <div class="mypage_left">
      <a href="/user/mypage" class="mypage_home">MY PAGE</a>
      <section class="mypage_menu">
          <h3>나의 쇼핑정보</h3>
          <ul>
            <li>
              <a href="/user/mypage_order">주문배송조회</a>
            </li>
            <li>
              <a href="/user/mypage_review"> 상품 리뷰 </a>
            </li>
          </ul>
          <h3>나의 계정설정</h3>
          <ul>
            <li>
              <a href="/user/mypage_userEdit" class="option_active">회원정보수정</a>
            </li>
            <li>
              <a href="">내가 쓴 글</a>
            </li>
            <li>
              <a href="/user/mypage_point">적립금</a>
            </li>
            <li>
              <a href="/user/mypage_heart">좋아요</a>
            </li>
            <li>
              <a href="/user/mypage_userDel">회원탈퇴</a>
            </li>
          </ul>
          <h3>고객센터</h3>
          <ul>
            <li>
              <a href="/user/mypage_qna">1:1 문의</a>
            </li>
            <li>
              <a href="">공지사항</a>
            </li>
            <li>
              <a href="">FAQ</a>
            </li>
          </ul>
        </section>

      <section>
        <div class="btn_bx">
          <button type="button" class="logout_btn">LOGOUT</button>
        </div>
      </section>
    </div>
    <div class="mypage_right">
      <ul class="mypage_right_top">
        <li class="user_inform">
          <a class="atag_css" href="/user/mypage_userEdit"
            ><strong>회원정보 수정</strong><span>sing2727 님</span></a
          >
        </li>
        <li class="user_retention_details">
          <a class="atag_css" href="/user/mypage_point"
            ><strong class="">적립금</strong><span class="">360</span></a
          >
        </li>
        <li class="user_retention_details">
          <a class="atag_css" href="/user/mypage_review"
            ><strong class="">작성한 리뷰</strong><span class="afterCountSpan"></span></a
          >
        </li>
      </ul>

      <div class="mypage_right_element">
        <!-- 여기에 페이지에 맞는 요소 넣으면 됨 -->
        <h4 class="my_tit">회원정보 수정</h4>
        <div class="userEdit_form">
          <div class="useredit_input_group">
            <label for="login_type">로그인 정보</label>
            <input
              type="text"
              id="login_type"
              name="login_type"
              value="로컬"
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
              value="sing2727"
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
              value="김채원"
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
              value="완료"
              readonly
              class="input_readonly"
            />
          </div>
          <div class="useredit_input_group">
            <label for="useremail">이메일</label>
            <input type="text" id="emailtext" name="emailtext" />
          </div>
          <div class="useredit_input_group">
            <label for="tel">전화번호</label>
            <select name="tel1" id="tel1">
              <option value="010">010</option>
              <option value="010">02</option>
              <option value="010">070</option>
            </select>
            -
            <input type="text" id="tel2" name="tel2" />
            -
            <input type="text" id="tel3" name="tel3" />
            <input type="hidden" id="tel" name="tel" />
          </div>
          <div class="useredit_input_group">
            <label for="zipcode">주소</label>
            <input type="text" id="zipcode" name="zipcode" />
            <input
              type="button"
              class="zipcode_search_btn"
              value="우편번호 찾기"
            />
          </div>
          <div class="useredit_input_group">
            <label></label>
            <input type="text" id="addr" name="addr" />
          </div>
          <div class="useredit_input_group">
            <label></label>
            <input
              type="text"
              id="addrDetail"
              name="addrDetail"
              placeholder="상세주소를 입력하세요."
            />
          </div>
          <div class="inputBtn_div">
            <button class="userEdit_button">수정하기</button>
            <button class="userDel_button" onclick="location.href='/user/mypage_userDel'">회원탈퇴</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

