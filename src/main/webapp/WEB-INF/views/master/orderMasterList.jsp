<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 주문 내역 리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="fileterh2">
            <h2>주문 관리</h2>
</div>

     <!-- 주문 상태 및 필터 영역 -->
     <div class="filterAll container">
         <!-- 주문 상태 필터 -->
         <div class="order-status-summary">
             <span>신규주문 : &nbsp;<strong id="new-count">0</strong> 건</span>
             <span>배송준비 : &nbsp;<strong id="preparing-count">0</strong> 건</span>
             <span>배송중 : &nbsp;<strong id="shipping-count">0</strong> 건</span>
             <span>배송완료 : &nbsp;<strong id="completed-count">0</strong> 건</span>
         </div>

         <!-- 주문 조건 및 검색어 필터 -->
         <div class="filter-section">
             <!-- 주문 조건 필터 -->
             <div class="order-date-filter">
                 <label for="order-type">주문 조건 :</label>
                 <button class="btn btn-outline-secondary date-btn" data-date="today">당일</button>
                 <button class="btn btn-outline-secondary date-btn" data-date="week">일주일</button>
                 <button class="btn btn-outline-secondary date-btn" data-date="month1">1개월</button>
                 <button class="btn btn-outline-secondary date-btn" data-date="month3">3개월</button>
                 <button class="btn btn-outline-secondary date-btn" data-date="month6">6개월</button>
             </div>

             <!-- 검색어 필터 -->
             <div class="order-search">
                 <label for="search-type">검색어 :</label>
                 <select class="form-select" id="search-type" style="width: 150px; display: inline-block;">
                     <option value="orderNumber">주문 번호</option>
                     <option value="customerName">고객 이름</option>
                     <option value="productName">상품명</option>
                 </select>
                 <input type="text" class="form-control" id="search-keyword" placeholder="검색어 입력" style="width: 200px; display: inline-block;">
                 <button class="btn btn-outline-success" id="search-btn">검색</button>
             </div>
         </div>
     </div>

<div class="order-list-container">
        <h2>주문 관리 리스트</h2>
        <table class="order-list">
            <thead>
                <tr>
                    <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
                    <th style="width:8%">주문일시</th>
                    <th style="width:8%">주문번호</th>
                    <th style="width:6%">주문상태</th>
                    <th style="width:6%">주문자명</th>
                    <th style="width:10%">주문자연락처</th>
                    <th style="width:6%">수령자명</th>
                    <th style="width:10%">수령자연락처</th>
                    <th style="width:38%">배송지</th>
                    <th style="width:10%">관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>2023-09-25 14:35</td>
                    <td>20230925001</td>
                    <td>배송중</td>
                    <td>홍길동</td>
                    <td>010-1234-5678</td>
                    <td>김영희</td>
                    <td>010-9876-5432</td>
                    <td>서울특별시 강남구 테헤란로 123</td>
                    <td>
                        <button class="btn btn-outline-secondary">수정</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>2023-09-25 14:35</td>
                    <td>20230925002</td>
                    <td>배송준비</td>
                    <td>김철수</td>
                    <td>010-8765-4321</td>
                    <td>박민수</td>
                    <td>010-5678-1234</td>
                    <td>부산광역시 해운대구 해운대로 456</td>
                    <td>
                        <button class="btn btn-outline-secondary">수정</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>2023-09-25 14:35</td>
                    <td>20230925003</td>
                    <td>배송완료</td>
                    <td>이영희</td>
                    <td>010-5432-6789</td>
                    <td>박철수</td>
                    <td>010-1234-5678</td>
                    <td>대구광역시 중구 동성로 123</td>
                    <td>
                        <button class="btn btn-outline-secondary">수정</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>2023-09-25 14:35</td>
                    <td>20230925004</td>
                    <td>배송중</td>
                    <td>장영미</td>
                    <td>010-6789-1234</td>
                    <td>손흥민</td>
                    <td>010-4321-8765</td>
                    <td>인천광역시 남동구 예술로 456</td>
                    <td>
                        <button class="btn btn-outline-secondary">수정</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
     <div class="orderPageing">페이징 영역</div>
</div>