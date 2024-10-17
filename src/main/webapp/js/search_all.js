function reviewTab(tabId) {
    // 모든 탭을 숨김
    document.getElementById("tab1").classList.remove("on");
    document.getElementById("tab1").classList.add("off");
    document.getElementById("tab2").classList.remove("on");
    document.getElementById("tab2").classList.add("off");

    // 클릭한 탭만 보여줌
    document.getElementById(tabId).classList.remove("off");
    document.getElementById(tabId).classList.add("on");

    // tab_on 클래스를 설정
    const tabs = document.querySelectorAll(".search_all_tabmenu li");
    tabs.forEach((tab) => tab.classList.remove("tab_on"));

    // 클릭한 탭에 tab_on 추가
    if (tabId === "tab1") {
      tabs[0].classList.add("tab_on");
    } else if (tabId === "tab2") {
      tabs[1].classList.add("tab_on");
    }
}

function search_all() {
    const searchKey = $('#search_key').val();

    if (searchKey == "") {
        alert('검색어를 입력하세요.');
        return false;
    }

    // 검색어를 URL에 쿼리 파라미터로 추가하여 페이지 이동
    window.location.href = `/search?search_key=${encodeURIComponent(searchKey)}`;
}

$(function(){
    $("#search_key").keyup(function (event) {
    if (event.key == "Enter") {
        search_all();
      }
    });
});
