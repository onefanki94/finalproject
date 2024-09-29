<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 애니리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<div class="anime-list-container">
    <h2>애니 목록</h2>
    <table class="anime-list">
        <thead>
            <tr>
                <th style="width:2%"></th>
                <th style="width:6%">애니번호</th>
                <th style="width:6%">카테고리</th>
                <th style="width:35%">작품명</th>
                <th style="width:8%">최초방영일</th>
                <th style="width:6%">등급</th>
                <th style="width:15%">관리</th>
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
                <td>
                    <button class="add-btn"><a href="/master/aniAddMaster">추가</a></button>
                    <button class="edit-btn">수정</button>
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
                <td>
                    <button class="add-btn">추가</button>
                    <button class="edit-btn">수정</button>
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
                            <td>
                                <button class="add-btn">추가</button>
                                <button class="edit-btn">수정</button>
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
                            <td>
                                <button class="add-btn">추가</button>
                                <button class="edit-btn">수정</button>
                                <button class="delete-btn">삭제</button>
                            </td>
            </tr>
        </tbody>
    </table>
     <div class="aniPageing">페이징 영역</div>
</div>
</body>
</html>