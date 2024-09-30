<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 굿즈 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="store-list-container">
        <h2>굿즈 전체 목록</h2>
        <table class="store-list table table-hover table-bordered">
            <thead>
                <tr>
                    <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
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
                    <td>001</td>
                    <td>피규어</td>
                    <td>나루토 피규어</td>
                    <td>50,000원</td>
                    <td>10</td>
                    <td>2023-01-01</td>
                    <td>
                        <button class="btn add-btn">추가</button>
                        <button class="btn edit-btn">수정</button>
                        <button class="btn delete-btn">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>002</td>
                    <td>티셔츠</td>
                    <td>원피스 티셔츠</td>
                    <td>20,000원</td>
                    <td>5</td>
                    <td>2023-02-10</td>
                    <td>
                        <button class="btn add-btn">추가</button>
                        <button class="btn edit-btn">수정</button>
                        <button class="btn delete-btn">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>003</td>
                    <td>악세사리</td>
                    <td>포켓몬 열쇠고리</td>
                    <td>15,000원</td>
                    <td>50</td>
                    <td>2023-03-15</td>
                    <td>
                        <button class="btn add-btn">추가</button>
                        <button class="btn edit-btn">수정</button>
                        <button class="btn delete-btn">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>004</td>
                    <td>포스터</td>
                    <td>드래곤볼 포스터</td>
                    <td>30,000원</td>
                    <td>20</td>
                    <td>2023-04-20</td>
                    <td>
                        <button class="btn add-btn">추가</button>
                        <button class="btn edit-btn">수정</button>
                        <button class="btn delete-btn">삭제</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="storePageing">1 2 3 4 5 ...</div>
    </div>