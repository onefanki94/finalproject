


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
    const token = localStorage.getItem('token');
    const likeIcon = document.querySelector('.like-icon');
    const productId = likeIcon.getAttribute('data-product-id');

    console.log("토큰값 불러오기:", token);
    console.log("상품 ID:", productId);

    if (!token || !productId) {
        console.error('토큰 또는 상품 ID가 없습니다.');
        return;
    }

    // 페이지 로드 시 좋아요 상태와 수를 서버에서 가져옴
    fetch(`/like/statusAndCount?pro_idx=${productId}`, {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())  // 응답을 JSON으로 변환
    .then(data => {
        console.log("서버로부터 받은 데이터:", data);  // 응답 데이터를 콘솔에 출력

        if (data.success) {
            const likeHeart = document.querySelector('.like-heart');
            const likeCountElement = likeHeart.closest('.like-icon').nextElementSibling;

            // 좋아요 상태 반영
            if (data.liked) {
                likeHeart.classList.add('fa-solid');
                likeHeart.classList.remove('fa-regular');
            } else {
                likeHeart.classList.add('fa-regular');
                likeHeart.classList.remove('fa-solid');
            }

            // 좋아요 수 반영
            likeCountElement.textContent = data.likeCount;
        } else {
            console.error('좋아요 상태 및 수를 가져오는 데 실패했습니다:', data.message);
        }
    })
    .catch(error => console.error('좋아요 상태 및 수 요청 중 오류 발생:', error));


    // 좋아요 클릭 시 이벤트 처리
    likeIcon.addEventListener('click', function (event) {
        const likeHeart = event.target;
        const likeCountElement = likeHeart.closest('.like-icon').nextElementSibling;

        fetch('/like/toggle', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify({ pro_idx: productId })  // 상품 ID 전송
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log("좋아요 상태 변경 성공:", data);

                // 좋아요 상태와 UI 업데이트
                updateLikeUI(data.liked, likeHeart, likeCountElement, data.currentLikeCount); // UI 업데이트
            } else {
                console.error("좋아요 상태 변경 실패:", data.message);
            }
        })
        .catch(error => console.error('Error:', error));
    });

    function updateLikeUI(liked, likeHeart, likeCountElement, currentLikeCount) {
        console.log("UI 업데이트 - 좋아요 상태:", liked);
        console.log("UI 업데이트 - 현재 좋아요 수:", currentLikeCount);

        if (liked) {
            likeHeart.classList.remove('fa-regular');
            likeHeart.classList.add('fa-solid');
        } else {
            likeHeart.classList.remove('fa-solid');
            likeHeart.classList.add('fa-regular');
        }

        // 좋아요 수 업데이트
        likeCountElement.textContent = currentLikeCount;
    }
});