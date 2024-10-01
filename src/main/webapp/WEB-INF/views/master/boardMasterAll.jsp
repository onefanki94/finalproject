<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 게시판 전체 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
  <div class="boardManagement">
        <h2>게시판 전체 목록</h2>
        <table>
            <thead>
                <tr>
                    <th style="width:2%">No.</th>
                    <th style="width:6%">카테고리</th>
                    <th style="width:30%">제목</th>
                    <th style="width:5%">작성자</th>
                    <th style="width:5%">작성일</th>
                    <th style="width:3%">조회수</th>
                    <th style="width:3%">좋아요</th>
                    <th style="width:10%">관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>공지사항</td>
                    <td>게시판 사용 안내</td>
                    <td>관리자</td>
                    <td>2023-09-25</td>
                    <td>100</td>
                    <td>50</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>공지사항</td>
                    <td>서버 점검 안내</td>
                    <td>관리자</td>
                    <td>2023-09-24</td>
                    <td>150</td>
                    <td>75</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Q&A</td>
                    <td>서비스 관련 문의</td>
                    <td>홍길동</td>
                    <td>2023-09-23</td>
                    <td>80</td>
                    <td>40</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>자유게시판</td>
                    <td>새로운 기능 제안</td>
                    <td>이영희</td>
                    <td>2023-09-22</td>
                    <td>50</td>
                    <td>30</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 페이징 영역 -->
    <div class="boardPageing">1 2 3 4 5 ...</div>
