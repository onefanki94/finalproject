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
     window.onload =()=>{
         CKEDITOR.ClassicEditor.create(document.getElementById("content"),option)
             .then(editor => {
                 console.log('CKEditor 5 is ready.');
                 console.log("로컬스토리지 토큰값 : ", token);
                 window.editorInstance = editor; // 에디터 인스턴스를 전역 변수로 저장
             })
             .catch(error => {
                 console.error('CKEditor 5 initialization error:', error);
             });


         var token = localStorage.getItem("token"); //토근 값 가져오기
         document.getElementById("token").value=token;


     };




    // 글 작성 폼 제출 시 호출되는 함수
    function commuFormCheck() {
        // 입력값 유효성 검사
        if (!window.editorInstance || window.editorInstance.getData().trim() === '') {
            alert('내용을 입력하세요.');
            return false;
        }

        const token = localStorage.getItem("token");  // 로컬 스토리지에서 JWT 토큰 가져오기
        if (!token) {
            alert('로그인이 필요합니다.');  // 토큰이 없을 경우 로그인 필요 메시지
            return false;
        }

        // 입력 필드 값 가져오기
        const code = document.getElementById("code").value;
        const title = document.getElementById("title").value;
        const content = window.editorInstance.getData().trim(); // CKEditor의 내용 가져오기

        if (!code || code.trim() === "") {
            alert("분류를 선택하세요.");  // code가 비어 있으면 경고 메시지 출력
            System.out.println("Received code: " + code);
            return false;
        }

        // 서버로 전송할 데이터를 URLSearchParams 객체에 추가
        const postData = new URLSearchParams();
        postData.append("code", code);  // code 파라미터 추가
        postData.append("title", title);
        postData.append("content", content);

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
            if (response.status === 401) {
                alert('인증에 실패했습니다. 다시 로그인하세요.');
                return false;
            }
            return response.text();
        })
        .then(data => {
            document.write(data);  // 서버에서 반환된 HTML을 페이지에 출력
        })
        .catch(error => console.error("Error:", error));

        return false;  // 기본 폼 제출 방지
    }

 </script>
</body>
</html>