


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


  function decreaseQuantity() {
    let quantityInput = document.querySelector('.quantity-input');
    if (quantityInput.value > 1) {
        quantityInput.value = parseInt(quantityInput.value) - 1;
        updateTotalPrice();
    }
}

function increaseQuantity() {
    let quantityInput = document.querySelector('.quantity-input');
    if (quantityInput.value < `${storeDetail.stock}`) {
        quantityInput.value = parseInt(quantityInput.value) + 1;
        updateTotalPrice();
    }
}

function updateTotalPrice() {
    let quantity = document.querySelector('.quantity-input').value;
    let price = `${storeDetail.price}`;
    document.getElementById('totalPrice').textContent = price * quantity;
}

document.addEventListener('DOMContentLoaded', function () {
    // 좋아요 아이콘 클릭 시 이벤트 발생
    document.getElementById('likeHeart').addEventListener('click', function() {
        alert("hi");
        const likeIcon = document.getElementById('likeHeart');
        const likeCountElement = document.getElementById('likeCount');
        const currentCount = parseInt(likeCountElement.textContent);
        const isLiked = likeIcon.classList.contains('fa-solid'); // 채워진 하트 상태인지 확인
        const productId = document.getElementById('likeIcon').getAttribute('data-product-id'); // 상품 ID 가져오기

        // AJAX 요청으로 서버에 좋아요 상태 전달
        fetch('/like/toggle', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                pro_idx: productId,
                useridx: userId  // 서버로 useridx와 함께 전송
             })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log(data);  // 서버로부터 응답 확인
            if (data.success) {
                // 좋아요 상태에 따라 UI 업데이트
                if (isLiked) {
                    likeIcon.classList.remove('fa-solid');  // 채워진 하트 제거
                    likeIcon.classList.add('fa-regular');   // 빈 하트로 변경
                    likeCountElement.textContent = currentCount - 1;  // 카운트 감소
                } else {
                    likeIcon.classList.remove('fa-regular');  // 빈 하트 제거
                    likeIcon.classList.add('fa-solid');       // 채워진 하트로 변경
                    likeCountElement.textContent = currentCount + 1;  // 카운트 증가
                }
                
            } else {
                console.error('좋아요 상태 변경 실패');
            }
        })
        .catch(error => console.error('Error:', error));
    });
});
