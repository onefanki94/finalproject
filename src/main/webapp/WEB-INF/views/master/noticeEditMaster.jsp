<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 공지사항 수정</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="noticeAdd">
<h2>공지사항 수정</h2>
<form action="/master/noticeEditMasterOk" method="post">

    <div>
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>
    </div>

    <div>
        <label for="내용">내용:</label>
        <textarea id="content" name="content" rows="10" required></textarea>
    </div>
    <div>
        <input type="submit" value="공지사항 수정">
    </div>
</form>
</div>