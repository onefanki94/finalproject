<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 일/월별 매출관리</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
/>
<link href="/css/chaewon_master.css" rel="stylesheet" type="text/css" />
<script src="/js/chaewon_master_salesList.js"></script>

<h2 class="order_list_h2">매출 내역</h2>
<div class="sales_top">
    <div class="sales_date_search">
        <div class="menu_name">
            검색기간
        </div>
        <div class="menu_date">
            <input type="date" id="startDate" value="">
            ~
            <input type="date" id="endDate" value="">
            <button class="btn btn-secondary" id="date_search">검색</button>
        </div>
    </div>
    <div class="sales_dataChart">
        <div class="menu_name menu_name_chart">
            매출 그래프
        </div>
        <div class="menu_chart">
            <button class="btn btn-secondary">일별 매출보기</button>
            <button class="btn btn-secondary">애니별 매출보기</button>
        </div>
    </div>
</div>

<div class="order-list-container">
    <table class="order-sales table table-hover table-bordered">
        <thead>
            <tr>
                <th style="width:3%">일자</th>
                <th style="width:2%">주문건수</th>
                <th style="width:5%">총 매출</th>
                <th style="width:5%">수수료</th>
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