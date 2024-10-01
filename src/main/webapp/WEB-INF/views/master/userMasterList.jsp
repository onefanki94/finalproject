<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 회원 유저리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="user-list-container">
        <h2>사용자(회원) 정보 목록</h2>
        <table class="user-list table table-hover table-bordered">
            <thead>
                <tr>
                    <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
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
                    <td>1</td>
                    <td>user1</td>
                    <td>홍길동</td>
                    <td>hong@example.com</td>
                    <td>010-1234-5678</td>
                    <td>2022-01-15</td>
                    <td>1000 <span> point</span></td>
                    <td>
                        <button class="btn  btn-outline-danger">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>2</td>
                    <td>user2</td>
                    <td>김철수</td>
                    <td>kim@example.com</td>
                    <td>010-9876-5432</td>
                    <td>2022-03-10</td>
                    <td>2000 <span> point</span></td>
                    <td>
                        <button class="btn  btn-outline-danger">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>3</td>
                    <td>user3</td>
                    <td>이영희</td>
                    <td>lee@example.com</td>
                    <td>010-5678-1234</td>
                    <td>2022-05-20</td>
                    <td>1500 <span> point</span></td>
                    <td>
                        <button class="btn  btn-outline-danger">삭제</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="userPageing">1 2 3 4 5 ...</div>
    </div>
</body>
</html>