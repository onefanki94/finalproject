<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 신고 목록 리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="reportinguserList-list-container">
    <h2>신고 목록</h2>
    <table class="reportinguserList-list">
        <thead>
            <tr>
                <th style="width:2%"></th>
                <th style="width:2%">No.</th>
                <th style="width:5%">아이디</th>
                <th style="width:12%">신고상태</th>
                <th style="width:6%">관리자아이디</th>
                <th style="width:6%">처리현황</th>
                <th style="width:10%">증거자료</th>
                <th style="width:3.5%">신고횟수</th>
                <th style="width:3.5%">누적횟수</th>
                <th style="width:10%">관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox" /></td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>
                    <button class="btn btn-outline-success btn-sm">신고내역추가</button>
                    <button class="btn btn-outline-danger btn-sm">삭제</button>
                </td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>
                    <button class="btn btn-outline-success btn-sm">신고내역추가</button>
                    <button class="btn btn-outline-danger btn-sm">삭제</button>
                </td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                            <td>
                    <button class="btn btn-outline-success btn-sm">신고내역추가</button>
                    <button class="btn btn-outline-danger btn-sm">삭제</button>
                            </td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                            <td>
                    <button class="btn btn-outline-success btn-sm">신고내역추가</button>
                    <button class="btn btn-outline-danger btn-sm">삭제</button>
                            </td>
            </tr>
        </tbody>
    </table>
        <div class="reportinguserListPageing">페이징 영역</div>
</div>
</body>
</html>