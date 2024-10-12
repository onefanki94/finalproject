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
                <form method="post" id="replyForm">
                 <div class="review-writer">
                     <div class="reply_input">
                     <input type="text" id="textSearch" placeholder="정책위반 댓글은 삭제될 수 있습니다." />
                     <button type="button" id="btnSearch" onclick="regiComm()">등록</button>
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
                    <a href="/cmView/${go.idx}">
                        <div class="list_pre">
                            <i class="bi bi-chevron-up"></i>이전페이지
                        </div>
                    </a>
               <c:if test="${previousPost == null}"></c:if>

               <c:if test="${nextPost != null}"></c:if>
               <a href="/cmView/${tun.idx}">
                   <div class="list_next">
                       <i class="bi bi-chevron-down"></i>다음페이지
                   </div>
               </a>

               <c:if test="${nextPost == null}"></c:if>
           </div>
        <div class="listBt">
            <a class="btn btn-secondary btn-sm" href="/cmEdit/${vo.idx}" role="button">
                수정
            </a>
            <a class="btn btn-secondary btn-sm" href="/cmList" role="button">
                목록
            </a>
            <a class="btn btn-secondary btn-sm" role="button" onclick="confirmDelete(${vo.idx});">
                삭제
            </a>
        </div>

    </div>

    <!-- 삭제 확인 및 처리 -->
    <script type="text/javascript">
        function confirmDelete(idx) {
            if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
                // 삭제 확인 시 삭제 URL로 이동
                location.href = '/cmDelete/' + idx;
            }
        }

     function regiComm() {
         // CKEditor 내용 유효성 검사

         let comm_idx = $('[name=no]').val();
         let content =  $('[id=textSearch]').val();
         // 로컬 스토리지에서 JWT 토큰 가져오기
         const token = localStorage.getItem("token");
         if (!token) {
             alert('로그인이 필요합니다.');  // 토큰이 없을 경우 로그인 필요 메시지
             location.href = "/user/login";  // 로그인 페이지로 이동
             return false;
         }

         // 서버로 전송할 데이터를 FormData 객체에 추가
         const postData = new URLSearchParams();
         postData.append("content", content);
         postData.append("token", token);  // token 추가
         postData.append("comm_idx", comm_idx);

         // AJAX 요청 보내기
         $.ajax({
             url: "/regiComm",
             type: "POST",
             data: postData.toString(),
             contentType: "application/x-www-form-urlencoded",
             headers: {
                 "Authorization": `Bearer ${token}`  // Authorization 헤더에 JWT 토큰 추가
             },
             success: function(data) {
                 alert('댓글이 등록되었습니다.');  // 성공 메시지
                 //location.href = "/cmList";  // 글 목록 페이지로 이동
             },
             error: function(xhr, status, error) {
                 if (xhr.status === 401) {
                     alert('인증에 실패했습니다. 다시 로그인하세요.');
                     location.href = "/user/login";  // 로그인 페이지로 이동
                 } else {
                     alert("요청 처리 중 오류가 발생했습니다.");
                 }
                 console.error("Error:", error);  // 오류 출력
             }
         });

         return false;  // 기본 폼 제출 방지
     }

     // 댓글 목록 로드 함수
         function loadComments(comm_idx) {
             $.ajax({
                 url: "/getComment",  // 댓글을 가져오는 URL
                 type: "GET",
                 data: { comm_idx: comm_idx },
                 success: function(comments) {

                 console.log(comments);
                     // 댓글 목록 갱신
                     let replyList = $('#replyList');
                     replyList.empty(); // 기존 댓글 목록 비우기

                     comments.forEach(comment => {
                         console.log(comment.content);
                         // 댓글 HTML 구조를 만들어서 추가
                         const comm = ' <div class="comment"> ' +
                                      '<p><strong> ' + comment.userid + '</strong> : '+ comment.content + '</p>' +
                                      '  <p>' + comment.regDT + '</p>'+
                                    '</div>';
                         replyList.append(comm);
                     });

                     console.log("Reply List HTML: ", replyList.html()); // 최종 HTML 출력
                 },
                 error: function(xhr, status, error) {
                     console.error("댓글 로드 오류:", error);
                 }
             });


         }

         // 페이지 로드 시 댓글 목록 가져오기
         $(document).ready(function() {
             let comm_idx = $('[name=no]').val();
             loadComments(comm_idx); // 댓글 목록 로드
         });

    </script>


