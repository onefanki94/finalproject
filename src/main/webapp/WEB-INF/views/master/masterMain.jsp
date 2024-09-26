<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>DashBoard</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="mastermain">
    <nav class="navbar navbar-dark bg-dark">
        <div class="management"><a href="/master/masterMain">관리자 Management</a></div>
        <div>
            <div class="manage_menu">
                <ul>
                    <a href="#" class="menu-item">회원관리</a>
                    <li class="submenu"><a href="/master/userMasterList">회원목록</a></li>
                    <li class="submenu"><a href="/master/reporinguserMasterList">신고계정목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">애니관리</a>
                    <li class="submenu"><a href="/master/aniMasterList">애니목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">굿즈관리</a>
                    <li class="submenu"><a href="#">굿즈목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">주문관리</a>
                    <li class="submenu"><a href="#">주문내역리스트</a></li>
                    <li class="submenu"><a href="#">일/월별 매출내역</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">신고관리</a>
                    <li class="submenu"><a href="#">신고목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">게시판,댓글, 리뷰관리</a>
                    <li class="submenu"><a href="#">게시판</a></li>
                    <li class="submenu"><a href="#">댓글</a></li>
                    <li class="submenu"><a href="#">리뷰</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">기타관리</a>
                    <li class="submenu"><a href="#">공지사항</a></li>
                    <li class="submenu"><a href="#">문의사항</a></li>
                    <li class="submenu"><a href="#">FAQ</a></li>
                    <li class="submenu"><a href="#">이벤트</a></li>
                </ul>
        </div>
        </div>
    </nav>
</div>
<div class="chart">
        <div class="haruDailyChart">차트영역
            <canvas id="haruDailyChartView"></canvas>
        </div>
        <div class="monthDailyChart">차트영역
            <canvas id="monthDailyChartView"></canvas>
        </div>
        </div>
</body>
</html>