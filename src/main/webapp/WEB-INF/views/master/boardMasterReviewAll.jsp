<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 게시판 댓글 전체 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click', '.btn-outline-success', function() {
                   // 댓글 상세 정보를 로드하는 로직
                   $('#commentContent').text('여기에 댓글 내용');
                   $('#commentAuthor').text('여기에 작성자');
                   $('#commentDate').text('여기에 작성일');

                   // 모달 열기
                   $('#commentModal').modal('show');
               });
</script>
<div class="boardReplyManagement">
            <h2>게시판 댓글 목록</h2>
            <table class="table table-hover table-bordered">
                <thead class="table-light">
                    <tr>
                        <th style="width:2%;">No.</th>
                        <th style="width:6%;">카테고리</th>
                        <th style="width:30%;">댓글내용</th>
                        <th style="width:8%;">작성자</th>
                        <th style="width:8%;">작성일</th>
                        <th style="width:15%;">관리</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${reviewList}" var="review">
                    <tr>
                        <td>${review.idx}</td>
                        <td>${review.comm_idx}</td>
                        <td>${review.content}</td>
                        <td>${review.useridx}</td>
                        <td>${review.regDT}</td>
                        <td>
                            <a href="#" class="btn btn-outline-success btn-sm">상세보기</a>
                            <a href="#" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 페이징 영역 -->
        <div class="boardReplyPageing">
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

        <div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="commentModalLabel">댓글 상세 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <!-- 여기에서 댓글 상세 정보를 로드 -->
                <p>댓글 내용: <span id="commentContent"></span></p>
                <p>작성자: <span id="commentAuthor"></span></p>
                <p>작성일: <span id="commentDate"></span></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>