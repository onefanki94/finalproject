<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 회원 유저리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
 <div class="user-list-container">
        <h2>사용자(회원) 정보 목록</h2>

        <!-- 사용자 요약 정보 -->
        <div class="summary">
            <div>
                <strong>총 사용자 수</strong>
                <p id="totalUsers">3 명</p>
            </div>
            <div>
                <strong>활성 사용자</strong>
                <p id="activeUsers">2 명</p>
            </div>
            <div>
                <strong>비활성 사용자</strong>
                <p id="inactiveUsers">1 명</p>
            </div>
            <div>
                <strong>오늘 가입한 사용자</strong>
                <p id="newUsers">1 명</p>
            </div>
        </div>

        <!-- 검색 및 필터 기능 -->
        <div class="search-bar">
            <div class="d-flex">
                <input type="text" id="searchInput" class="form-control" placeholder="검색어 입력 (아이디, 이름, 이메일)">
                <button class="btn btn-primary ms-2" onclick="searchTable()">검색</button>
            </div>
            <div>
                <select class="form-select w-auto" id="filterSelect">
                    <option value="">모든 사용자</option>
                    <option value="active">활성 사용자</option>
                    <option value="inactive">비활성 사용자</option>
                </select>
            </div>
        </div>

        <!-- 사용자 정보 테이블 -->
        <table class="user-list table table-hover table-bordered">
            <thead>
                <tr>
                    <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
                    <th style="width:7%" class="sortable" onclick="sortTable(1)">유저번호</th>
                    <th style="width:8%" class="sortable" onclick="sortTable(2)">아이디</th>
                    <th style="width:8%" class="sortable" onclick="sortTable(3)">이름</th>
                    <th style="width:15%" class="sortable" onclick="sortTable(4)">이메일</th>
                    <th style="width:15%" class="sortable" onclick="sortTable(5)">연락처</th>
                    <th style="width:20%" class="sortable" onclick="sortTable(6)">가입일</th>
                    <th style="width:9%" class="sortable" onclick="sortTable(7)">포인트내역</th>
                    <th style="width:8%">관리</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <tr class="active">
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>1</td>
                    <td>user1</td>
                    <td>홍길동</td>
                    <td>hong@example.com</td>
                    <td>010-1234-5678</td>
                    <td>2022-01-15</td>
                    <td>1000 <span> point</span></td>
                    <td><button class="btn btn-outline-danger btn-sm">삭제</button></td>
                </tr>
                <tr class="inactive">
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>2</td>
                    <td>user2</td>
                    <td>김철수</td>
                    <td>kim@example.com</td>
                    <td>010-9876-5432</td>
                    <td>2022-03-10</td>
                    <td>2000 <span> point</span></td>
                    <td><button class="btn btn-outline-danger btn-sm">삭제</button></td>
                </tr>
                <tr class="active">
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>3</td>
                    <td>user3</td>
                    <td>이영희</td>
                    <td>lee@example.com</td>
                    <td>010-5678-1234</td>
                    <td>2022-05-20</td>
                    <td>1500 <span> point</span></td>
                    <td><button class="btn btn-outline-danger btn-sm">삭제</button></td>
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