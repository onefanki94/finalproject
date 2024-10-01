<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 애니리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="/js/MasterPage.js"></script>
 <div class="anime-list-container">
         <h2>애니 목록</h2>

         <!-- 애니 요약 정보 -->
         <div class="summary">
             <div>
                 <strong>총 애니 수</strong>
                 <p id="totalAnime">3 개</p>
             </div>
             <div>
                 <strong>장르별</strong>
                 <p id="categorySummary">액션: 1, 코미디: 1, 판타지: 1</p>
             </div>
         </div>

         <!-- 검색 및 필터 기능 -->
         <div class="search-bar">
             <div class="d-flex">
                 <input type="text" id="searchInput" class="form-control" placeholder="작품명, 카테고리 검색">
                 <button class="btn btn-primary ms-2" onclick="searchTable()">검색</button>
             </div>
             <div>
                 <select class="form-select w-auto" id="filterSelect">
                     <option value="">모든 카테고리</option>
                     <option value="액션">액션</option>
                     <option value="코미디">코미디</option>
                     <option value="판타지">판타지</option>
                 </select>
             </div>
         </div>

         <!-- 애니 정보 테이블 -->
         <table class="anime-list table table-hover table-bordered">
             <thead>
                 <tr>
                     <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
                     <th style="width:6%" class="sortable" onclick="sortTable(1)">애니번호</th>
                     <th style="width:6%" class="sortable" onclick="sortTable(2)">카테고리</th>
                     <th style="width:35%" class="sortable" onclick="sortTable(3)">작품명</th>
                     <th style="width:8%" class="sortable" onclick="sortTable(4)">최초방영일</th>
                     <th style="width:6%" class="sortable" onclick="sortTable(5)">등급</th>
                     <th style="width:15%">관리<a href="/master/aniAddMaster" class="btn btn-outline-success btn-sm">추가</a></th>
                 </tr>
             </thead>
             <tbody id="animeTableBody">
                 <tr>
                     <td><input type="checkbox" name="select" id="select"/></td>
                     <td>1</td>
                     <td>액션</td>
                     <td>나루토</td>
                     <td>2002-10-03</td>
                     <td>15세</td>
                     <td>
                         <button class="btn btn-outline-secondary btn-sm"><a href="/master/aniEditMaster">수정</a></button>
                         <button class="btn btn-outline-danger btn-sm">삭제</button>
                     </td>
                 </tr>
                 <tr>
                     <td><input type="checkbox" name="select" id="select"/></td>
                     <td>2</td>
                     <td>코미디</td>
                     <td>원피스</td>
                     <td>1999-10-20</td>
                     <td>12세</td>
                     <td>
                         <button class="btn btn-outline-secondary btn-sm"><a href="/master/aniEditMaster">수정</a></button>
                         <button class="btn btn-outline-danger btn-sm">삭제</button>
                     </td>
                 </tr>
                 <tr>
                     <td><input type="checkbox" name="select" id="select"/></td>
                     <td>3</td>
                     <td>판타지</td>
                     <td>블리치</td>
                     <td>2004-10-05</td>
                     <td>15세</td>
                     <td>
                         <button class="btn btn-outline-secondary btn-sm"><a href="/master/aniEditMaster">수정</a></button>
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
