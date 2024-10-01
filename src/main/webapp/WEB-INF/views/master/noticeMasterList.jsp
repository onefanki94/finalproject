<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 공지사항</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="notice-list-container">
    <h2>공지사항 리스트</h2>
    <table class="notice-list">
        <thead>
            <tr>
                <th>No.</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>수정일</th>
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
                <td>
                    <button class="add-btn"><a href="/master/noticeAddMaster">추가</a></button>
                    <button class="edit-btn"><a href="/master/noticeEditMaster">수정</a></button>
                    <button class="delete-btn">삭제</button>
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
                    <button class="add-btn">추가</button>
                    <button class="edit-btn">수정</button>
                    <button class="delete-btn">삭제</button>
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
                                <button class="add-btn">추가</button>
                                <button class="edit-btn">수정</button>
                                <button class="delete-btn">삭제</button>
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
                                <button class="add-btn">추가</button>
                                <button class="edit-btn">수정</button>
                                <button class="delete-btn">삭제</button>
                            </td>
            </tr>
        </tbody>
    </table>
     <div class="noticePageing">페이징 영역</div>
</div>
</body>
</html>