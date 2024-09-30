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
                <th>No.</th>
                <th>아이디</th>
                <th>신고 상태</th>
                <th>관리자아이디</th>
                <th>관리자 신고 상태</th>
                <th>증거자료</th>
                <th>작업</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>
                    <button class="memo-btn">신고내역추가</button>
                    <button class="delete-btn">삭제</button>
                </td>
            </tr>
            <tr>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>
                    <button class="memo-btn">신고내역추가</button>
                    <button class="delete-btn">삭제</button>
                </td>
            </tr>
            <tr>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                            <td>
                                <button class="memo-btn">신고내역추가</button>
                                <button class="delete-btn">삭제</button>
                            </td>
            </tr>
            <tr>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                <td>데이터 바인딩</td>
                            <td>
                                <button class="memo-btn">신고내역추가</button>
                                <button class="delete-btn">삭제</button>
                            </td>
            </tr>
        </tbody>
    </table>
        <div class="reportinguserListPageing">페이징 영역</div>
</div>
</body>
</html>