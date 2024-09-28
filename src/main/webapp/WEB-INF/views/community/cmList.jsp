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
            <link href="/css/cmList.css" rel="stylesheet" type="text/css">
            </link>

        </head>



        <body>
            <div class="top_info">
                <div class="cm_tab">
                <h1>커뮤니티</h1>
                    <ul class="list">
                        <li class="selected">
                            <a href="#tap1" class="btn">자랑</a>
                        </li>
                        <li>
                            <a href="#tap2" class="btn">덕질</a>
                        </li>
                        <li>
                            <a href="#tap3" class="btn">친목</a>
                        </li>
                        <li>
                            <a href="#tap4" class="btn">팬아트</a>
                        </li>
                    </ul>
                </div>
            </div>


            <div class="container">
                <div class="cummunity" id="content">

                    <div class="search-area">
                        <div class="left-area">
                            <div class="head-box">
                                <select id="sel-head">
                                    <option value="head1">말머리 1</option>
                                    <option value="head2">말머리 2</option>
                                </select>
                            </div>
                            <div class="filter-box">
                                <select id="selectDirection">
                                    <option value="DEFAULT">최신글순</option>
                                    <option value="RECENT_REPLY">최신댓글순</option>
                                </select>
                            </div>
                        </div>

                        <div class="right-area">
                            <div class="select-box">
                                <select id="selectCategory">
                                    <option value="THREAD_TITLE_AND_CONTENT">제목 + 내용</option>
                                    <option value="THREAD_TITLE">제목</option>
                                    <option value="THREAD_CONTENT">내용</option>
                                </select>
                            </div>
                            <div class="search">
                                <input type="text" id="textSearch" placeholder="검색어를 입력하세요." />
                                <button type="button" id="btnSearch">검색</button>
                            </div>
                        </div>
                    </div>


                    <!-- 커뮤니티 리스트 -->
                    <div class="content active" id="tap1"> <!-- 기본적으로 active 클래스를 추가 -->
                        <div class="noticeList">

                            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                            <div class="row">
                                <div class="col-sm-1 p-2">[자랑]</div>
                                <div class="col-sm-7 p-2"><a href="/boards/view/1">제목</a></div>
                                <div class="col-sm-2 p-2">20024.01.01</div>
                                <div class="col-sm-2 p-2">3</div>
                            </div>
                            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                            <div class="row">
                                <div class="col-sm-1 p-2">1</div>
                                <div class="col-sm-7 p-2"><a href="/boards/view/1">제목</a></div>
                                <div class="col-sm-2 p-2">20024.01.01</div>
                                <div class="col-sm-2 p-2">3</div>
                            </div>
                        </div>
                    </div>

                    <div class="content" id="tap2">
                        <div class="FAQList">

                            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                            <div class="row">
                                <div class="col-sm-1 p-2">[덕질]</div>
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
                                <div class="col-sm-1 p-2">[친목]</div>
                                <div class="col-sm-7 p-2"><a href="/boards/view/1">니ㅏ런ㅇ라ㅣ</a></div>
                                <div class="col-sm-2 p-2">20024.01.01</div>
                                <div class="col-sm-2 p-2">3</div>
                            </div>
                            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                            <div class="row">
                                <div class="col-sm-1 p-2">[친목]</div>
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
                                <div class="col-sm-1 p-2">[팬아트]</div>
                                <div class="col-sm-7 p-2"><a href="/boards/view/1">띠롱</a></div>
                                <div class="col-sm-2 p-2">20024.01.01</div>
                                <div class="col-sm-2 p-2">3</div>
                            </div>
                            <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                            <div class="row">
                                <div class="col-sm-1 p-2">[팬아트]</div>
                                <div class="col-sm-7 p-2"><a href="/boards/view/1">따란</a></div>
                                <div class="col-sm-2 p-2">20024.01.01</div>
                                <div class="col-sm-2 p-2">3</div>
                            </div>
                        </div>
                    </div>
            </div>


    <script>
        const tabList = document.querySelectorAll('.cm_tab .list li');
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