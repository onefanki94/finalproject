<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 신고계정 유저리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="reportinguser-list-container">
            <h2>신고 계정 목록</h2>
            <table class="reportinguser-list table table-hover table-bordered">
                <thead class="table-light">
                    <tr>
                        <th style="width:5%">아이디</th>
                        <th style="width:30%">제제내용</th>
                        <th style="width:10%">사유</th>
                        <th style="width:15%">Start</th>
                        <th style="width:15%">End</th>
                        <th style="width:8%">신고횟수</th>
                        <th style="width:20%">관리</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="ban" items="${reportingUser}">
                    <tr>
                        <td>${ban.userid}</td>
                        <td>${ban.reason}</td>
                        <td>${ban.report_type}</td>
                        <td>${ban.stopDT}</td>
                        <td>${ban.endDT}</td>
                        <td>${ban.totalUserReport}</td>
                        <td>
                            <button class="btn btn-outline-primary btn-sm">메모</button>
                            <button class="btn btn-outline-danger btn-sm">삭제</button>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 페이징 영역 -->
            <div class="reportinguserPageing">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">이전</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">다음</a></li>
                    </ul>
                </nav>
            </div>
        </div>