<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/page_header.jspf"%>

<link rel="stylesheet" href="/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<link rel="stylesheet" href="/css/mypage_heart.css" type="text/css" />
<script src="/js/mypage_heart.js"></script>

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
              <a href="/user/mypage_userEdit">회원정보수정</a>
            </li>
            <li>
              <a href="">내가 쓴 글</a>
            </li>
            <li>
              <a href="/user/mypage_point">적립금</a>
            </li>
            <li>
              <a href="/user/mypage_heart" class="option_active">좋아요</a>
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
              ><strong class="">작성한 리뷰</strong><span class="">1</span></a
            >
          </li>
        </ul>

      <div class="mypage_right_element">
        <!-- 여기에 페이지에 맞는 요소 넣으면 됨 -->
        <div class="heart_tabmenu">
          <ul>
            <li class="heart_on_tab" onclick="reviewTab('tab1')">GOODS<span>(930)</span></li>
            <li onclick="reviewTab('tab2')">ANIMATION<span>(0)</span></li>
            <!---->
          </ul>
        </div>
        <div class="on" id="tab1">
          <ul class="goods_list_all">
            <li class="goods_list_li">
              <div class="prd_b">
                <a>
                  <div class="goods_img_bx">
                    <img src="/img/main_img/goods1.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="goods_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                    <p>24,000원</p>
                  </div>
                </a>
              </div>
            </li>
            <li class="goods_list_li">
              <div class="prd_b">
                <a>
                  <div class="goods_img_bx">
                    <img src="/img/main_img/goods1.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="goods_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                    <p>24,000원</p>
                  </div>
                </a>
              </div>
            </li>
            <li class="goods_list_li">
              <div class="prd_b">
                <a>
                  <div class="goods_img_bx">
                    <img src="/img/main_img/goods1.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="goods_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                    <p>24,000원</p>
                  </div>
                </a>
              </div>
            </li>
            <li class="goods_list_li">
              <div class="prd_b">
                <a>
                  <div class="goods_img_bx">
                    <img src="/img/main_img/goods1.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="goods_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                    <p>24,000원</p>
                  </div>
                </a>
              </div>
            </li>
            <li class="goods_list_li">
              <div class="prd_b">
                <a>
                  <div class="goods_img_bx">
                    <img src="/img/main_img/goods1.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="goods_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                    <p>24,000원</p>
                  </div>
                </a>
              </div>
            </li>
          </ul>
        </div>
        <!-- 애니 -->
        <div class="off" id="tab2">
          <ul class="ani_list_all">
            <li class="ani_list_li">
              <div class="prd_b">
                <a>
                  <div class="ani_img_bx">
                    <img src="/img/main_img/anipost3.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="ani_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                  </div>
                </a>
              </div>
            </li>
            <li class="ani_list_li">
              <div class="prd_b">
                <a>
                  <div class="ani_img_bx">
                    <img src="/img/main_img/anipost3.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="ani_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                  </div>
                </a>
              </div>
            </li>
            <li class="ani_list_li">
              <div class="prd_b">
                <a>
                  <div class="ani_img_bx">
                    <img src="/img/main_img/anipost3.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="ani_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                  </div>
                </a>
              </div>
            </li>
            <li class="ani_list_li">
              <div class="prd_b">
                <a>
                  <div class="ani_img_bx">
                    <img src="/img/main_img/anipost3.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="ani_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                  </div>
                </a>
              </div>
            </li>
            <li class="ani_list_li">
              <div class="prd_b">
                <a>
                  <div class="ani_img_bx">
                    <img src="/img/main_img/anipost3.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="ani_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                  </div>
                </a>
              </div>
            </li>
            <li class="ani_list_li">
              <div class="prd_b">
                <a>
                  <div class="ani_img_bx">
                    <img src="/img/main_img/anipost3.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="ani_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                  </div>
                </a>
              </div>
            </li>
            <li class="ani_list_li">
              <div class="prd_b">
                <a>
                  <div class="ani_img_bx">
                    <img src="/img/main_img/anipost3.png" />
                    <div class="heart_state"><i class="fa-solid fa-heart"></i></div>
                  </div>
                  <div class="ani_imform">
                    <strong>[나혼자만 레벨업] 포스터 세트 굿즈</strong>
                  </div>
                </a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

