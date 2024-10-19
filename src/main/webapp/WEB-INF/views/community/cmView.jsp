<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

	<link href="/css/cmView.css" rel="stylesheet" type="text/css">
<script>
var useridx; // 해당 페이지에서 모두 사용 가능하도록! 전역변수로 선언
var userid;
var currentCommIdx;// 현재 페이지의 comm_idx를 전역 변수로 설정

window.onload = function(){
    console.log("호출");

    var token = localStorage.getItem("token"); //토근 값 가져오기
    if(token != "" && token != null){
        $.ajax({
            url:"/getuser",
            type:"get",
            data:{Authorization:token},
            success: function(vo){
                console.log("로그인된 사용자 ID:" + userid);

                userid = vo.userid;
                useridx = vo.idx;

                console.log(userid);
                console.log(useridx);

                },
                error: function(){
                    console.error("로그인 여부 확인 실패");
                    document.querySelector(".new_write").style.display = "none"
                }
        });
        }
        };

</script>


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

                    </div></a>



               <c:if test="${previousPost == null}"></c:if>

               <c:if test="${nextPost != null}"></c:if>
               <a href="/cmView/${tun.idx}">

                <div class="list_next">
                    <i class="bi bi-chevron-down"></i>다음페이지
                </div></a>




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

    <!-- 댓글 등록 -->
     function regiComm() {

        alert(useridx);
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
                 loadComments(comm_idx);// 댓글 추가 후 댓글 목록 다시 불러오기
                 $('#textSearch').val('');// 댓글 입력창 비우기
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
              currentCommIdx = comm_idx;
              $.ajax({
                  url: "/getComment",
                  type: "GET",
                  data: { comm_idx: comm_idx },
                  success: function(comments) {
                      let replyList = $('#replyList');
                      replyList.empty();

                      // 댓글을 렌더링
                      comments.forEach(comment => {
                          let indentLevel = comment.depth * 30;  // depth에 따라 들여쓰기 설정

                          let comm = '<div class="comment-' + comment.idx + '" style="margin-left: ' + indentLevel + 'px;">';
                          comm += '<p><strong>' + comment.userid + '</strong><br/><p>' + comment.content + '</p>';
                          comm += '<p>' + comment.regDT + '</p>';

                          if (comment.useridx === useridx) {
                              comm += '<input type="button" value="수정" onclick="editComment('+comment.idx+')"/>'+
                                      '<input type="button" value="삭제" onclick="deleteComment('+comment.idx+')"/>';

                              comm += '<div id="edit-form-' + comment.idx + '" style="display:none;">' +
                                      '<textarea id="edit-textarea-' + comment.idx + '">' + comment.content + '</textarea>' +
                                      '<button onclick="updateComment('+comment.idx+','+comment.comm_idx+')">수정하기</button>' +
                                      '</div>';
                          }

                          // 댓글의 depth가 2 이상이면 답글 쓰기 비활성화 (자식 댓글은 depth가 2이므로)
                          if (comment.depth < 2) {  // depth가 2 미만일 경우에만 답글 허용
                              comm += '<input type="button" value="답글쓰기" onclick="toggleReplyInput('+comment.idx+')"/>';
                              comm += '<div id="replyInput-' + comment.idx + '" style="display:none;">' +
                                      '<input type="text" id="replyContent-' + comment.idx + '" placeholder="댓글을 남겨보세요." />' +
                                      '<button onclick="regiReply(' + comment.idx + ',' + comment.comm_idx + ')">등록</button>' +
                                      '</div>';
                          }
                          //else {
                              //comm += '<p>더 이상 답글을 달 수 없습니다.</p>';
                          //}

                          comm += '</div>';
                          replyList.append(comm);
                      });
                  },
                  error: function(xhr, status, error) {
                      console.error("댓글 로드 오류:", error);
                  }
              });
          }
    function test(testidx){
    alert(testidx);
    }

     function regiReply(commentIdx, comm_idx) {//원댓글의 idx + 게시물의 idx
              //let contents =  $('[id=replyContent-${comment.idx}]').val();
              const content = document.querySelector("#replyContent-"+commentIdx).value;

              alert(content);

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
              postData.append("commentIdx", commentIdx);
              postData.append("comm_idx", comm_idx);


              // AJAX 요청 보내기
              $.ajax({
                      url: "/regiReply",
                      type: "POST",
                      data: postData.toString(),
                      contentType: "application/x-www-form-urlencoded",
                      headers: {
                          "Authorization": `Bearer ${token}`  // Authorization 헤더에 JWT 토큰 추가
                      },
                      success: function(data) {
                          alert('답글이 등록되었습니다.');  // 성공 메시지

                          // comm_idx를 success 콜백 함수 내에서 사용 가능하게 함
                          loadComments(comm_idx);  // 댓글 추가 후 댓글 목록 다시 불러오기

                          // 입력 폼을 비웁니다.
                          const replyContentElement = document.querySelector("#replyContent-" + commentIdx);
                          if (replyContentElement) {
                              replyContentElement.value = '';  // 요소가 존재하는 경우에만 값을 비웁니다.
                          } else {
                              console.error("Element #replyContent-" + commentIdx + " not found.");
                          }
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

        //댓글입력폼
       function toggleReplyInput(commentIdx) { //뭘쓰든 상관이 없어요! 본인만 알아부보세요!
        alert(commentIdx);
           const replyInput = document.getElementById("replyInput-"+commentIdx);
           if (replyInput.style.display === 'none') {
               replyInput.style.display = 'block'; // 보여주기
           } else {
               replyInput.style.display = 'none'; // 숨기기
           }
       }

     // 댓글 수정
     function editComment(commentIdx) {//원댓글의 인덱스값
          const className = ".comment-"+commentIdx;
          console.log("a" + className);
         // 댓글 내용을 가져오기 위해 댓글의 텍스트를 담고 있는 요소를 찾습니다.
         const commentDiv = document.querySelector(".comment-"+commentIdx);
         console.log("b", commentDiv, commentIdx);

         if (commentDiv) {
            console.log("check", commentDiv);
             // 댓글 내용 가져오기
             const commentContent = commentDiv.querySelectorAll('p')[1].textContent;
             //const commentContent = commentDiv.querySelector('p').textContent;

             // 수정 폼의 textarea에 댓글 내용을 설정합니다.
             const editTextarea = document.querySelector("#edit-textarea-"+commentIdx);
             if (editTextarea) {
                 editTextarea.value = commentContent; // 댓글 내용을 textarea에 설정
             }

             // 수정 폼 보이기
             const editForm = document.querySelector("#edit-form-"+commentIdx);
             if (editForm.style.display === 'none') {
                 editForm.style.display = 'block'; // 수정 폼을 보여줍니다.
             } else {
                 editForm.style.display = 'none'; // 숨기기
             }
         }
     }

     // 댓글 수정 처리
     function updateComment(commentIdx, comm_idx) {
         const editTextarea = document.querySelector("#edit-textarea-"+commentIdx);
         const updatedContent = editTextarea.value;

         // AJAX 요청으로 서버에 수정된 내용을 보냅니다.
         $.ajax({
             url: '/updateComment',
             type: 'POST',
             data: {
                 idx: commentIdx,
                 content: updatedContent,
                 comm_idx : comm_idx
             },
             success: function(response) {
                if (response.message === "댓글 수정 성공") {
                        alert('댓글이 수정되었습니다.');
                        loadComments(response.comm_idx); // 서버가 반환한 comm_idx로 댓글 목록을 다시 불러옵니다.
                 } else {
                        alert('댓글 수정에 실패했습니다.');
                  }
             },
             error: function(xhr, status, error) {
                 console.error("댓글 수정 오류:", error);
             }
         });
     }


     function deleteComment(idx) {
         console.log("삭제할 댓글의 idx: ", idx); // 여기서 idx 값을 로그로 확인
         $.ajax({
             url: '/deleteComment',
             type: 'POST',
             data: { idx: idx },
             success: function() {
                 alert('댓글이 삭제되었습니다.');
                 loadComments(currentCommIdx); // 댓글 목록 다시 불러오기
             },
             error: function(xhr, status, error) {
                 console.error("댓글 삭제 오류:", error);
             }
         });
     }

         // 페이지 로드 시 댓글 목록 가져오기
         $(document).ready(function() {
             let comm_idx = $('[name=no]').val();
             loadComments(comm_idx); // 댓글 목록 로드
         });




    </script>


