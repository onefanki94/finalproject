<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/ckeditor/ckeditor.css"/>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>
    <link href="/css/cmWrite.css" rel="stylesheet" type="text/css">



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
        <form class="write_tbl" method="post" action="/cmWriteOk" onsubmit="return commuFormCheck()">
            <table class="cm-write">
                <tr>
                    <th>
                        <div class="topics">
                            <select class="filter-dropdown" id="code" name="code" value="">
                                <option value="">분류를 선택하세요</option>
                                <option value="10">자랑</option>
                                <option value="20">덕질</option>
                                <option value="30">친목</option>
                                <option value="40">팬아트</option>
                            </select>
                        </div>
                    </th>
                    <td>
                        <input type="text" name="title" value="" id="title" size="100" placeholder="제목을 입력하세요">
                    </td>
                </tr>
            </table>

            <div>
                <textarea id="content" name="content" class="smarteditor2" placeholder="내용을 입력하세요" style="width: 90%; height: 100%;"></textarea>
            </div>

            <div style="margin: 30px auto 0 auto; text-align: center;">
                <button type="submit" class="write_btn">글등록하기</button>
            </div>

        </form>
    </div>

<script>
     window.onload = () => {
         // 로컬 스토리지에서 JWT 토큰 가져오기
         var token = localStorage.getItem("token");  // 토큰 값 가져오기

         if (!token) {
             alert("로그인이 필요합니다.");
             location.href = "/user/login";  // 로그인 페이지로 이동
             return;
         }

         console.log("로컬 스토리지 토큰 값: ", token);  // 로컬 스토리지에서 가져온 토큰 값 출력

         // CKEditor5 초기화
         CKEDITOR.ClassicEditor.create(document.getElementById("content"), option)
             .then(editor => {
                 console.log("CKEditor 5 is ready.");
                 window.editorInstance = editor;  // 에디터 인스턴스를 전역 변수로 저장

             })
             .catch(error => {
                 console.error("CKEditor 5 initialization error:", error);
             });

         // JWT 토큰을 hidden input 필드에 설정 (만약 필요하다면)
         const tokenInput = document.getElementById("token");
         if (tokenInput) {
             tokenInput.value = token;
         }
     };

     // 글 작성 폼 제출 시 호출되는 함수
     function commuFormCheck() {
         // CKEditor 내용 유효성 검사
         if (!window.editorInstance || window.editorInstance.getData().trim() === '') {
             alert('내용을 입력하세요.');
             return false;
         }

         // 입력 필드 값 가져오기
         const code = document.getElementById("code").value;
         const title = document.getElementById("title").value;
         const content = window.editorInstance.getData().trim(); // CKEditor의 내용 가져오기

         if (!code || code.trim() === "") {
             alert("분류를 선택하세요.");  // code가 비어 있으면 경고 메시지 출력
             console.log("Received code: " + code);  // 디버그용 로그 출력
             return false;
         }

         // 로컬 스토리지에서 JWT 토큰 가져오기
         const token = localStorage.getItem("token");
         if (!token) {
             alert('로그인이 필요합니다.');  // 토큰이 없을 경우 로그인 필요 메시지
             location.href = "/user/login";  // 로그인 페이지로 이동
             return false;
         }

         // 서버로 전송할 데이터를 URLSearchParams 객체에 추가
         const postData = new URLSearchParams();
         postData.append("code", code);  // code 파라미터 추가
         postData.append("title", title);
         postData.append("content", content);

         console.log("JWT 토큰: ", token);  // JWT 토큰 값 출력
         console.log("Post Data: ", postData.toString());  // 전송할 데이터 출력

         // fetch를 사용하여 POST 요청 보내기
         fetch("/cmWriteOk", {
             method: "POST",
             headers: {
                 "Content-Type": "application/x-www-form-urlencoded",
                 "Authorization": `Bearer ${token}`  // Authorization 헤더에 JWT 토큰 추가
             },
             body: postData
         })
         .then(response => {
             console.log("Response Status: ", response.status);  // 서버 응답 상태 코드 출력

             // 401: 인증 실패
             if (response.status === 401) {
                 alert('인증에 실패했습니다. 다시 로그인하세요.');
                 location.href = "/user/login";  // 로그인 페이지로 이동
                 return false;
             }

             // 403: 권한 없음
             if (response.status === 403) {
                 alert('권한이 없습니다. 관리자에게 문의하세요.');
                 return false;
             }

             // 응답이 성공적으로 처리된 경우에도 로그인 페이지로 이동할 수 있으므로, 응답 데이터를 로그로 출력
             return response.text().then(data => {
                 console.log("Response Data: ", data);  // 서버에서 반환된 데이터를 출력하여 확인
                 if (data.includes("로그인") || data.includes("login")) {
                     alert("세션이 만료되었거나 인증되지 않은 사용자입니다. 다시 로그인하세요.");
                     location.href = "/user/login";
                     return false;
                 }
                 document.write(data);  // 서버에서 반환된 HTML을 페이지에 출력
             });
         })
         .catch(error => {
             console.error("Error:", error);  // 오류 출력
             alert("요청 처리 중 오류가 발생했습니다. 다시 시도해 주세요.");
         });

         return false;  // 기본 폼 제출 방지
     }

 </script>
</body>
</html>