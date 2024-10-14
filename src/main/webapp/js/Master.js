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
                   // 신고내역 추가 버튼 클릭 시
                   $('.btn-outline-success').click(function() {
                       var userId = $(this).closest('tr').find('td:eq(2)').text();
                       $('#userid').val(userId); // 유저 아이디를 모달에 전달
                       $('#reportModal').modal('show');
                   });

                   // 신고 해제 버튼 클릭 시
                   $('#removeReportBtn').click(function() {
                       var userId = $('#userid').val(); // 모달창에서 선택된 유저 아이디 가져오기
                       if (confirm('해당 신고를 해제하시겠습니까?')) {
                           $.ajax({
                               type: 'POST',
                               url: 'removeReport.jsp', // 신고 해제 처리를 담당하는 페이지로 이동
                               data: { userid: userId },
                               success: function(response) {
                                   alert('신고가 해제되었습니다.');
                                   location.reload(); // 페이지를 새로고침하여 변경 사항 반영
                               },
                               error: function() {
                                   alert('신고 해제 중 오류가 발생했습니다.');
                               }
                           });
                       }
                   });
               });