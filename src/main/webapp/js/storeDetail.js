
// 리뷰 섹션을 보이거나 숨기는 함수
function toggleReviewSection() {
    var reviewSection = document.getElementById("review-section");
    if (reviewSection.style.display === "none" || reviewSection.style.display === "") {
        reviewSection.style.display = "block";
    } else {
        reviewSection.style.display = "none";
    }
}

// 탭 전환 및 필터링 상태를 관리하는 전역 변수
let activeTab = 'text';  // 기본값: 텍스트 리뷰
let activeFilter = 'latest';  // 기본값: 최신순

// 리뷰 탭 전환 함수
function showTab(tabType) {
    activeTab = tabType;
    const allTabs = document.querySelectorAll('.review-tabs span');
    allTabs.forEach(tab => tab.classList.remove('active'));

    document.querySelector(`.review-tabs span[onclick="showTab('${tabType}')"]`).classList.add('active');
    applyFilters();  // 필터 적용
}

// 필터링 함수
function filterReviews(filterType) {
    activeFilter = filterType;
    const allFilters = document.querySelectorAll('.review-filter span');
    allFilters.forEach(filter => filter.classList.remove('active'));

    document.querySelector(`.review-filter span[onclick="filterReviews('${filterType}')"]`).classList.add('active');
    applyFilters();  // 필터 적용
}

// 필터와 탭 적용 로직
function applyFilters() {
    let reviews = Array.from(document.getElementsByClassName("review-item"));

    // 탭에 따른 리뷰 종류 필터링 (예: 텍스트 리뷰, 포토/동영상 리뷰)
    if (activeTab === 'text') {
        reviews = reviews.filter(review => !review.classList.contains('photo'));  // 예: photo 클래스가 없는 텍스트 리뷰
    } else if (activeTab === 'photo') {
        reviews = reviews.filter(review => review.classList.contains('photo'));  // 예: photo 클래스가 있는 포토/동영상 리뷰
    }

    // 정렬 필터 (최신순, 평점 높은순, 평점 낮은순)
    if (activeFilter === 'latest') {
        reviews.sort((a, b) => new Date(b.getAttribute("data-date")) - new Date(a.getAttribute("data-date")));
    } else if (activeFilter === 'highest') {
        reviews.sort((a, b) => b.getAttribute("data-rating") - a.getAttribute("data-rating"));
    } else if (activeFilter === 'lowest') {
        reviews.sort((a, b) => a.getAttribute("data-rating") - b.getAttribute("data-rating"));
    }

    // 필터링된 리뷰를 화면에 표시
    const reviewList = document.getElementById("review-list");
    reviewList.innerHTML = "";
    reviews.forEach(review => reviewList.appendChild(review));
}


// 페이지 로드 후 각 리뷰 아이템에 별점 표시하기
document.addEventListener('DOMContentLoaded', function() {
    const reviews = document.querySelectorAll('.review-item');
    
    reviews.forEach(function(review) {
        const rating = review.getAttribute('data-rating');
        const ratingContainer = review.querySelector('.review-rating');
        ratingContainer.innerHTML = generateStars(rating); // 별점 생성 함수 사용
    });
});


// 별점 생성 함수
function generateStars(rating) {
    let stars = '';
    for (let i = 0; i < 5; i++) {
        if (i < rating) {
            stars += '★';  // 채워진 별
        } else {
            stars += '☆';  // 빈 별
        }
    }
    return stars;
}

function toggleDescription() {
    var description = document.getElementById("hidden-description");
    var button = document.querySelector(".toggle-description");

    if (description.style.display === "none" || description.style.display === "") {
        description.style.display = "block";
        button.innerHTML = "상품정보 접기▲";  // 버튼 텍스트 변경
    } else {
        description.style.display = "none";
        button.innerHTML = "상품정보 더보기▼";  // 버튼 텍스트 원래대로
    }
}

$(document).ready(function() {
    $(window).scroll(function() {
        console.log("Scroll event triggered");
        var scrollPosition = $(window).scrollTop();
        var windowHeight = $(window).height();
        var documentHeight = $(document).height();

        if (scrollPosition > (documentHeight - windowHeight) * 0.1) {
            $('.sticky-footer').addClass('show');
            console.log("Scroll event triggered");
        } else {
            $('.sticky-footer').removeClass('show');
        }
    });
});



