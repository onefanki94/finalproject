<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 문의사항</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/Master.js"></script>

 <!-- 문의사항 리스트 -->
 <div class="QNA-list-container">
     <h2>문의사항 리스트</h2>
     <table class="QNA-list table table-hover table-bordered">
         <thead class="table-light">
             <tr>
                 <th style="width:5%">No.</th>
                 <th style="width:6%">카테고리</th>
                 <th style="width:40%">제목</th>
                 <th style="width:10%">작성자</th>
                 <th style="width:10%">등록일</th>
                 <th style="width:10%">답변 처리</th>
                 <th style="width:12%">관리</th>
             </tr>
         </thead>
         <tbody>
             <c:forEach items="${qnaList}" var="qna">
                 <tr>
                     <td>${qna.idx}</td>
                     <td>${qna.qnatype}</td>
                     <td>${qna.title}</td>
                     <td>${qna.userid}</td>
                     <td>${qna.regDT}</td>
                     <td><c:choose>
                                 <c:when test="${qna.handleState == 1}">
                                     처리 완료
                                 </c:when>
                                 <c:otherwise>
                                     접수 중
                                 </c:otherwise>
                             </c:choose></td>
                     <td>
                         <!-- 답변 버튼 클릭 시 모달 오픈 -->
                        <button class="btn btn-outline-secondary btn-sm answerBtn"
                                       data-idx="${qna.idx}"
                                       data-title="${qna.title}"
                                       data-content="${qna.content}">답변</button>
                        <button class="btn btn-outline-info btn-sm"
                                       data-idx="${qna.idx}"
                                       data-content="${qna.content}"
                                       data-reply="${qna.reply}"
                                       >답변내용보기</button>
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

 <!-- 모달창 -->
 <div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="answerModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="answerModalLabel">문의 답변</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <form id="answerForm" action="/master/QNAanswerOK" method="post">
         <input type="hidden" id="idx" name="idx" value="">
         <input type="hidden" name="userid" value="">
         <div class="form-group">
           <label for="qnaTitle">문의 제목</label>
           <input type="text" class="form-control" id="title" name="title" readonly>
         </div>
         <div class="form-group">
           <label for="qnaContent">질문 내용</label>
           <textarea class="form-control" id="content" name="content" rows="5" readonly style="resize: none;"></textarea>
         </div>
         <div class="form-group">
           <label for="qnaReply">답변 내용</label>
           <textarea class="form-control" id="reply" name="reply" rows="5"></textarea>
         </div>
         <div class="modal-footer">
           <button type="submit" class="btn btn-primary">답변 제출</button>
         </div>
       </form>
     </div>
   </div>
 </div>
 <!-- 모달 구조 -->
 <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="replyModalLabel">답변 내용 보기</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <p><strong>문의 내용:</strong></p>
         <p id="qnaContent"></p>
         <hr>
         <p><strong>답변 내용:</strong></p>
         <p id="qnaReply"></p>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
       </div>
     </div>
   </div>
 </div>