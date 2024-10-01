// ckeditor
    window.onload = function() {
                    CKEDITOR.ClassicEditor.create(document.getElementById('content'), option);
                }
                function FormCheck() {
                    // 입력 필드의 값을 가져오고 앞뒤 공백을 제거
                        var title = document.getElementById('title').value.trim();

                         // 제목이 비어있는지 검사
                        if (title === ' ') {
                            alert('글 제목을 입력하세요.');
                            return false;
                        }

                        // 제목에 큰따옴표(")나 작은따옴표(')가 있는지 검사
                        if (title.indexOf('"') !== -1 || title.indexOf("'") !== -1) {
                            alert('제목에 큰따옴표(")나 작은따옴표(\')를 사용할 수 없습니다.');
                            return false;
                        }
                    return true;
                }



// 주문 관리 에서 신규 주문 등 나타나게 하는 스크립트
function updateOrderStatusCounts(data) {
        // data는 서버나 API에서 가져온 주문 상태별 건수 데이터라고 가정
/*     document.getElementById('new-count').textContent = data.newOrders;
        document.getElementById('preparing-count').textContent = data.preparingOrders;
        document.getElementById('shipping-count').textContent = data.shippingOrders;
        document.getElementById('completed-count').textContent = data.completedOrders;*/
    }

    // 예시 데이터
    const orderData = {
        newOrders: 5,
        preparingOrders: 3,
        shippingOrders: 2,
        completedOrders: 10
    };

    // 페이지 로드 시 주문 상태 건수를 업데이트
    document.addEventListener('DOMContentLoaded', function() {
        updateOrderStatusCounts(orderData);
    });


// 일/월별 매출 관리
     // 탭 클릭 이벤트 처리
        document.querySelectorAll('.tab-item').forEach(tab => {
        console.log("hi");
            tab.addEventListener('click', function() {
            console.log("호출");
                // 모든 탭에서 active 클래스 제거
                document.querySelectorAll('.tab-item').forEach(item => item.classList.remove('active'));
                document.querySelectorAll('.tab-panel').forEach(panel => panel.classList.remove('active'));

                // 선택된 탭에 active 클래스 추가
                this.classList.add('active');
                document.getElementById(this.dataset.tab).classList.add('active');
            });
        });

/*
        // 검색 버튼 클릭 시 이벤트 처리 (필요 시 추가)
        document.getElementById('search-btn').addEventListener('click', function() {
            const startDate = document.getElementById('start-date').value;
            const endDate = document.getElementById('end-date').value;

            if (startDate && endDate) {
                console.log('검색 기간:', startDate, '부터', endDate, '까지');
                // 검색 로직 추가
            } else {
                alert('검색 기간을 설정하세요.');
            }
        });
*/
/*
        // 검색 버튼 클릭 시 이벤트 처리 (필요 시 추가)
        document.getElementById('search-btn').addEventListener('click', function() {
            const startDate = document.getElementById('start-date').value;
            const endDate = document.getElementById('end-date').value;

            if (startDate && endDate) {
                console.log('검색 기간:', startDate, '부터', endDate, '까지');
                // 검색 로직 추가
            } else {
                alert('검색 기간을 설정하세요.');
            }
        });
*/


