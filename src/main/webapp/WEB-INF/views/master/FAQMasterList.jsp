<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 자주 묻는 질문</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
 <div class="FAQ-list-container">
             <h2>자주 묻는 질문 리스트</h2>
             <table class="FAQ-list table table-hover table-bordered">
                 <thead class="table-light">
                     <tr>
                         <th style="width:5%">No.</th>
                         <th style="width:60%">제목</th>
                         <th style="width:15%">작성일</th>
                         <th style="width:20%">관리</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                         <td>1</td>
                         <td>FAQ 1번 질문 내용</td>
                         <td>2023-09-25</td>
                         <td>
                             <button class="btn btn-outline-secondary btn-sm">수정</button>
                             <button class="btn btn-outline-danger btn-sm">삭제</button>
                         </td>
                     </tr>
                     <tr>
                         <td>2</td>
                         <td>FAQ 2번 질문 내용</td>
                         <td>2023-09-24</td>
                         <td>
                             <button class="btn btn-outline-secondary btn-sm">수정</button>
                             <button class="btn btn-outline-danger btn-sm">삭제</button>
                         </td>
                     </tr>
                     <tr>
                         <td>3</td>
                         <td>FAQ 3번 질문 내용</td>
                         <td>2023-09-23</td>
                         <td>
                             <button class="btn btn-outline-secondary btn-sm">수정</button>
                             <button class="btn btn-outline-danger btn-sm">삭제</button>
                         </td>
                     </tr>
                     <tr>
                         <td>4</td>
                         <td>FAQ 4번 질문 내용</td>
                         <td>2023-09-22</td>
                         <td>
                             <button class="btn btn-outline-secondary btn-sm">수정</button>
                             <button class="btn btn-outline-danger btn-sm">삭제</button>
                         </td>
                     </tr>
                 </tbody>
             </table>
         </div>

         <!-- 페이징 영역 -->
         <div class="FAQPageing">
             <nav aria-label="Page navigation example">
                 <ul class="pagination justify-content-center">
                     <li class="page-item disabled">
                         <a class="page-link" href="#" tabindex="-1">이전</a>
                     </li>
                     <li class="page-item"><a class="page-link" href="#">1</a></li>
                     <li class="page-item"><a class="page-link" href="#">2</a></li>
                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                     <li class="page-item">
                         <a class="page-link" href="#">다음</a>
                     </li>
                 </ul>
             </nav>
         </div>