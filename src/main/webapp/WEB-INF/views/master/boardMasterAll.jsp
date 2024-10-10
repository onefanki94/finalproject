<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 게시판 전체 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<div class="boardManagement">
            <h2>게시판 전체 목록</h2>
            <div class="summary">
                        <div>
                            <strong>총 게시글 수</strong>
                            <p id="totalBoard">${totalUser} 명</p>
                        </div>
                        <div>
                            <strong>오늘 작성된 게시글 수 </strong>
                            <p id="newUsers">${newUsers}  명</p>
                        </div>
                        <div>
                            <strong>7일간 작성된 게시글 수</strong>
                            <p id="newSignups">${newSignups}  명</p>
                        </div>
                    </div>
            <table class="table table-hover table-bordered">
                <thead class="table-light">
                    <tr>
                        <th style="width:2%">No.</th>
                        <th style="width:6%">카테고리</th>
                        <th style="width:30%">제목</th>
                        <th style="width:5%">작성자</th>
                        <th style="width:7%">작성일</th>
                        <th style="width:4%">조회수</th>
                        <th style="width:10%">관리</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="board" items="${boardList}">
                    <tr>
                        <td>${board.idx}</td>
                        <td>${board.category}</td>
                        <td>${board.title}</td>
                        <td>${board.author}</td>
                        <td>${board.regDT}</td>
                        <td>${board.hit}</td>
                        <td>
                            <a href="/cmView/${board.idx}" class="btn btn-outline-success btn-sm">상세보기</a>
                            <a href="#" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 페이징 영역 -->
        <div class="boardPageing">
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
