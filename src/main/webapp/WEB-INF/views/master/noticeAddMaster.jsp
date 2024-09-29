<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 공지사항 추가</title>
<link rel="stylesheet" href="/ckeditor/ckeditor.css" type="text/css" />
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/super-build/ckeditor.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>
<div class="noticeAdd">
<h2>공지사항 등록</h2>
<form action="/master/noticeAddMasterOk" method="post">
    <div>
        <label for="title"></label>
        <input type="text" id="title" name="title" required>
    </div>

    <div>
        <label for="내용"></label>
        <textarea id="content" name="content" rows="10" required></textarea>
    </div>
    <div>
        <input type="submit" value="공지사항 추가">
    </div>
</form>
</div>

