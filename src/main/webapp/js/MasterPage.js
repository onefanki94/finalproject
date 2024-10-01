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

        function searchTable() {
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
                function sortTable(columnIndex) {
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


