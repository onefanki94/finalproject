<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/page_header.jspf"%>

<link rel="stylesheet" href="/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="/css/mypage_main.css" type="text/css" />

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
              ><strong class="">작성한 리뷰</strong><span class="">1</span></a
            >
          </li>
        </ul>

      <div class="mypage_right_element">
        <!-- 여기에 페이지에 맞는 요소 넣으면 됨 -->
        <div class="my_order">
          <h3 class="my_tit">최근 주문</h3>
          <ul class="my_order_tbl">
            <li class="my_order_tit">
              <div class="my_tbl">
                <div class="date">주문일</div>
                <div class="history history_top">주문내역</div>
                <div class="num">주문번호</div>
                <div class="amount">결제금액</div>
              </div>
            </li>
            <li>
              <a class="my_tbl" href="/mypage/my-order/detail/19047612">
                <div class="date">2023.04.10</div>
                <div class="history">
                  <div class="imgbx">
                    <div class="imgin">
                      <img src="//img.29cm.co.kr/next-product/2023/01/17/5a4d2780ccab4003b1d0913495616071_20230117174147.jpg?width=300" />
                    </div>
                  </div>
                  <div class="prd_order">
                    <div class="prd_order_flex">
                      <div class="prd_order_in">
                        <em class="elp">
                          <span>WOMAN GNRL 에센셜 베이직 가디건 [GREY]</span>
                        </em>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="num">ORD20230410-1261116</div>
                <div class="amount">35,436원</div>
              </a>
            </li>
            <li>
              <a class="my_tbl" href="/mypage/my-order/detail/19047612">
                <div class="date">2023.04.10</div>
                <div class="history">
                  <div class="imgbx">
                    <div class="imgin">
                      <img src="//img.29cm.co.kr/next-product/2023/01/17/5a4d2780ccab4003b1d0913495616071_20230117174147.jpg?width=300" />
                    </div>
                  </div>
                  <div class="prd_order">
                    <div class="prd_order_flex">
                      <div class="prd_order_in">
                        <em class="elp">
                          <span>WOMAN GNRL 에센셜 베이직 가디건 [GREY]</span>
                        </em>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="num">ORD20230410-1261116</div>
                <div class="amount">35,436원</div>
              </a>
            </li>
            <li>
              <a class="my_tbl" href="/mypage/my-order/detail/19047612">
                <div class="date">2023.04.10</div>
                <div class="history">
                  <div class="imgbx">
                    <div class="imgin">
                      <img src="//img.29cm.co.kr/next-product/2023/01/17/5a4d2780ccab4003b1d0913495616071_20230117174147.jpg?width=300" />
                    </div>
                  </div>
                  <div class="prd_order">
                    <div class="prd_order_flex">
                      <div class="prd_order_in">
                        <em class="elp">
                          <span>WOMAN GNRL 에센셜 베이직 가디건 [GREY]</span>
                        </em>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="num">ORD20230410-1261116</div>
                <div class="amount">35,436원</div>
              </a>
            </li>
          </ul>
          <a class="btn_my_more" href="">더보기</a>
        </div>

        <div class="split_wrap">
          <div class="my_heart">
            <h3 class="my_tit">MY HEART</h3>

            <div class="heart_artwrap">
              <h4 class="h_tit">Goods</h4>
              <ul class="heart_lst">
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="//img.29cm.co.kr/item/202408/11ef64473ac1ce0d8362cfe25427e5f1.jpg?width=600" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="//img.29cm.co.kr/item/202408/11ef64473ac1ce0d8362cfe25427e5f1.jpg?width=600" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="//img.29cm.co.kr/item/202408/11ef64473ac1ce0d8362cfe25427e5f1.jpg?width=600" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="//img.29cm.co.kr/item/202408/11ef64473ac1ce0d8362cfe25427e5f1.jpg?width=600" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="//img.29cm.co.kr/item/202408/11ef64473ac1ce0d8362cfe25427e5f1.jpg?width=600" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
              </ul>
            </div>

            <div class="heart_artwrap">
              <h4 class="h_tit">Animation</h4>
              <ul class="heart_lst">
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="/img/main_img/anipost1.png" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="/img/main_img/anipost1.png" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="/img/main_img/anipost1.png" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="/img/main_img/anipost1.png" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
                <li>
                  <a href="" style="color: #5d5d5d">
                    <div class="imgbx">
                      <div class="imgin">
                        <img src="/img/main_img/anipost1.png" />
                      </div>
                    </div>
                    <p class="txt">[29EDITION] Ditto Shoulder Bag 디토 숄더백 / 레드 와인</p>
                  </a>
                </li>
              </ul>
              <div class="order_list_none">
                <p>애니 좋아요 내역이 없습니다</p>
              </div>
              <ul class="heart_lst"></ul>
            </div>
            <a class="btn_my_more" href="">더보기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

