<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/store_header.jspf"%>

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
          <li>
            <div class="order_product_li">
              <div class="order_product_img">
                <img
                  src="https://img.29cm.co.kr/item/202409/11ef6a6bfe7c7a14a980adf1df7d5bb0.jpg?width=300"
                />
              </div>
              <div class="order_product_info">
                <div class="order_product_info_detail">
                  <div class="order_product_info_tit">
                    <a href="#">Plan L/S Tee (4 Colors)</a>
                  </div>
                  <div class="order_product_info_price">
                    <span>65,000원</span>
                  </div>
                  <div class="order_product_info_amount">
                    수량 : <span>1</span>
                  </div>
                </div>
                <div class="order_product_info_total">
                  <span>주문 금액 : 65,000원</span>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="order_product_li">
              <div class="order_product_img">
                <img
                  src="https://img.29cm.co.kr/item/202409/11ef6a6bfe7c7a14a980adf1df7d5bb0.jpg?width=300"
                />
              </div>
              <div class="order_product_info">
                <div class="order_product_info_detail">
                  <div class="order_product_info_tit">
                    <a href="#">Plan L/S Tee (4 Colors)</a>
                  </div>
                  <div class="order_product_info_price">
                    <span>65,000원</span>
                  </div>
                  <div class="order_product_info_amount">
                    수량 : <span>1</span>
                  </div>
                </div>
                <div class="order_product_info_total">
                  <span>주문 금액 : 65,000원</span>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <div class="order_addr">
        <div class="order_addr_tit">
          <h2>배송 정보</h2>
        </div>
        <div class="order_addr_info">
          <div class="order_div">
            <h2>수령인</h2>
            <div class="order_recipient">
              <input type="text" name="recipient" id="recipient" />
            </div>
          </div>
          <div class="order_div">
            <h2>배송지</h2>
            <div class="order_addr_div">
              <div>
                <input type="text" name="zipcode" id="zipcode" />
                <button>우편번호 찾기</button>
              </div>
              <input type="text" name="addr1" id="addr1" />
              <input
                type="text"
                name="addr2"
                id="addr2"
                placeholder="상세주소를 입력해주세요."
              />
            </div>
          </div>
          <div class="order_div">
            <h2>전화번호</h2>
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
              <input type="hidden" id="tel" name="tel" />
            </div>
          </div>
          <div class="order_div">
            <h2>배송 요청사항</h2>
            <textarea class="delivery_requestmemo"></textarea>
          </div>
        </div>
      </div>
      <div class="order_point">
        <div class="order_point_tit">
          <h2>적립금 사용</h2>
        </div>
        <div class="css-bc460x e1qmh2620">
          <div class="css-klnuo1 e1qmh2621">
            <h2 class="e1qmh2622 css-n0cpi0 ejv90e50" color="secondary">
              사용 금액 입력
            </h2>
            <div class="css-ym9sku e1qmh2623">
              <div class="css-cvis2 e1qmh2624">
                <div class="css-1axl4gh ejv90e529">
                  <label class="css-8hdaxb ejv90e530"
                    ><input
                      type="numeric"
                      class="css-1cyeafc ejv90e531"
                      value="0"
                  /></label>
                </div>
                <button class="e1qmh2626 css-asx8mm ejv90e57" type="button">
                  <span
                    class="ruler-button-text css-izpnhq ejv90e50"
                    color="primary"
                    >모두 사용</span
                  >
                </button>
              </div>
              <span class="e1qmh2627 css-lxsjav ejv90e50" color="primary"
                >사용 가능 <em class="css-35ezg3 e1qmh2628">360P</em> /
                <span class="css-tbvf2 ejv90e50" color="tertiary"
                  >보유 <em class="css-35ezg3 e1qmh2628">360P</em
                  ><button type="button" class="css-8np7i5 e1qmh2629">
                    ?
                  </button></span
                ></span
              >
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="order_pay_right"></div>
  </div>
</div>

