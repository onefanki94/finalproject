function reviewTab(tabId) {
    // 모든 탭을 숨김
    document.getElementById("tab1").classList.remove("on");
    document.getElementById("tab1").classList.add("off");
    document.getElementById("tab2").classList.remove("on");
    document.getElementById("tab2").classList.add("off");

    // 클릭한 탭만 보여줌
    document.getElementById(tabId).classList.remove("off");
    document.getElementById(tabId).classList.add("on");

    // heart_on_tab 클래스를 설정
    const tabs = document.querySelectorAll(".heart_tabmenu li");
    tabs.forEach((tab) => tab.classList.remove("heart_on_tab"));

    // 클릭한 탭에 heart_on_tab 추가
    if (tabId === "tab1") {
      tabs[0].classList.add("heart_on_tab");
    } else if (tabId === "tab2") {
      tabs[1].classList.add("heart_on_tab");
    }
}