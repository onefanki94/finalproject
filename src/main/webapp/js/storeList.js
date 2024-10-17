    // 좌측 필터 클릭 시 활성화
    function filterProductsByType(filterType) {
        const allFilters = document.querySelectorAll('.filter-option');
        allFilters.forEach(filter => filter.classList.remove('active'));

        const activeFilter = document.querySelector(`.filter-option[onclick="filterProductsByType('${filterType}')"]`);
        if (activeFilter) {
            activeFilter.classList.add('active');
        }

        let products = Array.from(document.querySelectorAll('.list-product'));

    
        if (filterType === 'latest') {
            products.sort((a, b) => new Date(b.dataset.date) - new Date(a.dataset.date));
        } else if (filterType === 'popular') {
            products.sort((a, b) => parseInt(b.dataset.popular) - parseInt(a.dataset.popular));
        } else if (filterType === 'high-price') {
            products.sort((a, b) => parseInt(b.dataset.price) - parseInt(a.dataset.price));
        } else if (filterType === 'low-price') {
            products.sort((a, b) => parseInt(a.dataset.price) - parseInt(b.dataset.price));
        }
    
        const productContainer = document.querySelector('.list-carousel-images');
        productContainer.innerHTML = '';  // 기존 상품 제거
        products.forEach(product => productContainer.appendChild(product));  // 정렬된 상품 다시 추가
    }


    function searchProducts() {
        const input = document.getElementById('productSearch').value.toLowerCase();
        const productItems = document.querySelectorAll('.list-product'); // 상품 리스트

        productItems.forEach(item => {
            const productName = item.textContent.toLowerCase();
            if (productName.includes(input)) {
                item.style.display = ''; // 검색어가 포함된 항목 보이기
            } else {
                item.style.display = 'none'; // 검색어가 포함되지 않은 항목 숨기기
            }
        });
    }

    
    


//    // 필터 클릭 시 active 클래스를 토글하는 함수
//    function toggleFilter(element) {
//        // active 클래스 토글
//        element.classList.toggle('active');
//
//        // 필터 적용 함수 호출
//        applyFilters();
//    }

// URL에서 특정 파라미터의 값을 가져오는 함수
function getParameterByName(name) {
    let url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    let regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

let pageNum = getParameterByName('pageNum') || 1; // URL에서 pageNum 추출, 기본값 1
let pageSize = getParameterByName('pageSize') || 10; // URL에서 pageSize 추출, 기본값 10

fetch('/pagedProducts?pageNum=' + pageNum + '&pageSize=' + pageSize)
    .then(response => response.json())
    .then(data => {
        console.log(data);  // 데이터가 제대로 오는지 확인
        // 데이터 처리 로직 추가
    })
    .catch(error => console.error('Error:', error));




document.addEventListener('DOMContentLoaded', function() {
    console.log("DOM fully loaded and parsed");

});




  