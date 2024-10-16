


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

function scrollToShippingSection() {
    const section = document.querySelector('.shipping-exchange-return-section');
    const sectionPosition = section.getBoundingClientRect().top + window.scrollY; // 섹션의 Y 위치 계산
    const offset = -160; // 원하는 만큼 위로 배치 (여기서는 100px 위로)

    window.scrollTo({
      top: sectionPosition + offset, // 섹션 위치에서 offset 만큼 위로
      behavior: 'smooth' // 부드러운 스크롤 애니메이션
    });
  }

  function scrollToReviewSection() {
    const section = document.querySelector('.review-title');
    const sectionPosition = section.getBoundingClientRect().top + window.scrollY; // 섹션의 Y 위치 계산
    const offset = -100; // 원하는 만큼 위로 배치 (여기서는 100px 위로)

    window.scrollTo({
      top: sectionPosition + offset, // 섹션 위치에서 offset 만큼 위로
      behavior: 'smooth' // 부드러운 스크롤 애니메이션
    });
  }

//상품정보 입력칸
  function decreaseQuantity() {
    let quantityInput = document.querySelector('.quantity-input');
    if (quantityInput.value > 1) {
        quantityInput.value = parseInt(quantityInput.value) - 1;
        updateTotalPrice();
    }
}

function increaseQuantity() {
    let quantityInput = document.querySelector('.quantity-input');
    let maxQuantity = parseInt(quantityInput.max); // 최대 수량 (HTML max 속성에서 가져옴)

    if (parseInt(quantityInput.value) < maxQuantity) {
        quantityInput.value = parseInt(quantityInput.value) + 1;
        updateTotalPrice();  // 수량이 변경될 때 총 가격을 업데이트
    }
}
function updateTotalPrice() {
    // storeDetail이 정의되어 있는지 확인
    if (typeof storeDetail === 'undefined') {
        console.error('storeDetail is not defined.');
        return;
    }

    let quantityInput = document.querySelector('.quantity-input');
    let quantity = parseInt(quantityInput.value);
    let totalPrice = storeDetail.price * quantity;

    // 총 가격을 화면에 업데이트하는 로직 추가 (예: 특정 요소에 총 가격 표시)
    document.getElementById('total-price').textContent = totalPrice;

    // Sticky Footer의 가격도 업데이트
    let stickyPriceElement = document.querySelector('.sticky-footer .price');
    if (stickyPriceElement) {
        stickyPriceElement.textContent = totalPrice + ' 원';
    } else {
        console.error('Sticky footer price element not found.');
    }
}


document.addEventListener('DOMContentLoaded', function () {
    // 로컬스토리지에서 토큰 가져오기
    const token = localStorage.getItem('token');
    console.log("로컬스토리지 토큰 " +token);
    if (!token) {
        console.error('로그인 토큰이 없습니다.');
        return;
    }

    // like-icon 요소 선택
    const likeIcon = document.querySelector('.like-icon');
    if (!likeIcon) {
        console.error("like-icon 요소를 찾을 수 없습니다.");
        return;
    }

    // like-icon 클릭 시 이벤트 발생
    likeIcon.addEventListener('click', function (event) {
        const likeHeart = event.target; // 클릭된 대상 자체를 가져옴
        if (!likeHeart.classList.contains('like-heart')) {
            console.error("like-heart 아이콘을 찾을 수 없습니다.");
            return;
        }

        // 좋아요 카운트 요소와 기타 필요한 정보 찾기
        const likeCountElement = likeHeart.closest('.like-icon').nextElementSibling; // 하트 아이콘 옆의 카운트 요소
        const currentCount = parseInt(likeCountElement.textContent);
        const isLiked = likeHeart.classList.contains('fa-solid'); // 채워진 하트 상태인지 확인

        // 상품 ID 가져오기
        const productId = likeHeart.closest('.like-icon').getAttribute('data-product-id');
        if (!productId) {
            console.error("상품 ID를 찾을 수 없습니다.");
            return;
        }

        console.log("상품 ID:", productId, "좋아요 상태:", isLiked, "현재 좋아요 수:", currentCount);

        // AJAX 요청으로 서버에 좋아요 상태 전달
        fetch('/like/toggle', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}` // Authorization 헤더에 토큰 추가
            },
            body: JSON.stringify({
                pro_idx: productId  // productId를 전송
            })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                console.log("좋아요 상태 변경 성공");
                updateLikeUI(isLiked, likeHeart, likeCountElement, currentCount);
            } else {
                console.error("좋아요 상태 변경 실패");
            }
        })
        .catch(error => console.error('Error:', error));
    });

    // 좋아요 UI 업데이트 함수
    function updateLikeUI(isLiked, likeHeart, likeCountElement, currentCount) {
        if (isLiked) {
            likeHeart.classList.remove('fa-solid');  // 채워진 하트 제거
            likeHeart.classList.add('fa-regular');   // 빈 하트로 변경
            likeCountElement.textContent = currentCount - 1;  // 카운트 감소
        } else {
            likeHeart.classList.remove('fa-regular');  // 빈 하트 제거
            likeHeart.classList.add('fa-solid');       // 채워진 하트로 변경
            likeCountElement.textContent = currentCount + 1;  // 카운트 증가
        }
    }


document.addEventListener('DOMContentLoaded', function () {
    const averageRating = parseFloat(document.querySelector('.rating-number').textContent);
    const starsContainer = document.getElementById('stars-container');

    function generateStars(rating) {
        let stars = '';
        for (let i = 0; i < 5; i++) {
            if (i < Math.floor(rating)) {
                stars += '★';  // 채워진 별
            } else {
                stars += '☆';  // 빈 별
            }
        }
        return stars;
    }

    // 별점을 생성해서 DOM에 반영
    starsContainer.innerHTML = generateStars(averageRating);
});
document.addEventListener('DOMContentLoaded', function () {
    const token = localStorage.getItem('token');
    const productId = document.querySelector('.like-icon').getAttribute('data-product-id');

    if (!token || !productId) {
        console.error('로그인 토큰이 없거나 상품 ID가 없습니다.');
        return;
    }

    // 좋아요 상태 요청
    fetch(`/like/status?pro_idx=${productId}`, {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const likeHeart = document.querySelector('.like-heart');
            if (data.liked) {
                likeHeart.classList.add('fa-solid');
                likeHeart.classList.remove('fa-regular');
            } else {
                likeHeart.classList.add('fa-regular');
                likeHeart.classList.remove('fa-solid');
            }
        } else {
            console.error('좋아요 상태를 가져오는 데 실패했습니다.');
        }
    })
    .catch(error => console.error('좋아요 상태 요청 중 오류 발생:', error));
});
});


