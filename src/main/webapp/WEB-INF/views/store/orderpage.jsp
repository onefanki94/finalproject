<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/store_header.jspf"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://js.tosspayments.com/v2/standard"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/daum_api.js"></script>
<script src="/js/orderpage.js"></script>
<link rel="stylesheet" href="/css/order.css" type="text/css" />

<div class="order_container">
  <div class="order_progress">
    <ol>
      <li>
        01 SHOPPING BAG
        <i class="fa-solid fa-chevron-right"></i>
      </li>
      <li>
        02 ORDER
        <i class="fa-solid fa-chevron-right"></i>
      </li>
      <li>03 ORDER CONFIRMED</li>
    </ol>
  </div>
  <div class="order_pay">
    <div class="order_pay_left">
      <div class="order_proinfo">
        <div class="order_proinfo_tit">
          <h2>주문 상품 정보</h2>
        </div>
        <ul>
        <c:forEach var="orderProduct" items="${orderList}">
            <li>
                <div class="order_product_li">
                  <div class="order_product_img">
                    <img src="http://192.168.1.92:8000/${orderProduct.thumImg}" />
                  </div>
                  <div class="order_product_info">
                    <div class="order_product_info_detail">
                      <div class="order_product_info_tit">
                        <p class="ani_title_p">${orderProduct.ani_title}</p>
                        <a href="#">${orderProduct.title}</a>
                      </div>
                      <div class="order_product_info_price">
                        <span class="order_product_price" data-price="${orderProduct.price}"></span>원
                      </div>
                      <div class="order_product_info_amount">수량 : <span class="order_product_amount" data-amount="${orderProduct.amount}">${orderProduct.amount}</span></div>
                    </div>
                    <div class="order_product_info_total">
                      <span class="order_product_totalPrice"></span>원
                    </div>
                  </div>
                </div>
            </li>
        </c:forEach>
        </ul>
      </div>
      <div class="order_addr">
        <div class="order_addr_tit">
          <h2>배송 정보</h2>
        </div>
        <div class="order_addr_info">
          <div class="order_div">
            <h2>수령인 *</h2>
            <div class="order_recipient">
              <input type="text" name="recipient" id="recipient" />
            </div>
          </div>
          <div class="order_div">
            <h2>배송지 *</h2>
            <div class="order_addr_div">
              <div>
                <input type="text" name="zipcode" id="zipcode" />
                <button onclick="daumPostcode()">우편번호 찾기</button>
              </div>
              <input type="text" name="addr1" id="addr" />
              <input type="text" name="addr2" id="addrdetail" placeholder="상세주소를 입력해주세요." />
            </div>
          </div>
          <div class="order_div">
            <h2>전화번호 *</h2>
            <div class="order_tel_div">
              <select name="tel1" id="tel1">
                <option value="010">010</option>
                <option value="02">02</option>
                <option value="070">070</option>
              </select>
              <span>-</span>
              <input type="text" id="tel2" name="tel2" />
              <span>-</span>
              <input type="text" id="tel3" name="tel3" />
            </div>
          </div>
          <div class="order_div">
            <h2>배송 요청사항</h2>
            <textarea class="delivery_requestmemo" id="request_memo"></textarea>
          </div>
        </div>
      </div>
      <div class="order_point">
        <div class="order_point_tit">
          <h2>적립금 사용</h2>
        </div>
        <div class="order_point_div">
          <div>
            <h2>사용 금액 입력</h2>
            <div>
              <div class="order_point_usediv">
                <div>
                  <label><input id="order_use_point" type="text" value="0" /></label>
                </div>
                <button type="button">
                  <span>모두 사용</span>
                </button>
              </div>
              <span class="use_point">
                사용 가능
                <em>${order.user_point}P</em>
                /
                <span>
                  보유
                  <em>${order.user_point}</em>
                </span>
              </span>
            </div>
          </div>
        </div>
      </div>
      <div class="order_payment">
        <div class="order_payment_tit">
          <h2>결제방법</h2>
        </div>
        <div class="order_payment_div">
          <input type="checkbox" id="chk_payment" name="payment_card" />
          <label id="order_payment_label" for="chk_payment"><i class="fa-regular fa-credit-card"></i>신용카드</label>
        </div>
      </div>
    </div>
    <div class="order_pay_right">
      <h3>결제 정보</h3>
      <dl>
        <dt>주문상품금액</dt>
        <dd class="order_proAll_price"></dd>
      </dl>
      <dl>
        <dt>배송비</dt>
        <dd class="order_fee"></dd>
      </dl>
      <dl class="point">
        <dt>적립금 사용</dt>
        <dd>-0P</dd>
      </dl>
      <dl class="total_price">
        <dt>총 결제 예정 금액</dt>
        <dd class="total_payPrice"></dd>
        <input type="hidden" id="total_payPrice" name="total_payPrice">
      </dl>
      <dl class="spoint">
        <dt>적립 예정 금액</dt>
        <dd class="point_accumulated"></dd>
      </dl>
      <dl class="agree">
        <dt>주문동의</dt>
        <dd>주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하시겠습니까?(전자상거래법 제8조 제2항)<br /><br />굿즈 상품은 상황에 따라 교환/반품이 불가능할 수 있는 점을 충분히 숙지하였습니다.</dd>
        <dd class="check_wrap"><input type="checkbox" id="chk_agree" name="agreement" /><label for="chk_agree">동의합니다</label></dd>
      </dl>
      <div class="btn_wp"><button type="button" id="payBtn" class="payment_btn">결제하기</button></div>
    </div>
  </div>
</div>

<script>
    // JSP에서 서버 변수를 자바스크립트 전역 변수로 설정
    var order_idx = ${order_idx};
    var orderList = ${orderList};
</script>
<script src="/js/tosspayments.js"></script>

