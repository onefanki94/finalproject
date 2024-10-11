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
          <label
            data-scope="checkbox"
            data-part="root"
            data-state="checked"
            id="bascket_all_checkbox"
            for="bascket_all_checkbox_hidden"
            position="topLeft"
            width="default"
            class="bascket_all_checkbox"
            ><div
              data-scope="checkbox"
              data-part="control"
              data-state="checked"
              id="bascket_all_checkbox_control"
              aria-hidden="true"
              class="bascket_all_checkbox_control"
            >
              <svg
                width="20px"
                height="20px"
                viewBox="0 0 24 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M20.6303 6.49266L10.6975 19.2009L3.43756 12.0235L4.56245 10.8856L10.5439 16.7991L19.3697 5.50735L20.6303 6.49266Z"
                  fill="#a0a0a0"
                ></path>
              </svg>
            </div>
            <input
              id="bascket_all_checkbox_hidden"
              type="checkbox"
              aria-labelledby="bascket_all_checkbox_label"
              value="1"
              checked=""
              style="
                border: 0px;
                clip: rect(0px, 0px, 0px, 0px);
                height: 1px;
                margin: -1px;
                overflow: hidden;
                padding: 0px;
                position: absolute;
                width: 1px;
                white-space: nowrap;
                overflow-wrap: normal;
              " />
            <span
              data-scope="checkbox"
              data-part="label"
              data-state="checked"
              id="bascket_all_checkbox_label"
              class="bascket_all_checkbox_label"
            ></span
          ></label>
        </div>
        <div class="bascket_menu_proinfo">상품 정보</div>
        <div class="bascket_menu_amount">수량</div>
        <div class="bascket_menu_price">가격</div>
        <div class="bascket_menu_fee">배송비</div>
      </div>
      <ul>
        <li class="bascket_product_li">
          <div class="basket_list_li_chkbx">
            <label
              data-scope="checkbox"
              data-part="root"
              data-state="checked"
              id="checkbox::r2:"
              for="checkbox::r2::hidden"
              position="topLeft"
              width="default"
              class="bascket_all_checkbox"
              ><div
                data-scope="checkbox"
                data-part="control"
                data-state="checked"
                id="checkbox::r2::control"
                aria-hidden="true"
                class="bascket_all_checkbox_control"
              >
                <svg
                  width="20px"
                  height="20px"
                  viewBox="0 0 24 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M20.6303 6.49266L10.6975 19.2009L3.43756 12.0235L4.56245 10.8856L10.5439 16.7991L19.3697 5.50735L20.6303 6.49266Z"
                    fill="#a0a0a0"
                  ></path>
                </svg>
              </div>
              <input
                id="checkbox::r2::hidden"
                type="checkbox"
                aria-labelledby="checkbox::r2::label"
                value="on"
                checked=""
                style="
                  border: 0px;
                  clip: rect(0px, 0px, 0px, 0px);
                  height: 1px;
                  margin: -1px;
                  overflow: hidden;
                  padding: 0px;
                  position: absolute;
                  width: 1px;
                  white-space: nowrap;
                  overflow-wrap: normal;
                " /><span
                data-scope="checkbox"
                data-part="label"
                data-state="checked"
                id="checkbox::r2::label"
                class="bascket_all_checkbox_label"
              ></span
            ></label>
          </div>
          <div class="basket_list_li_proinfo_div">
            <div class="basket_list_li_proinfo">
              <a href=""
                ><img
                  src="https://img.29cm.co.kr/next-product/2024/08/12/3974e484d3d64d2a9c8c9317cb0fed47_20240812153631.jpg?width=150"
              /></a>
              <div class="basket_list_proinfo_detail">
                <a class="basket_list_protitle" href="#"
                  >[예약배송]Cotton stripe base collar polo t-shirt_Navy</a
                >
                <div class="basket_list_proprice">
                  <span>89,000원</span>
                </div>
              </div>
            </div>
            <button class="bascket_del_btn" type="button"></button>
          </div>
          <div class="basket_list_li_amount_div">
            <div>
              <div>
                <button
                  id="del_product_btn"
                  class="basket_list_amount_del"
                  type="button"
                >
                  -</button
                ><input
                  class="basket_list_amount"
                  autocapitalize="none"
                  id="number_of_products"
                  type="text"
                  inputmode="numeric"
                  value="1"
                /><button
                  id="add_product_btn"
                  class="basket_list_amount_add"
                  type="button"
                >
                  +
                </button>
              </div>
            </div>
          </div>
          <div class="basket_list_li_price_div">
            <div><span>84,550</span>원</div>
            <div class="basket_list_buy_btn_div">
              <button class="edes2n119 css-1z3id8 ejv90e57" type="button">
                <span
                  class="ruler-button-text css-mfi8cj ejv90e50"
                  color="onColor"
                  >구매하기</span
                >
              </button>
            </div>
          </div>
          <div class="basket_list_li_fee_div">
            3,000원
            <p>150,000원 이상 구매시 무료배송됩니다.</p>
          </div>
        </li>
      </ul>
    </div>
    <div class="product_del_btn_div">
      <div>
        <button class="product_del_btn" type="button">선택상품 삭제</button
        ><button class="product_del_btn" type="button">
          품절상품 삭제
        </button>
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
          <span><strong id="total_order_amount">84,550</strong>원</span
          ><span id="number_of_order_products">총 1개</span>
        </div>
        <div>
          <i></i><span><strong>3,300</strong>원</span>
        </div>
        <div>
          <i></i><span><strong>87,850</strong>원</span>
        </div>
      </div>
    </div>
  </div>
  <div class="basket_btn_div">
    <a href="#">쇼핑 계속하기</a
    ><button id="buy_btn" type="button">구매하기</button>
  </div>
</div>

<%@include file="/WEB-INF/inc/store_footer.jspf"%>