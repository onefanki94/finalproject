<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>DashBoard - 일/월별 매출관리</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="mastermain">
    <nav class="navbar navbar-dark bg-dark">
        <div class="management"><a href="/master/masterMain">관리자 Management</a></div>
        <div>
            <div class="manage_menu">
                <ul>
                    <a href="" class="menu-item">회원관리</a>
                    <li class="submenu"><a href="/master/userMasterList">회원목록</a></li>
                    <li class="submenu"><a href="/master/reporinguserMasterList">신고계정목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">애니관리</a>
                    <li class="submenu"><a href="/master/aniMasterList">애니목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">굿즈관리</a>
                    <li class="submenu"><a href="/master/storeMasterList">굿즈목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">주문관리</a>
                    <li class="submenu"><a href="/master/orderMasterList">주문내역리스트</a></li>
                    <li class="submenu"><a href="/master/orderSalesMaster">일/월별 매출내역</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">신고관리</a>
                    <li class="submenu"><a href="/master/reportinguserListMaster">신고목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">게시판,댓글, 리뷰관리</a>
                    <li class="submenu"><a href="/master/boardMasterAll">게시판</a></li>
                    <li class="submenu"><a href="/master/boardMasterReplyAll">댓글</a></li>
                    <li class="submenu"><a href="/master/boardMasterReviewAll">리뷰</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">기타관리</a>
                    <li class="submenu"><a href="/master/noticeMasterList">공지사항</a></li>
                    <li class="submenu"><a href="#">문의사항</a></li>
                    <li class="submenu"><a href="#">FAQ</a></li>
                    <li class="submenu"><a href="#">이벤트</a></li>
                </ul>
        </div>
        </div>
    </nav>
</div>
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
                            <td><a href="#" class="btn btn-info">상세보기</a></td>
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