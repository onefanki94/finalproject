<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <title>JSP Template</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>


            <div class="notice_tab">
                <ul class="list">
                    <li class="selected">
                        <a href="#tap1" class="btn">공지사항</a>
                    </li>
                    <li>
                        <a href="#tap2" class="btn">자주 묻는 질문(FAQ)</a>
                    </li>
                    <li>
                        <a href="#tap3" class="btn">1:1 문의</a>
                    </li>
                    <li>
                        <a href="#tap4" class="btn">이용약관</a>
                    </li>
                </ul>
            </div>
            <div class="notice" id="content">
                <h1>공지사항</h1>
                <div class="search">
                    <input type="text" id="textSearch" placeholder="검색어를 입력하세요." value>
                    <button type="button" id="btnSearch">검색</button>
                </div>
                <div class="noticeList">
                    <colgroup>
                        <col class="cate">
                        <col class="tit">
                        <col class="date">
                        <col class="count">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="cate">카테고리</th>
                            <th class="tit">제목</th>
                            <th class="date">등록일</th>
                            <th class="count">조회수</th>
                        </tr>
                    </thead>

                </div>
            </div>

        </body>

        </html>