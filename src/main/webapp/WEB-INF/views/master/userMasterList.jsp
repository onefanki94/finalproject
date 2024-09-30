<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 회원 유저리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="user-list-container">
    <h2>회원 전체 목록</h2>
    <table class="user-list">
        <thead>
            <tr>
                <th style="width:2%"></th>
                <th style="width:5%">유저번호</th>
                <th style="width:8%">아이디</th>
                <th style="width:8%">이름</th>
                <th style="width:15%">이메일</th>
                <th style="width:15%">연락처</th>
                <th style="width:20%">가입일</th>
                <th style="width:8%">포인트내역</th>
                <th style="width:8%">관리</th>
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
                <td>
                    <button class="delete-btn">삭제</button>
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
                <td>
                    <button class="delete-btn">삭제</button>
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
                            <td>
                                <button class="delete-btn">삭제</button>
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
                            <td>
                                <button class="delete-btn">삭제</button>
                            </td>
            </tr>
        </tbody>
    </table>
         <div class="userPageing">페이징 영역</div>
</div>
</body>
</html>