<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/store_header.jspf"%>

<link rel="stylesheet" href="/css/shoping_bag.css" type="text/css" />
<script src="/js/shopping_bag.js"></script>

<div class="shoping_basket_container">
  <div class="shoping_basket_progress">
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
  <div class="shoping_basket_product">
    <div class="basket_product_list_div">
      <div class="basket_list_top">
        <div class="basket_list_all_chkbx">
          <input type="checkbox" id="all_chk_product" name="all_chk_product" checked/>
          <label for="all_chk_product" class="checkedLabel"></label>
        </div>
        <div class="bascket_menu_proinfo">상품 정보</div>
        <div class="bascket_menu_amount">수량</div>
        <div class="bascket_menu_price">가격</div>
        <div class="bascket_menu_fee">배송비</div>
      </div>
      <ul id="bascket_product_ul">

      </ul>
    </div>
    <div class="product_del_btn_div">
      <div>
          <button class="product_del_btn" type="button" id="choice_delBtn">선택상품 삭제</button>
          <button class="product_del_btn" type="button" id="all_delBtn">전체상품 삭제</button>
      </div>
    </div>
  </div>
  <div class="basket_price_all_div">
    <div>
      <div class="basket_price_all_div_top">
        <div>총 주문금액</div>
        <div>총 배송비</div>
        <div>총 결제금액</div>
      </div>
      <div class="basket_price_all_div_bottom">
        <div>
          <span>
            <strong id="total_order_amount"></strong>원
          </span>
        </div>
        <div>
          <i></i><span><strong id="fee_order_amount"></strong>원</span>
        </div>
        <div>
          <i></i><span><strong id="total_payment_amount"></strong>원</span>
          <input type="hidden" id="total_payAmount" name="total_payAmount">
        </div>
      </div>
    </div>
  </div>
  <div class="basket_btn_div"><a href="/storeMain">쇼핑 계속하기</a><button id="buy_btn_all" type="button">구매하기</button></div>
</div>

<%@include file="/WEB-INF/inc/store_footer.jspf"%>