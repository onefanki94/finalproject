function reviewTab(tabId) {
  // 모든 탭 콘텐츠를 숨김
  document.getElementById("tab1").classList.remove("on");
  document.getElementById("tab1").classList.add("off");
  document.getElementById("tab2").classList.remove("on");
  document.getElementById("tab2").classList.add("off");

  // 클릭한 탭만 보여줌
  document.getElementById(tabId).classList.remove("off");
  document.getElementById(tabId).classList.add("on");

  // 모든 탭에서 'search_off' 클래스를 제거하고 다시 설정
  const tabs = document.querySelectorAll(".login_tab li");
  tabs.forEach((tab) => tab.classList.add("search_off"));

  // 선택된 탭의 스타일 적용 및 'search_off' 클래스 제거
  const tab1 = tabs[0];
  const tab2 = tabs[1];
  if (tabId === "tab1") {
    tab1.classList.remove("search_off");
    tab1.style.borderRadius = "12px 0 0 0"; // tab1 선택 시 왼쪽 모서리 둥글게
    tab2.style.borderRadius = "0 12px 0 0"; // tab2는 오른쪽 모서리만 둥글게
  } else if (tabId === "tab2") {
    tab2.classList.remove("search_off");
    tab2.style.borderRadius = "0 12px 0 0"; // tab2 선택 시 오른쪽 모서리 둥글게
    tab1.style.borderRadius = "12px 0 0 0"; // tab1은 왼쪽 모서리만 둥글게
  }
}

$(function(){
    // URL에서 현재 페이지의 검색어를 확인
    const currentPath = window.location.pathname;

    if (currentPath.includes("idSearch")) {
    reviewTab('tab1'); // 아이디 찾기 활성화
    } else if (currentPath.includes("pwdSearch")) {
    reviewTab('tab2'); // 비밀번호 찾기 활성화
    }
})
