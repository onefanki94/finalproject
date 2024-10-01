<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 굿즈 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="store-list-container">
    <h2>굿즈 전체 목록</h2>
    <table class="store-list">
        <thead>
            <tr>
                <th style="width:2%"></th>
                <th style="width:6%">상품번호</th>
                <th style="width:6%">카테고리</th>
                <th style="width:35%">상품명</th>
                <th style="width:8%">판매가</th>
                <th style="width:8%">재고</th>
                <th style="width:10%">등록일</th>
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
                            <td>데이터 바인딩</td>
                <td>
                    <button class="add-btn">추가</button>
                    <button class="edit-btn">수정</button>
                    <button class="delete-btn">삭제</button>
                </td>
            </tr>
        </tbody>
    </table>
        <div class="storePageing">페이징 영역</div>