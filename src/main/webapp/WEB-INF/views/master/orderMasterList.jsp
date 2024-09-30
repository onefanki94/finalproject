<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 주문 내역 리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="fileterh2">
<h2>주문관리</h2></div>
<div class="filterAll">
<!-- 주문상태 필터 -->
<div class="order-status-summary">
    <span data-status="new">신규주문 : &nbsp;<strong id="new-count"> 0</strong> 건</span>
    <span data-status="preparing">배송준비 : &nbsp;<strong id="preparing-count"> 0</strong> 건</span>
    <span data-status="shipping">배송중 : &nbsp;<strong id="shipping-count"> 0</strong> 건</span>
    <span data-status="completed">배송완료 : &nbsp;<strong id="completed-count"> 0</strong> 건</span>
</div>

<!-- 주문일자 필터 -->
    <div class="order-date-filter">
        <label for="order-type">주문 조건 : &nbsp;</label>
        <button class="date-btn" data-date="today">당일</button>
        <button class="date-btn" data-date="week">일주일</button>
        <button class="date-btn" data-date="month1">1개월</button>
        <button class="date-btn" data-date="month3">3개월</button>
        <button class="date-btn" data-date="month6">6개월</button>
    </div>

    <!-- 검색어 필터 -->
    <div class="order-search">
        <label for="search-type">검색 조건 : &nbsp;</label>
        <select id="search-type">
            <option value="orderNumber">주문 번호</option>
            <option value="customerName">고객 이름</option>
            <option value="productName">상품명</option>
        </select>

        <input type="text" id="search-keyword" placeholder="검색어 입력">
        <button id="search-btn">검색</button>
    </div>
</div>
<div class="orderManagement">
    <h2>주문 내역 리스트</h2>
    <table>
        <thead>
            <tr>
                <th style="width:2%"></th>
                <th style="width:6%">주문일시</th>
                <th style="width:6%">주문번호</th>
                <th style="width:6%">주문상태</th>
                <th style="width:5%">주문자명</th>
                <th style="width:7%">주문자연락처</th>
                <th style="width:7%">수령자명</th>
                <th style="width:6%">수령자연락처</th>
                <th style="width:30%">배송지</th>
                <th style="width:10%">관리</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
        </tbody>
    </table>
</div>
  <div class="orderPageing">페이징 영역</div>