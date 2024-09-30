<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 게시판 댓글 전체 목록</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="boardReplyManagement">
    <h2>게시판 댓글 목록</h2>
    <table>
        <thead>
            <tr>
                <th style="width:2%;">No.</th>
                <th style="width:3%;">카테고리</th>
                <th style="width:30%;">댓글내용</th>
                <th style="width:3%;">작성자</th>
                <th style="width:3%;">작성일</th>
                <th style="width:3%;">답글갯수</th>
                <th style="width:5%;">관리</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
        </tbody>
    </table>
</div>
  <div class="boardReplyPageing">페이징 영역</div>