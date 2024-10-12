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