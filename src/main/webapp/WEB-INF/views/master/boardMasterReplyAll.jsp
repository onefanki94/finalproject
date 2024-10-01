<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 게시판 댓글 전체 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <th style="width:5%;">답글갯수</th>
                        <th style="width:15%;">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>애니리뷰</td>
                        <td>이 애니 정말 재미있네요! 다음 시즌도 기대됩니다.</td>
                        <td>홍길동</td>
                        <td>2023-09-25</td>
                        <td>5</td>
                        <td>
                            <a href="#" class="btn btn-info btn-sm">상세보기</a>
                            <a href="#" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>애니리뷰</td>
                        <td>작화가 정말 좋아요. 하지만 스토리가 조금 아쉬웠습니다.</td>
                        <td>김철수</td>
                        <td>2023-09-24</td>
                        <td>3</td>
                        <td>
                            <a href="#" class="btn btn-info btn-sm">상세보기</a>
                            <a href="#" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>드라마리뷰</td>
                        <td>연출이 너무 멋졌어요! 배우들의 연기도 인상 깊었습니다.</td>
                        <td>이영희</td>
                        <td>2023-09-23</td>
                        <td>8</td>
                        <td>
                            <a href="#" class="btn btn-info btn-sm">상세보기</a>
                            <a href="#" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>웹툰리뷰</td>
                        <td>스토리 전개가 조금 더 빠르면 좋겠어요. 그래도 재밌네요!</td>
                        <td>박민수</td>
                        <td>2023-09-22</td>
                        <td>2</td>
                        <td>
                            <a href="#" class="btn btn-info btn-sm">상세보기</a>
                            <a href="#" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
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