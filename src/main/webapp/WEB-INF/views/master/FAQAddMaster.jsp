<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 자주묻는질문 추가</title>
<link rel="stylesheet" href="/ckeditor/ckeditor.css" type="text/css" />
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/super-build/ckeditor.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>
<div class="FAQAdd">
<h2>자주묻는 질문 등록</h2>
<form action="/master/FAQAddMasterOk" method="post">
    <div>
        <label for="title"></label>
        <input type="text" id="title" name="title" placeholder="자주 묻는 질문 제목을 입력하세요."  required>
    </div>

    <div>
        <label for="내용"></label>
        <textarea id="content" name="content" rows="10"   required></textarea>
    </div>
    <div>
        <input type="submit" value="자주 묻는 질문 등록">
    </div>
</form>
</div>

