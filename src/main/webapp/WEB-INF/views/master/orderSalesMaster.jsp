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
            <label for="start-date">검색 기간:</label>
            <input type="date" id="start-date" name="start-date">
            <span>부터</span>
            <input type="date" id="end-date" name="end-date">
            <span>까지</span>
            <button class="btn btn-outline-success">검색</button>
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
                                <th style="width:10%">배송비</th>
                                <th style="width:10%">수수료</th>
                                <th style="width:10%">관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2023-09-25</td>
                                <td>₩1,000,000</td>
                                <td>50</td>
                                <td>₩30,000</td>
                                <td>₩20,000</td>
                                <td><a href="/master/orderSalesDetailMaster" class="btn btn-outline-success btn-sm">상세보기</a></td>
                            </tr>
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
                                <th style="width:10%">배송비</th>
                                <th style="width:10%">수수료</th>
                                <th style="width:10%">관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2023-09</td>
                                <td>₩30,000,000</td>
                                <td>1500</td>
                                <td>₩900,000</td>
                                <td>₩500,000</td>
                                <td><a href="/master/orderSalesDetail1Master" class="btn btn-outline-success btn-sm">상세보기</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/MasterPage.js"></script>