<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/page_header.jspf"%>

<link rel="stylesheet" href="/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<link rel="stylesheet" href="/css/mypage_review.css" type="text/css" />
<script src="/js/mypage_review.js"></script>

<div class="mypage_wrap">
  <div class="mypage_main_wrap">
    <div class="mypage_left">
      <p class="mypage_home">MY PAGE</p>
      <section class="mypage_menu">
          <h3>나의 쇼핑정보</h3>
          <ul>
            <li>
              <a href="/user/mypage_order">주문배송조회</a>
            </li>
            <li>
              <a href="/user/mypage_review" class="option_active"> 상품 리뷰 </a>
            </li>
          </ul>
          <h3>나의 계정설정</h3>
          <ul>
            <li>
              <a href="">회원정보수정</a>
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
              <a href="">회원탈퇴</a>
            </li>
          </ul>
          <h3>고객센터</h3>
          <ul>
            <li>
              <a href="">1:1 문의</a>
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
          <a class="atag_css" href=""><strong>회원정보</strong><span>sing2727 님</span></a>
        </li>
        <li class="user_retention_details">
          <a class="atag_css" href=""><strong class="">적립금</strong><span class="">360</span></a>
        </li>
        <li class="user_retention_details">
          <a class="atag_css" href=""><strong class="">작성한 리뷰</strong><span class="">1</span></a>
        </li>
      </ul>

      <div class="mypage_right_element">
        <!-- 여기에 페이지에 맞는 요소 넣으면 됨 -->
        <div class="on" id="tab1">
          <ul class="review_tabmenu">
            <li class="tab_activate" onclick="reviewTab('tab1')">작성 가능한 리뷰 (0)</li>
            <li class="tab_deactivate" onclick="reviewTab('tab2')">내 리뷰 (0)</li>
          </ul>
          <div class="review_list_all">
            <div>
              <ul class="review_list_ul">
                <li class="review_list_li">
                  <div class="review_list_li_one">
                    <div class="review_list_li_one_detail">
                      <div class="review_product">
                        <a href="">
                          <img src="https://img.29cm.co.kr/next-product/2023/05/21/316fdd4c0e7d435eb7da6203446089f9_20230521232826.jpg?width=300" class="review_product_img" />
                        </a>
                        <div class="review_product_inform">
                          <a href="">
                            <strong>안티버그 쿨링 끈나시(스트라이프 레드)</strong>
                            <p>40,000원 / 수량 1개</p>
                          </a>
                        </div>
                      </div>
                      <span class="order_state_date"><span>구매확정</span><br />2024.07.04</span>
                      <div><button class="review_write_btn" type="button">리뷰쓰기</button></div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="off" id="tab2">
          <ul class="review_tabmenu">
            <li class="tab_deactivate" onclick="reviewTab('tab1')">작성 가능한 리뷰 (0)</li>
            <li class="tab_activate" onclick="reviewTab('tab2')">내 리뷰 (0)</li>
          </ul>
          <div class="review_list_all">
            <div>
              <ul class="review_list_ul">
                <li class="user_review_list_li">
                  <div class="review_write_list">
                    <a href="">
                      <img src="https://img.29cm.co.kr/item/202406/11ef218988ba951fbb1495f64762431d.jpg?width=100" class="css-1d5qj71 egc1z4c3" />
                      <div class="review_write_list_inform">
                        <strong>안티버그 쿨링 끈나시(스트라이프 레드)</strong>
                        <div>
                          <i class="fa-solid fa-star"></i>
                          <i class="fa-solid fa-star"></i>
                          <i class="fa-solid fa-star"></i>
                          <i class="fa-solid fa-star"></i>
                          <i class="fa-solid fa-star"></i>
                        </div>
                      </div>
                    </a>
                    <div class="review_txt">
                      <p class="css-x6fpam e1g90c62" font-size="14">굽 있는 샌들 치고 착화감이 너무 좋고 푹신해요! 그런데 제가 발등이 높은 편이라 그런지 정사이즈에 살짝 작은 느낌이 있었습니다~ 디자인은 너무 예뻐용</p>
                    </div>
                    <div class="review_img">
                      <img src="https://img.29cm.co.kr/next-product/2024/08/24/cce018f5c64441819e837477c6e360c2_20240824011502.jpeg?width=200" />
                    </div>
                  </div>
                  <div class="review_regDT">
                    <p>2024.08.24</p>
                  </div>
                  <div class="review_modi_del_btn">
                    <div>
                      <button type="button">수정</button>
                      <button type="button">삭제</button>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

