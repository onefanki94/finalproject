// 굿즈 상품 테이블 대분류 중분류 내용 스크립트
// 대분류와 중분류의 매핑 정보
const categoryMapping = {
"1": [
{ value: 10, text: "아우터" },
{ value: 11, text: "상의" },
{ value: 12, text: "하의" },
{ value: 13, text: "잡화" }
],
"2": [
{ value: 20, text: "아크릴" },
{ value: 21, text: "피규어" },
{ value: 22, text: "캔뱃지" },
{ value: 23, text: "슬로건" },
{ value: 24, text: "포스터" }
],
"3": [
{ value: 30, text: "필기류" },
{ value: 31, text: "노트&메모지" },
{ value: 32, text: "파일" },
{ value: 33, text: "스티커" },
{ value: 34, text: "달력" }
],
"4": [
{ value: 40, text: "컵&텀블러" },
{ value: 41, text: "쿠션" },
{ value: 42, text: "담요" },
{ value: 43, text: "기타" }
]
};

document.addEventListener('DOMContentLoaded', function () {
// DOM이 완전히 로드된 후 실행되도록 설정

// 대분류 select 요소
const mainCategorySelect = document.getElementById('code');

// 중분류 select 요소
const subCategorySelect = document.getElementById('sub-category');

// 요소가 존재하는지 확인
if (mainCategorySelect && subCategorySelect) {
 // 대분류 선택 시 중분류 옵션을 업데이트하는 함수
 mainCategorySelect.addEventListener('change', function () {
     const selectedMainCategory = mainCategorySelect.value;

     // 중분류 select 박스 초기화
     subCategorySelect.innerHTML = '<option value="">중분류 선택</option>';
     subCategorySelect.disabled = true;

     // 선택된 대분류에 해당하는 중분류 옵션 추가
     if (categoryMapping[selectedMainCategory]) {
         categoryMapping[selectedMainCategory].forEach(subCategory => {
             const option = document.createElement('option');
             option.value = subCategory.value;
             option.text = subCategory.text;
             subCategorySelect.appendChild(option);
         });

         // 중분류 선택 가능하도록 활성화
         subCategorySelect.disabled = false;
     }
 });
} else {
 console.error('대분류 또는 중분류 select 요소가 존재하지 않습니다.');
}
});

// ---------------------------------------------------------
$(document).ready(function() {
// 신고내역추가 버튼 클릭 시 이벤트
$('.addReportBtn').click(function() {
// 버튼에서 data-userid와 해당 행의 idx 가져오기
const userid = $(this).data('userid');
const idx = $(this).closest('tr').find('td:eq(1)').text();  // No 컬럼에서 idx 가져오기

// 모달의 hidden input에 값 설정
$('#userid').val(userid);
$('#idx').val(idx);

// 모달창 띄우기
$('#reportModal').modal('show');
});

// 폼 제출 이벤트
$('#reportForm').submit(function(event) {
event.preventDefault(); // 폼의 기본 제출 동작 막기

const token = localStorage.getItem('token'); // 로컬스토리지에서 토큰 가져오기
if (!token) {
   alert("로그인 토큰이 없습니다.");
   return;
}

const formData = $(this).serialize(); // 폼 데이터 직렬화

$.ajax({
   type: 'POST',
   url: '/master/reportinguserOK',
   headers: {
       'Authorization': `Bearer ${token}` // Authorization 헤더에 토큰 추가
   },
   data: formData,
   success: function(response) {
       alert('신고가 성공적으로 처리되었습니다.');
       location.reload(); // 페이지 새로고침
   },
   error: function() {
       alert('신고 처리 중 오류가 발생했습니다.');
   }
});
});
});

$(document).ready(function() {
// 상세보기 버튼 클릭 시
$('.detailBtn').on('click', function() {
var reviewIdx = $(this).data('idx');  // 버튼에서 idx 값 가져오기

// Ajax 요청으로 서버에서 리뷰 상세 정보를 가져옴
$.ajax({
   type: 'GET',
   url: '/master/getReviewDetail',  // 리뷰 상세정보를 가져오는 URL
   data: { idx: reviewIdx },
   success: function(response) {
       if (response) {
           // 이미지 파일이 존재할 경우만 이미지 경로 설정
           if (response.imgfile1) {
               // 이미지 경로 설정 (한글 및 공백 인코딩 처리)
               const imgPath1 = "reviewFileUpload/" + encodeURIComponent(response.imgfile1);
               $('#imgFile1').attr('src', imgPath1);
               console.log("이미지 1 경로: " + imgPath1);  // 디버깅용 로그
           } else {
               $('#imgFile1').attr('src', '/path/to/default-image.png');  // 기본 이미지 경로
           }

           if (response.imgfile2) {
               const imgPath2 = "reviewFileUpload/" + encodeURIComponent(response.imgfile2);
               $('#imgFile2').attr('src', imgPath2);
               console.log("이미지 2 경로: " + imgPath2);  // 디버깅용 로그
           } else {
               $('#imgFile2').attr('src', '/path/to/default-image.png');  // 기본 이미지 경로
           }

           // 서버로부터 받은 데이터를 모달에 표시
           $('#orderListIdx').text(response.order_idx);

           // 모달 창 띄우기
           $('#detailModal').modal('show');
       } else {
           alert('리뷰 상세 정보를 불러오지 못했습니다.');
       }
   },
   error: function() {
       alert('리뷰 상세 정보를 가져오는 데 실패했습니다.');
   }
});
});
});

$(document).ready(function() {
// 답변 버튼 클릭 시
$('.answerBtn').on('click', function() {
const idx = $(this).data('idx');  // 문의 ID
const title = $(this).data('title');  // 문의 제목
const content = $(this).data('content');  // 문의 내용

// 모달의 hidden input과 문의 제목, 내용 설정
$('#idx').val(idx);
$('#title').val(title);
$('#content').val(content);

// 모달 창 열기
$('#answerModal').modal('show');
});
});

// 답변 폼 제출 시 처리 (선택사항: AJAX로 제출하려면 아래 코드 사용)
$(document).ready(function() {
$('#answerForm').submit(function(event) {
 event.preventDefault();  // 폼 자동 제출 방지

 // 로컬스토리지에서 토큰 가져오기
 const token = localStorage.getItem('token');
 if (!token) {
   alert("로그인 토큰이 없습니다.");
   return;
 }

 const formData = $(this).serialize();  // 폼 데이터를 직렬화

 $.ajax({
   type: 'POST',
   url: '/master/QNAanswerOK',
   headers: {
     'Authorization': `Bearer ${token}`  // Authorization 헤더에 토큰 추가
   },
   data: formData,
   success: function(response) {
     alert('답변이 성공적으로 처리되었습니다.');
     location.reload();  // 페이지 새로고침
   },
   error: function(xhr, status, error) {
     console.error('Error:', xhr.responseText);  // 에러 메시지를 콘솔에 출력
     alert('답변 처리 중 오류가 발생했습니다.');
   }
 });
});
});

$(document).ready(function() {
     // 로컬 스토리지에서 토큰을 가져와 폼에 추가
     var token = localStorage.getItem('token');
     if (token) {
         $('#token').val(token);
     } else {
         alert('토큰이 없습니다. 다시 로그인해 주세요.');
         return;
     }

     // 폼 제출 시 AJAX 처리
     $('#aniAddForm').submit(function(event) {
         event.preventDefault();  // 기본 폼 제출 방식을 방지

         // 폼 데이터를 객체로 직렬화
         var formData = new FormData(this);

         $.ajax({
             url: '/master/aniAddMasterOk',  // 서버의 애니 추가 처리 URL
             type: 'POST',
             data: formData,
             contentType: false,
             processData: false,
             success: function(response) {
                 alert('애니가 성공적으로 추가되었습니다.');
                 window.location.href = '/master/aniMasterList';  // 성공 시 리다이렉트할 페이지
             },
             error: function(xhr, status, error) {
                 console.error('에러:', xhr.responseText);
                 alert('애니 추가 중 오류가 발생했습니다.');
             }
         });
     });
 });

$(document).ready(function() {
// 삭제 버튼 클릭 시
$('.btn-outline-danger').on('click', function() {
var idx = $(this).data('idx'); // 삭제할 애니메이션의 idx 값

// 삭제 여부를 사용자에게 확인
if (confirm("정말로 삭제하시겠습니까?")) {
// AJAX 요청으로 삭제 요청을 서버에 보냄
$.ajax({
type: 'POST',  // 삭제 요청은 POST로
url: '/master/aniDeleteMaster/' + idx,  // 서버에 삭제 요청을 보낼 URL
success: function(response) {
                     alert('해당 ' + idx + ' 번호의 애니가 삭제되었습니다.');
                     window.location.href = '/master/aniMasterList';  // 성공 시 리스트로 리다이렉트
                 },
                 error: function(xhr, status, error) {
                     console.error('삭제 중 에러 발생:', xhr.responseText);
                     alert('삭제 중 오류가 발생했습니다.');
                 }
             });
         }
     });
 });