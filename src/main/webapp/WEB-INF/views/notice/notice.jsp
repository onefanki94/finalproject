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
<link href="/css/notice.css" rel="stylesheet" type="text/css">
</link>
</head>

<body>


<section class="notice_info">
    <div class="notice_top">
        <h1>고객센터</h1>
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
    </div>
</section>

<div class="container">
    <div class="notice" id="content">
        <h1>공지사항</h1>
        <div class="tools">
            <div class="search">
                <input type="text" id="textSearch" placeholder="검색어를 입력하세요." />
                <button type="button" id="btnSearch">검색</button>
            </div>
        </div>
    </div>

    <!-- 공지사항 리스트 -->
    <div class="content active" id="tap1"> <!-- 기본적으로 active 클래스를 추가 -->
        <div class="noticeList">

            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">[공지]</div>
                <div class="col-sm-7 p-2"><a href="/noticeView">제목</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">1</div>
                <div class="col-sm-7 p-2"><a href="/noticeView">제목</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
        </div>
    </div>

    <div class="content" id="tap2">
        <div class="FAQList">

            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">[질문]</div>
                <div class="col-sm-7 p-2"><a href="/boards/view/1">띠롱</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">[질문]</div>
                <div class="col-sm-7 p-2"><a href="/boards/view/1">따란</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
        </div>
    </div>

    <div class="content" id="tap3">
        <div class="FAQList">

            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">[1:1]</div>
                <div class="col-sm-7 p-2"><a href="/boards/view/1">니ㅏ런ㅇ라ㅣ</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">[1:1]</div>
                <div class="col-sm-7 p-2"><a href="/boards/view/1">닐아ㅓ미낭러</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
        </div>
    </div>

    <div class="content" id="tap4">
        <div class="FAQList">

            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">[질문]</div>
                <div class="col-sm-7 p-2"><a href="/boards/view/1">띠롱</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
            <div class="row">
                <div class="col-sm-1 p-2">[질문]</div>
                <div class="col-sm-7 p-2"><a href="/boards/view/1">따란</a></div>
                <div class="col-sm-2 p-2">20024.01.01</div>
                <div class="col-sm-2 p-2">3</div>
            </div>
        </div>
    </div>

    <div class="pagination">
        <ul  class="paging">

        <!-- 이전페이지 -->
            <%-- <c:if test="${pVO.nowPage==1}"> </c:if>--%>
            <li  class="pre"><a class="page-link" href="javascript:void(0);"><img src="/img/cm/left-chevron.png" style=" width:20px; height:18px; " /></a></li>

        <!-- 첫번쨰 페이지가 아니면 -->
            <%-- <c:if test="${pVO.nowPage>1}"> </c:if>--%>
               <li class="pre"><a class="page-link" href="javascript:reloadPage(${pVO.searchKey},${pVO.nowPage-1});"'><img src="/img/cm/left-chevron.png" style=" width:20px; height:18px; " /></a></li>

        <%--<c:forEach var="p" begin="${pVO.startPageNum}" end="${pVO.startPageNum+pVO.onePageNum-1 }"> </c:forEach>--%>
            <%-- c:if test="${p<=pVO.totalPage}"> </c:if>--%>
                <li class="page" <c:if test="${p==pVO.nowPage}">active</c:if>'><a class="page-link"  href="javascript:reloadPage(${pVO.searchKey},${p});">${p}</a></li>



        <!-- 다음페이가 없을때 -->
            <%-- <c:if test="${pVO.nowPage==pVO.totalPage}"></c:if>--%>
                <li class="next"><a class="page-link" href="javascript:void(0);"><img src="/img/cm/right-chevron.png" style=" width:20px; height:18px; "/></a></li>

        <!-- 다음페이지가 있을때 -->
            <%-- <c:if test="${pVO.nowPage<pVO.totalPage}"></c:if>--%>
                <li  class="next"><a class="page-link" href="javascript:reloadPage(${pVO.searchKey},${pVO.nowPage+1});"><img src="/img/cm/right-chevron.png" style=" width:20px;height:18px; " /></a></li>

         </ul>
        </div>

</div>


<script>
const tabList = document.querySelectorAll('.notice_tab .list li');
const contentList = document.querySelectorAll('.content');

tabList.forEach((tab, index) => {
tab.querySelector('.btn').addEventListener('click', function (e) {
    e.preventDefault();
    // 모든 탭 비활성화 및 콘텐츠 숨김
    tabList.forEach(t => t.classList.remove('selected'));
    contentList.forEach(content => content.classList.remove('active'));

    // 현재 탭 활성화 및 해당 콘텐츠 보여줌
    tab.classList.add('selected');
    contentList[index].classList.add('active');
});
});
</script>

</body>

</html>