<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 일/월별 매출관리</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<div class="sales-management">
    <h2>매출 관리</h2>
    <!-- 검색 기간 설정 -->
    <div class="search-period">
        <label for="start-date">검색 기간:</label>
        <input type="date" id="start-date" name="start-date">
        <span>부터</span>
        <input type="date" id="end-date" name="end-date">
        <span>까지</span>
        <button id="search-btn">검색</button>
    </div>

    <!-- 매출 통계 탭 -->
    <div class="sales-statistics">
        <ul class="tabs">
            <li class="tab-item active" data-tab="daily">일별</li>
            <li class="tab-item" data-tab="monthly">월별</li>
        </ul>

        <div class="tab-content">
            <!-- 일별 매출 통계 -->
            <div id="daily" class="tab-panel active">
                <h3>일별 매출 통계</h3>
                <table class="sales-table">
                    <thead>
                        <tr>
                            <th>날짜</th>
                            <th>매출금액</th>
                            <th>주문건수</th>
                            <th>배송비</th>
                            <th>수수료</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 일별 매출 데이터 -->
                            <td>데이터 바인딩</td>
                            <td>데이터 바인딩</td>
                            <td>데이터 바인딩</td>
                            <td>데이터 바인딩</td>
                            <td>데이터 바인딩</td>
                            <td><a href="/master/orderSalesDetailMaster" class="btn btn-info">상세보기</a></td>
                    </tbody>
                </table>
            </div>

            <!-- 월별 매출 통계 -->
            <div id="monthly" class="tab-panel">
                <h3>월별 매출 통계</h3>
                <table class="sales-table">
                    <thead>
                        <tr>
                            <th>날짜</th>
                            <th>매출금액</th>
                            <th>주문건수</th>
                            <th>배송비</th>
                            <th>수수료</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 월별 매출 데이터 -->
                        <td>데이터 바인딩</td>
                        <td>데이터 바인딩</td>
                        <td>데이터 바인딩</td>
                        <td>데이터 바인딩</td>
                        <td>데이터 바인딩</td>
                        <td><a href="#" class="btn btn-info">상세보기</a></td>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="/js/MasterPage.js"></script>