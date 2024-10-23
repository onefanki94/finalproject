<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 일/월별 매출관리</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<div class="sales-management">
    <h2>매출 관리</h2>

    <!-- 검색 기간 설정 -->
    <div class="search-period">
        <form id="search-form" method="get" action="/master/orderSalesMaster">
            <label for="start-date">검색 기간:</label>
            <input type="date" id="start-date" name="startDate" value="${startDate}">
            <span>부터</span>
            <input type="date" id="end-date" name="endDate" value="${endDate}">
            <span>까지</span>
            <button type="submit" class="btn btn-outline-success">검색</button>
        </form>
    </div>

    <!-- 매출 통계 탭 -->
    <div class="sales-statistics">
        <ul class="tabs nav nav-tabs justify-content-center">
            <li class="nav-item">
                <a class="nav-link active tab-item" data-tab="daily" href="#daily" role="tab">일별</a>
            </li>
            <li class="nav-item">
                <a class="nav-link tab-item" data-tab="monthly" href="#monthly" role="tab">월별</a>
            </li>
        </ul>

        <!-- 탭 내용 -->
        <div class="tab-content">
            <!-- 일별 매출 통계 -->
            <div id="daily" class="tab-panel active">
                <h3>일별 매출 통계</h3>
                <table class="sales-table table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th style="width:10%">날짜</th>
                            <th style="width:15%">매출금액</th>
                            <th style="width:10%">주문건수</th>
                            <th style="width:15%">취소금액</th>
                            <th style="width:10%">취소건수</th>
                            <th style="width:15%">순 매출 금액</th>
                            <th style="width:10%">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="day" items="${dailySalesList}">
                            <tr>
                                <td>${day.date}</td>
                                <td>₩${day.salesAmount}</td>
                                <td>${day.orderCount}</td>
                                <td>₩${day.cancelAmount}</td>
                                <td>${day.cancelCount}</td>
                                <td>₩${day.salesAmount - day.cancelAmount}</td> <!-- 순 매출 금액 계산 -->
                                <td><a href="/master/orderSalesDetailMaster?date=${day.date}" class="btn btn-outline-success btn-sm">상세보기</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 월별 매출 통계 -->
            <div id="monthly" class="tab-panel">
                <h3>월별 매출 통계</h3>
                <table class="sales-table table table-hover table-bordered">
                    <thead>
                                <tr>
                                                   <th style="width:10%">날짜</th>
                                                   <th style="width:15%">매출금액</th>
                                                   <th style="width:10%">주문건수</th>
                                                   <th style="width:15%">취소금액</th>
                                                   <th style="width:10%">취소건수</th>
                                                   <th style="width:15%">순 매출 금액</th>
                                                   <th style="width:10%">관리</th>
                                               </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="month" items="${monthlySalesList}">
                            <tr>
                                <td>${month.date}</td>
                                <td>₩${month.salesAmount}</td>
                                <td>${month.orderCount}</td>
                                <td>₩${month.cancelAmount}</td>
                                <td>${month.cancelCount}</td>
                                <td>₩${month.salesAmount - month.cancelAmount}</td> <!-- 순 매출 금액 계산 -->
                                <td><a href="/master/orderSalesDetail1Master?date=${month.date}" class="btn btn-outline-success btn-sm">상세보기</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
