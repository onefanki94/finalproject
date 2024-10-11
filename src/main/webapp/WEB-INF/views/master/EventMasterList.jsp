<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 이벤트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="Event-list-container">
            <h2>이벤트 리스트</h2>
            <table class="Event-list table table-hover table-bordered">
                <thead class="table-light">
                    <tr>
                        <th style="width:5%">No.</th>
                        <th style="width:40%">제목</th>
                        <th style="width:8%">작성자</th>
                        <th style="width:8%">작성일</th>
                        <th style="width:12%">관리<a href="/master/EventAddMaster" class="btn btn-outline-success btn-sm">추가</a></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>이벤트 1번 제목</td>
                        <td>관리자</td>
                        <td>2023-09-25</td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm"><a href="/master/EventEditMaster">수정</a></button>
                            <button class="btn btn-outline-danger btn-sm"><a href="">삭제</a></button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>이벤트 2번 제목</td>
                        <td>관리자</td>
                        <td>2023-09-24</td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm"><a href="/master/EventEditMaster">수정</a></button>
                            <button class="btn btn-outline-danger btn-sm"><a href="">삭제</a></button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>이벤트 3번 제목</td>
                        <td>관리자</td>
                        <td>2023-09-23</td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm"><a href="/master/EventEditMaster">수정</a></button>
                            <button class="btn btn-outline-danger btn-sm"><a href="">삭제</a></button>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>이벤트 4번 제목</td>
                        <td>관리자</td>
                        <td>2023-09-22</td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm"><a href="/master/EventEditMaster">수정</a></button>
                            <button class="btn btn-outline-danger btn-sm"><a href="">삭제</a></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 페이징 영역 -->
        <div class="EventPageing">
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
