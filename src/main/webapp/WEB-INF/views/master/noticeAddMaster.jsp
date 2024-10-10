<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 공지사항 추가</title>

<!-- CKEditor 5 스크립트만 포함 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/super-build/ckeditor.js"></script>
<script>
 window.onload = function() {
     // CKEditor 5 초기화
     ClassicEditor.create(document.getElementById('content'))
         .then(editor => {
             window.editor = editor;  // 전역에 editor 객체 저장
             console.log('CKEditor 초기화 완료:', editor);
         })
         .catch(error => {
             console.error('CKEditor 초기화 오류:', error);
         });
 }

 function submitNoticeForm(event) {
     event.preventDefault();  // 기본 폼 제출 동작 방지

     // 제목 값 가져오기
     var title = document.getElementById('title').value.trim();
     if (title === '') {
         alert('제목을 입력하세요.');
         return false;
     }

     // CKEditor의 내용 가져오기
     const content = window.editor.getData();
     console.log('CKEditor Content:', content);

     // 로컬 스토리지에서 토큰 값 가져오기
     const token = localStorage.getItem('token'); // 'token'이 저장된 로컬 스토리지 키 확인
     console.log('토큰 값:', token);

     if (!token) {
         alert('로그인 토큰을 찾을 수 없습니다. 로그인 후 다시 시도해 주세요.');
         return false;
     }

     // Ajax 요청
  $.ajax({
      url: '/master/noticeAddMasterOk',
      type: 'POST',
      contentType: 'application/json; charset=UTF-8',  // JSON 형식으로 설정
      data: JSON.stringify({
          title: $('#title').val(),  // 공지사항 제목
          content: window.editor.getData()  // CKEditor의 내용
      }),
      beforeSend: function(xhr) {
          const token = localStorage.getItem('token');  // 로컬 스토리지에서 토큰 값 가져오기
          if (token) {
              xhr.setRequestHeader('Authorization', 'Bearer ' + token);  // Authorization 헤더에 토큰 설정
              console.log('Authorization 헤더 설정:', 'Bearer ' + token);
          } else {
              console.error('로컬 스토리지에 토큰 값이 없습니다.');
              alert('로그인 후 다시 시도해 주세요.');
          }
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
   }
</script>
<div class="noticeAdd">
<h2>공지사항 등록</h2>
<form id="noticeForm" method="POST" action="/master/noticeAddMasterOk" onsubmit="return submitNoticeForm()">
    <div>
        <label for="title">제목:</label>
        <input type="hidden" name="idx" />
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
