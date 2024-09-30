<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<form action="/master/QNAnswerDetailMasterOk" method="post">
    <div>
        <label for="title">제목 : </label>
        <input type="text" id="title" name="title" required>
    </div>

    <div>
        <label for="내용">내용 : </label>
        <textarea id="content" name="content" rows="10" required></textarea>
    </div>

        <div>
            <label for="reply">답변 : </label>
            <textarea id="content" name="content" rows="10" required></textarea>
        </div>
    <div>
        <input type="submit" value="답변 완료">
    </div>
</form>
</div>