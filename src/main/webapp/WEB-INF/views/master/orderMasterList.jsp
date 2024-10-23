<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 주문 내역 리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<!-- 채원 -->
<link href="/css/chaewon_master.css" rel="stylesheet" type="text/css" />
<script src="/js/chaewon_master_orderPage.js"></script>

<h2 class="order_list_h2">주문 내역 리스트</h2>
<div class="filterAll">
    <!-- 주문 상태 필터 -->
    <div class="order-status-summary d-flex justify-content-center mb-3">
        <span>신규주문 : &nbsp;<strong id="new-count">${orderStateCount.newOrders}</strong> 건</span>
        <span>상품준비 : &nbsp;<strong id="preparing-count">${orderStateCount.preparingOrders}</strong> 건</span>
        <span>배송중 : &nbsp;<strong id="shipping-count">${orderStateCount.inTransitOrders}</strong> 건</span>
        <span>배송완료 : &nbsp;<strong id="completed-count">${orderStateCount.deliveredOrders}</strong> 건</span>
        <span>구매확정 : &nbsp;<strong id="completed-count">${orderStateCount.confirmedOrders}</strong> 건</span>
        <span>교환/환불 : &nbsp;<strong id="completed-count">${orderStateCount.exchangeRefundOrders}</strong> 건</span>
    </div>

    <!-- 주문 조건 및 검색어 필터 -->
    <div class="filter-section row">
        <!-- 주문 조건 필터 -->
        <div class="order-date-filter col-md-6 d-flex align-items-center">
            <label for="order-type" class="me-2">주문 일자 :</label>
            <button class="btn btn-outline-secondary me-2" id="ListAll_btn">전체</button>
            <button class="btn btn-outline-secondary date-btn me-2" data-date="today">당일</button>
            <button class="btn btn-outline-secondary date-btn me-2" data-date="week">일주일</button>
            <button class="btn btn-outline-secondary date-btn me-2" data-date="month1">1개월</button>
            <button class="btn btn-outline-secondary date-btn me-2" data-date="month3">3개월</button>
            <button class="btn btn-outline-secondary date-btn" data-date="month6">6개월</button>
        </div>

        <!-- 검색어 필터 -->
        <div class="order-search col-md-6 d-flex align-items-center justify-content-end">
            <label for="search-type" class="me-2">검색어 :</label>
            <select class="form-select" id="search-type" style="width: 150px; display: inline-block;">
                <option value="orderNumber">주문번호</option>
                <option value="customerId">주문자 아이디</option>
            </select>
            <input type="text" class="form-control" id="search-keyword" placeholder="검색어 입력" style="width: 15em; display: inline-block;">
            <button class="btn btn-outline-secondary" id="search-btn">검색</button>
        </div>
    </div>
</div>

<!-- 주문 관리 리스트 -->
<div class="order-list-container">
    <table class="order-list table table-hover table-bordered">
        <thead>
            <tr>
                <th style="width:3%">주문코드</th>
                <th style="width:10%">주문번호</th>
                <th style="width:10%">주문명</th>
                <th style="width:4%">주문자 아이디</th>
                <th style="width:3%">결제금액</th>
                <th style="width:8%">주문일시</th>
                <th style="width:3%"></th>
            </tr>
        </thead>
        <tbody class="user_orderList">

        </tbody>
    </table>
</div>
<div class="orderPageing">
    <nav>
        <ul class="pagination justify-content-center">

        </ul>
    </nav>
</div>