<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 문의사항</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

 <div class="QNA-list-container">
             <h2>문의사항 리스트</h2>
             <table class="QNA-list table table-hover table-bordered">
                 <thead class="table-light">
                     <tr>
                         <th style="width:5%">No.</th>
                         <th style="width:15%">카테고리</th>
                         <th style="width:50%">제목</th>
                         <th style="width:10%">작성자</th>
                         <th style="width:10%">등록일</th>
                         <th style="width:15%">관리</th>
                     </tr>
                 </thead>
                 <tbody>
                 <c:forEach items="${qnaList}" var="qna">
                     <tr>
                         <td>${qna.idx}</td>
                         <td>${qna.qnatype}</td>
                         <td>${qna.title}</td>
                         <td>${qna.useridx}</td>
                         <td>${qna.regDT}</td>
                         <td>
                             <a href="/master/QNAnswerDetailMaster" class="btn btn-outline-secondary btn-sm">답변</a>
                         </td>
                     </tr>
                     </c:forEach>
                 </tbody>
             </table>
         </div>

         <!-- 페이징 영역 -->
         <div class="QNAPageing">
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