<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

	<link href="/css/cmView.css" rel="stylesheet" type="text/css">


    <section class="top_info">
        <div class="cm_tab">
            <h1>커뮤니티</h1>
            <div class="cm_opt">
                <ul class="list">
                    <li class="selected">
                        <a href="#tap1" class="btn">최신글보기</a>
                    </li>
                    <li>
                        <a href="#tap2" class="btn">자랑</a>
                    </li>
                    <li>
                        <a href="#tap4" class="btn">친목</a>
                    </li>
                    <li>
                        <a href="#tap4" class="btn">팬아트</a>
                    </li>
                    <li>
                        <a href="/allnotice" class="btn">통합공지</a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="cmView">
            <div class="viewInfo">
                <div class="row">
                    <div class="col-sm-1 custom-col">${vo.commtype}</div>
                    <div class="col-sm-10 custom-col">${vo.title}</div>
                    <div class="col-sm-1 text-end"><img src="/img/cm/ico_view.png">${vo.hit}</div>
                </div>
                <div class="row bg-highlight">
                    <div class="col-sm-10 p-2">${vo.useridx}</div>
                    <div class="col-sm-2 text-end">${vo.regDT}</div>
                </div>
            </div>

            <div class="cmContent">${vo.content}</div>

        </div>

        <!-- 댓 글 -->
           <div id="replyArea" style="margin-top:30px;" >
              <!-- 로그인이 된 경우 댓글 폼 표시하기 -->

                <form method="post" id="replyForm">
                 <div class="review-writer">
                     <div class="reply_input">
                     <input type="text" id="textSearch" placeholder="정책위반 댓글은 삭제될 수 있습니다." />
                     <button type="button" id="btnSearch">등록</button>
                    </div>

                   <!-- 원글 글번호 -->
                     <input type="hidden" name="no" value="${vo.idx}"/>
                  </div>
               </form>

           <!-- 댓글 목록 -->
           <div ></div>
              <div id="replyList"></div>
           </div>
        </div>

        <!-- 리스트 목록 -->
           <div class="list_section">
               <c:if test="${previousPost != null}"></c:if>
                    <a href="/cmView?idx=${vo.idx}">
                    <div class="list_pre">
                        <i class="bi bi-chevron-up"></i>이전페이지
                    </div></a>
               <c:if test="${previousPost == null}"></c:if>

               <c:if test="${nextPost != null}"></c:if>
               <a href="/cmView?idx=${vo.idx}">
                <div class="list_next">
                    <i class="bi bi-chevron-down"></i>다음페이지
                </div></a>

               <c:if test="${nextPost == null}"></c:if>
           </div>


    </div>





</body>
</html>