<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/store_header.jspf"%>


<link rel="stylesheet" href="/css/orderOK.css" type="text/css" />

<div class="payOk_container">
  <div class="payOk_progress">
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
  <div class="payOk_ticketDiv">
    <div class="payOk_ticketDiv_left">
      <div class="payOk_ticketDiv_success">
        <h2>주문이 완료되었습니다.</h2>
      </div>
      <p>
        주문번호
        <strong>ORD20241010-0034117</strong>
      </p>
      <p>A GOODS SHOP FOR YOR "ANIWAVE"</p>
      <p>ANIWAVE.COM</p>
    </div>
    <div class="payOk_ticketDiv_right">
      <div class="ticketDiv_box_top_left"></div>
      <div class="ticketDiv_box_top_right"></div>
      <div class="ticketDiv_box_bottom_left"></div>
      <div class="ticketDiv_box_bottom_right"></div>
      <div></div>
    </div>
  </div>
  <div class="pay_product_section">
    <h3>주문상품정보</h3>
    <div class="pay_product_table">
      <ul>
        <li class="pay_product_table_head">
          <div>주문 상품</div>
          <div>배송비</div>
          <div>진행상태</div>
        </li>
        <li class="pay_product_table_data">
          <div class="pay_product_table_data_info">
            <a>
              <img src="/img/main_img/goods1.png" />
              <div>
                <p>나혼자만 레벨업</p>
                <h3>[도망을 잘 치는 도련님] 인형 시즈쿠</h3>
                <p>88,000원 / 수량 1개</p>
              </div>
            </a>
          </div>
          <div class="pay_product_table_data_info">무료</div>
          <div class="pay_product_table_data_info">결제 완료</div>
        </li>
      </ul>
    </div>
  </div>
  <div class="pay_info_section">
    <h3>결제정보</h3>
    <div class="pay_info_table">
      <table>
        <tbody>
          <tr>
            <th>결제방법</th>
            <td>신용/체크카드</td>
          </tr>
          <tr>
            <th>주문상태</th>
            <td>결제완료</td>
          </tr>
          <tr>
            <th>주문접수일시</th>
            <td>2024-10-10 16:05</td>
          </tr>
          <tr>
            <th>결제완료일시</th>
            <td>2024-10-10 16:05</td>
          </tr>
          <tr>
            <th>배송비</th>
            <td>무료배송</td>
          </tr>
          <tr>
            <th>적립금 사용금액</th>
            <td>2,400원</td>
          </tr>
          <tr>
            <th>결제금액</th>
            <td>88,000원</td>
          </tr>
          <tr>
            <th>영수증</th>
            <td><button>영수증 출력</button></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="pay_delivery_section">
    <h3>배송정보</h3>
    <div class="pay_delivery_table">
      <table>
        <tbody>
          <tr>
            <th>받으시는 분</th>
            <td>김채원</td>
          </tr>
          <tr>
            <th>휴대폰번호</th>
            <td>010-8991-9506</td>
          </tr>
          <tr>
            <th>주소</th>
            <td>03393 서울특별시 은평구 역말로 123-13 한빛월드빌 202호</td>
          </tr>
          <tr>
            <th>배송요청사항</th>
            <td>부재시 문앞에 놓아주세요.</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="page_info">
    <p>상세내역은 마이페이지에서 확인하실 수 있습니다.</p>
  </div>
  <div class="btn_div">
    <a>계속 쇼핑하기</a>
    <button>주문 상세보기</button>
  </div>
</div>

