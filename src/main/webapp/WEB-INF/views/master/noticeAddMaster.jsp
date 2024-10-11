<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 공지사항 추가</title>

<!-- CKEditor 5 스크립트만 포함 -->
    <link rel="stylesheet" href="/ckeditor/ckeditor.css"/>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
      <script src="/ckeditor/ckeditor.js"></script>
<script>
window.onload = () => {
    // CKEditor 5 초기화
    CKEDITOR.ClassicEditor.create(document.getElementById('content'), option)
        .then(editor => {
            window.editorInstance = editor;  // 전역에 editor 객체 저장
            console.log('CKEditor 초기화 완료:', editor);
        })
        .catch(error => {
            console.error('CKEditor 초기화 오류:', error);
        });

    // 로컬스토리지에서 토큰값 가져오기
    var token = localStorage.getItem('token');
    document.getElementById('token').value = token;
};

// 공지사항 등록 함수
function submitNoticeForm() {
    const title = document.getElementById('title').value;
    const content = window.editorInstance.getData().trim();  // CKEditor에서 content 가져오기
    const token = localStorage.getItem('token');  // 로컬 스토리지에서 토큰 값 가져오기

    if (!token) {
        alert('로그인 후 다시 시도해 주세요.');
        location.href = '/user/login';  // 로그인 페이지로 이동
        return false;
    }

    // URL 인코딩 형식으로 데이터 설정
    const postData = new URLSearchParams();
    postData.append('title', title);
    postData.append('content', content);

    // 아작스 요청
    $.ajax({
        url: '/master/noticeAddMasterOk',
        type: 'POST',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',  // Content-Type을 URL 인코딩 형식으로 설정
        data: postData.toString(),  // URLSearchParams를 문자열로 변환하여 전송
        beforeSend: function(xhr) {
            // Authorization 헤더에 JWT 토큰 설정
            const authHeader = 'Bearer ' + token;
            xhr.setRequestHeader('Authorization', authHeader);
            console.log('Authorization 헤더 설정:', authHeader);
        },
        success: function(response) {
            console.log('Response:', response);
            alert('공지사항이 성공적으로 등록되었습니다!');
            window.location.href = '/master/noticeMasterList';  // 공지사항 목록 페이지로 이동
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('공지사항 등록 중 오류가 발생했습니다.');
        }
    });

    return false;  // 폼 제출 중지
}
</script>
<div class="noticeAdd">
<h2>공지사항 등록</h2>
<form id="noticeForm" method="POST" action="/master/noticeAddMasterOk" onsubmit="return submitNoticeForm()">
    <div>
        <label for="title">제목:</label>
        <input type="hidden" name="idx" />
        <input type="hidden" id="token" name="token" />
        <input type="text" id="title" name="title" placeholder="공지사항 제목을 입력하세요." required>
    </div>

    <div>
        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="10"></textarea>
    </div>
    <div>
        <input type="submit" value="공지사항 등록">
    </div>
</form>
</div>
