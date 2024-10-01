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
                <th>No.</th>
                <th>카테고리</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>좋아요</th>
                <th>작업</th>
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
  <div class="boardPageing">페이징 영역</div>