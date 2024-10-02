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

// ------------------------------------------------------
  // 검색 기능
        function searchTable() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toLowerCase();
            table = document.querySelector(".user-list tbody");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                tr[i].style.display = "none"; // 기본적으로 숨김 처리
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toLowerCase().indexOf(filter) > -1) {
                            tr[i].style.display = ""; // 검색어와 일치하면 보여줌
                            break;
                        }
                    }
                }
            }
        }

        // 테이블 정렬 기능
        function sortTable(columnIndex) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.querySelector(".user-list");
            switching = true;
            dir = "asc"; // 기본 정렬 방향: 오름차순
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[columnIndex];
                    y = rows[i + 1].getElementsByTagName("TD")[columnIndex];
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }

        function searchTable1() {
                    var input, filter, table, tr, td, i, j, txtValue;
                    input = document.getElementById("searchInput");
                    filter = input.value.toLowerCase();
                    table = document.querySelector(".anime-list tbody");
                    tr = table.getElementsByTagName("tr");

                    for (i = 0; i < tr.length; i++) {
                        tr[i].style.display = "none"; // 기본적으로 숨김 처리
                        td = tr[i].getElementsByTagName("td");
                        for (j = 0; j < td.length; j++) {
                            if (td[j]) {
                                txtValue = td[j].textContent || td[j].innerText;
                                if (txtValue.toLowerCase().indexOf(filter) > -1) {
                                    tr[i].style.display = ""; // 검색어와 일치하면 보여줌
                                    break;
                                }
                            }
                        }
                    }
                }

                // 테이블 정렬 기능
                function sortTable1(columnIndex) {
                    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                    table = document.querySelector(".anime-list");
                    switching = true;
                    dir = "asc"; // 기본 정렬 방향: 오름차순
                    while (switching) {
                        switching = false;
                        rows = table.rows;
                        for (i = 1; i < (rows.length - 1); i++) {
                            shouldSwitch = false;
                            x = rows[i].getElementsByTagName("TD")[columnIndex];
                            y = rows[i + 1].getElementsByTagName("TD")[columnIndex];
                            if (dir == "asc") {
                                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                    shouldSwitch = true;
                                    break;
                                }
                            } else if (dir == "desc") {
                                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                    shouldSwitch = true;
                                    break;
                                }
                            }
                        }
                        if (shouldSwitch) {
                            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                            switching = true;
                            switchcount++;
                        } else {
                            if (switchcount == 0 && dir == "asc") {
                                dir = "desc";
                                switching = true;
                            }
                        }
                    }
                }

// ------------------------------------------------------
// 일/월별 매출 관리
     document.addEventListener("DOMContentLoaded", function () {
             const tabs = document.querySelectorAll('.tab-item');
             const panels = document.querySelectorAll('.tab-panel');

             tabs.forEach(tab => {
                 tab.addEventListener('click', function (e) {
                     e.preventDefault();

                     // 탭 활성화 처리
                     tabs.forEach(item => item.classList.remove('active'));
                     tab.classList.add('active');

                     // 패널 활성화 처리
                     panels.forEach(panel => panel.classList.remove('active'));
                     const targetPanel = document.querySelector(tab.getAttribute('href'));
                     targetPanel.classList.add('active');
                 });
             });
         });

document.addEventListener('DOMContentLoaded', function () {

    /* ========== 통합 일별/월별 차트 생성 ========== */
    const combinedData = {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [
            {
                label: '일별 주문 건수',
                data: [120, 140, 150, 130, 170, 200, 180, 220, 240, 210, 230, 260],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',  // 라인 아래 채우기 색상
                borderColor: 'rgba(54, 162, 235, 1)',         // 라인 색상
                borderWidth: 2,
                fill: true,  // 라인 아래 채우기 설정
                tension: 0.3,  // 곡선의 부드러움 정도
                yAxisID: 'y-axis-day'  // 첫 번째 Y축과 연결
            },
            {
                label: '월별 주문 건수',
                data: [900, 1100, 1050, 950, 1250, 1450, 1200, 1550, 1600, 1400, 1500, 1700],
                backgroundColor: 'rgba(255, 159, 64, 0.2)',
                borderColor: 'rgba(255, 159, 64, 1)',
                borderWidth: 2,
                fill: true,  // 라인 아래 채우기 설정
                tension: 0.3,  // 곡선의 부드러움 정도
                yAxisID: 'y-axis-month'  // 두 번째 Y축과 연결
            }
        ]
    };

    const combinedConfig = {
        type: 'line',  // 차트 타입을 'line'으로 설정
        data: combinedData,
        options: {
            responsive: true,  // 반응형
            scales: {
                'y-axis-day': {  // 첫 번째 Y축 (일별 주문 건수)
                    type: 'linear',
                    position: 'left',
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return value + ' 건';  // y축 단위를 '건'으로 표시
                        }
                    },
                    title: {
                        display: true,
                        text: '일별 주문 건수'
                    }
                },
                'y-axis-month': {  // 두 번째 Y축 (월별 주문 건수)
                    type: 'linear',
                    position: 'right',
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return value + ' 건';  // y축 단위를 '건'으로 표시
                        }
                    },
                    grid: {
                        drawOnChartArea: false  // 두 번째 Y축의 그리드 라인 제거
                    },
                    title: {
                        display: true,
                        text: '월별 주문 건수'
                    }
                },
                x: {  // X축 설정
                    title: {
                        display: false,
                        text: '월'
                    }
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                }
            }
        }
    };

    const combinedDailyChart = new Chart(
        document.getElementById('combinedDailyChartView'),
        combinedConfig
    );
});

    document.addEventListener('DOMContentLoaded', function () {

        /* ========== 하루 평균 유저 수 차트 생성 (Line Chart) ========== */
        const avgUserDailyData = {
            labels: ['월', '화', '수', '목', '금', '토', '일'],  // X축 레이블
            datasets: [{
                label: '하루 평균 유저 수',
                data: [20, 130, 140, 50, 160, 70, 180],  // Y축 데이터 값
                backgroundColor: 'rgba(75, 192, 192, 0.2)',  // 채우기 색상
                borderColor: 'rgba(75, 192, 192, 1)',  // 선 색상
                borderWidth: 2,  // 선 두께
                fill: true,  // 선 아래 채우기
                tension: 0.3  // 곡선의 부드러움 정도 (0 = 직선, 1 = 곡선)
            }]
        };

        const avgUserDailyConfig = {
            type: 'line',  // 라인 차트 사용
            data: avgUserDailyData,
            options: {
                responsive: true,  // 반응형 설정
                scales: {
                    y: {  // Y축 설정
                        beginAtZero: true,  // Y축 0부터 시작
                        ticks: {
                            callback: function (value) {
                                return value + '명';  // Y축 눈금 단위 '명'
                            }
                        },
                        title: {
                            display: true,  // Y축 제목 표시
                            text: '유저 수 (명)',  // Y축 제목 텍스트 추가
                            font: {
                                size: 16  // 폰트 크기 설정
                            }
                        }
                    },
                    x: {  // X축 설정
                        title: {
                            display: false,
                            text: '요일',  // X축 제목 텍스트
                            font: {
                                size: 14  // 폰트 크기 설정
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,  // 범례 표시
                        position: 'top'  // 범례 위치
                    }
                }
            }
        };

        const avgUserDailyChart = new Chart(
            document.getElementById('avgUserDailyChartView'),
            avgUserDailyConfig
        );
    });