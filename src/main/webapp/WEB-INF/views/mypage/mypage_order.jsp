<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/page_header.jspf"%>

<link rel="stylesheet" href="/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="/css/mypage_order.css" type="text/css" />

<div class="mypage_wrap">
  <div class="mypage_main_wrap">
    <div class="mypage_left">
      <a href="/user/mypage" class="mypage_home">MY PAGE</a>
      <section class="mypage_menu">
          <h3>나의 쇼핑정보</h3>
          <ul>
            <li>
              <a href="/user/mypage_order" class="option_active">주문배송조회</a>
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
              <a href="/user/mypage_heart">좋아요</a>
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
        <div class="mypage_order_list_all">
          <h4 class="my_tit">주문배송조회</h4>
          <div>
            <div class="mypage_order_list">
              <div class="order_list_top">
                <div class="pro_inform">상품정보</div>
                <div class="delivery_fee">배송비</div>
                <div class="progress_status">진행상태</div>
              </div>
              <ol class="order_list_bottom">
                <li class="order_list_li">
                  <div class="order_date_num">
                    <a href=""><span>주문일자 </span>2023-04-10</a>
                    <a href=""><span>주문번호 </span>ORD20230410-1261116</a>
                  </div>
                  <ul>
                    <li>
                      <ul>
                        <li class="order_data_list_one">
                          <a href="">
                            <div class="order_data_inform">
                              <div class="order_data_img"><img src="https://img.29cm.co.kr/item/202407/11ef4816869b278989fb1114c15fa422.jpg?width=80" /></div>
                              <div>
                                <p class="order_pro_name">WOMAN GNRL 에센셜 베이직 가디건 [GREY] / WBC1L04504</p>
                                <ul class="order_pro_option">
                                  <li>[COLOR:SIZE]GREY:S</li>
                                  <li>40,000원 / 수량 1개</li>
                                </ul>
                              </div>
                            </div>
                          </a>
                          <div class="order_delivery_fee_data">무료배송</div>
                          <div class="order_state_div">
                            <div>
                              <div class="order_state_all">
                                <p class="order_state_data">구매확정</p>
                                <p class="order_state_okdate">2023.04.21</p>
                              </div>
                              <button class="order_package">CJ대한통운 <span>571223585731</span></button>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li class="order_list_li">
                  <div class="order_date_num">
                    <a href=""><span>주문일자 </span>2023-04-10</a>
                    <a href=""><span>주문번호 </span>ORD20230410-1261116</a>
                  </div>
                  <ul>
                    <li>
                      <ul>
                        <li class="order_data_list_one">
                          <a href="">
                            <div class="order_data_inform">
                              <div class="order_data_img"><img src="https://img.29cm.co.kr/item/202407/11ef4816869b278989fb1114c15fa422.jpg?width=80" /></div>
                              <div>
                                <p class="order_pro_name">WOMAN GNRL 에센셜 베이직 가디건 [GREY] / WBC1L04504</p>
                                <ul class="order_pro_option">
                                  <li>[COLOR:SIZE]GREY:S</li>
                                  <li>40,000원 / 수량 1개</li>
                                </ul>
                              </div>
                            </div>
                          </a>
                          <div class="order_delivery_fee_data">무료배송</div>
                          <div class="order_state_div">
                            <div>
                              <div class="order_state_all">
                                <p class="order_state_data">구매확정</p>
                                <p class="order_state_okdate">2023.04.21</p>
                              </div>
                              <button class="order_package">CJ대한통운 <span>571223585731</span></button>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ol>
            </div>
          </div>

          <div style="margin-top: 90px">
            <h4 class="my_tit">주문상태 및 취소기간 안내</h4>
            <ol class="order_notification">
              <li class="order_notification_li">
                <strong class="order_notification_strong">
                  <span>결제완료</span>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 42 80">
                    <g fill="none" fill-rule="evenodd" stroke="#000000" stroke-width="3"><path d="M1 0l40 40.083L1.166 80"></path></g>
                  </svg>
                </strong>
                <p>입금(결제) 확인이 완료되었습니다</p>
              </li>
              <li class="order_notification_li">
                <strong class="order_notification_strong">
                  <span>상품준비중</span>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 42 80">
                    <g fill="none" fill-rule="evenodd" stroke="#000000" stroke-width="3"><path d="M1 0l40 40.083L1.166 80"></path></g>
                  </svg>
                </strong>
                <p>주문하신 상품을 발송할 예정입니다</p>
              </li>
              <li class="order_notification_li">
                <strong class="order_notification_strong">
                  <span>배송시작</span>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 42 80">
                    <g fill="none" fill-rule="evenodd" stroke="#000000" stroke-width="3"><path d="M1 0l40 40.083L1.166 80"></path></g>
                  </svg>
                </strong>
                <p>상품준비가 완료되어 곧 배송 될 예정입니다</p>
              </li>
              <li class="order_notification_li">
                <strong class="order_notification_strong">
                  <span>배송중</span>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 42 80">
                    <g fill="none" fill-rule="evenodd" stroke="#000000" stroke-width="3"><path d="M1 0l40 40.083L1.166 80"></path></g>
                  </svg>
                </strong>
                <p>상품이 고객님께 배송중입니다</p>
              </li>
              <li class="order_notification_li">
                <strong class="order_notification_strong">
                  <span>배송완료</span>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 42 80">
                    <g fill="none" fill-rule="evenodd" stroke="#000000" stroke-width="3"><path d="M1 0l40 40.083L1.166 80"></path></g>
                  </svg>
                </strong>
                <p>상품이 주문자에게 전달완료 되었습니다</p>
              </li>
              <li class="order_notification_li">
                <strong class="order_notification_strong">
                  <span>구매확정</span>
                </strong>
                <p>구매를 확정하여 적립금 및 리뷰작성을 할 수 있습니다</p>
              </li>
            </ol>
            <div class="order_delCheck">
              <p class="del_possible">직접취소가능</p>
              <p class="del_impossible">취소불가</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

