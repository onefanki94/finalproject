<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 게시판 리뷰 전체 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="boardReviewManagement">
            <h2>게시판 리뷰 목록</h2>
            <table class="table table-hover table-bordered">
                <thead class="table-light">
                    <tr>
                        <th style="width:2%;">No.</th>
                        <th style="width:8%;">카테고리</th>
                        <th style="width:40%;">리뷰제목</th>
                        <th style="width:8%;">작성자</th>
                        <th style="width:8%;">작성일</th>
                        <th style="width:15%;">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>애니리뷰</td>
                        <td>원피스 리뷰: 최고의 해적 이야기</td>
                        <td>관리자</td>
                        <td>2023-09-25</td>
                        <td>
                            <a href="#" class="btn btn-outline-success btn-sm">상세보기</a>
                            <a href="#" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>애니리뷰</td>
                        <td>나루토 리뷰: 닌자의 성장 이야기</td>
                        <td>홍길동</td>
                        <td>2023-09-24</td>
                        <td>
                            <a href="#" class="btn btn-outline-success btn-sm">상세보기</a>
                            <a href="#" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>드라마리뷰</td>
                        <td>겨울연가 리뷰: 사랑과 이별</td>
                        <td>이영희</td>
                        <td>2023-09-23</td>
                        <td>
                            <a href="#" class="btn btn-outline-success btn-sm">상세보기</a>
                            <a href="#" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>웹툰리뷰</td>
                        <td>신의탑 리뷰: 액션과 전략의 조화</td>
                        <td>박철수</td>
                        <td>2023-09-22</td>
                        <td>
                            <a href="#" class="btn btn-outline-success btn-sm">상세보기</a>
                            <a href="#" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 페이징 영역 -->
        <div class="boardReviewPageing">
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