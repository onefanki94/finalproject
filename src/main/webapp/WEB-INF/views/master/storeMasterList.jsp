<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 굿즈 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

 <div class="store-list-container">
        <h2>굿즈 전체 목록</h2>

        <!-- 굿즈 요약 정보 -->
        <div class="summary">
            <div>
                <strong>총 상품 수</strong>
                <p id="totalGoods">4 개</p>
            </div>
            <div>
                <strong>카테고리별</strong>
                <p id="categorySummary">피규어: 1, 티셔츠: 1, 악세사리: 1, 포스터: 1</p>
            </div>
        </div>

        <!-- 검색 및 필터 기능 -->
        <div class="search-bar">
            <div class="d-flex">
                <input type="text" id="searchInput" class="form-control" placeholder="상품명, 카테고리 검색">
                <button class="btn btn-primary ms-2" onclick="searchTable()">검색</button>
            </div>
            <div>
                <select class="form-select w-auto" id="filterSelect">
                    <option value="">모든 카테고리</option>
                    <option value="피규어">피규어</option>
                    <option value="티셔츠">티셔츠</option>
                    <option value="악세사리">악세사리</option>
                    <option value="포스터">포스터</option>
                </select>
            </div>
        </div>

        <!-- 굿즈 정보 테이블 -->
        <table class="store-list table table-hover table-bordered">
            <thead>
                <tr>
                    <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
                    <th style="width:7%" class="sortable" onclick="sortTable(1)">상품번호</th>
                    <th style="width:7%" class="sortable" onclick="sortTable(2)">카테고리</th>
                    <th style="width:35%" class="sortable" onclick="sortTable(3)">상품명</th>
                    <th style="width:8%" class="sortable" onclick="sortTable(4)">판매가</th>
                    <th style="width:8%" class="sortable" onclick="sortTable(5)">재고</th>
                    <th style="width:10%" class="sortable" onclick="sortTable(6)">등록일</th>
                    <th style="width:15%">관리<a href="/master/storeAddMaster"class="btn btn-outline-success btn-sm" >추가</a></th>
                </tr>
            </thead>
            <tbody id="storeTableBody">
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>001</td>
                    <td>피규어</td>
                    <td>나루토 피규어</td>
                    <td>50,000원</td>
                    <td>10</td>
                    <td>2023-01-01</td>
                    <td>
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/storeEditMaster">수정</a></button>
                        <button class="btn btn-outline-danger btn-sm">삭제</button>
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
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/storeEditMaster">수정</a></button>
                        <button class="btn btn-outline-danger btn-sm">삭제</button>
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
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/storeEditMaster">수정</a></button>
                        <button class="btn btn-outline-danger btn-sm">삭제</button>
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
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/storeAddMaster">수정</a></button>
                        <button class="btn btn-outline-danger btn-sm">삭제</button>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- 페이지네이션 -->
        <nav>
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">이전</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">다음</a></li>
            </ul>
        </nav>
    </div>