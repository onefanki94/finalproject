function filterProducts(filterType) {
    const allFilters = document.querySelectorAll('.filter-option');
    allFilters.forEach(filter => filter.classList.remove('active'));
    document.querySelector(`.filter-option[onclick="filterProducts('${filterType}')"]`).classList.add('active');

    let products = Array.from(document.querySelectorAll('.list-product'));

    // 상품 정렬 로직 추가
    if (filterType === 'latest') {
        // 최신순: data-date 값으로 정렬
        products.sort((a, b) => new Date(b.dataset.date) - new Date(a.dataset.date));
    } else if (filterType === 'popular') {
        // 인기순: data-popular 값으로 정렬
        products.sort((a, b) => b.dataset.popular - a.dataset.popular);
    } else if (filterType === 'high-price') {
        // 높은 가격순: data-price 값으로 정렬
        products.sort((a, b) => b.dataset.price - a.dataset.price);
    } else if (filterType === 'low-price') {
        // 낮은 가격순: data-price 값으로 정렬
        products.sort((a, b) => a.dataset.price - b.dataset.price);
    }

    // 정렬된 상품을 다시 DOM에 추가
    const productContainer = document.querySelector('.list-carousel-images');
    productContainer.innerHTML = '';  // 기존 상품 제거
    products.forEach(product => productContainer.appendChild(product));  // 정렬된 상품 다시 추가
 }
  //검색창

  // 간단한 검색 기능 구현
function searchProducts() {
    const input = document.getElementById('productSearch').value.toLowerCase();
    const productItems = document.querySelectorAll('.list-product'); // 상품 리스트

    productItems.forEach(item => {
        const productName = item.innerText.toLowerCase();
        if (productName.includes(input)) {
            item.style.display = ''; // 검색어가 포함된 항목 보이기
        } else {
            item.style.display = 'none'; // 검색어가 포함되지 않은 항목 숨기기
        }
    });
}

// 필터링된 데이터를 가져오는 함수
function filterProducts() {
    const aniTitle = document.querySelector('.filter-category .active .filter-text').innerText;
    const brand = document.querySelector('.filter-brand .active .filter-text').innerText;

    const filterCriteria = {
        ani_title: aniTitle,
        brand: brand,
        stock: document.querySelector('.filter-header input[type="checkbox"]').checked ? 1 : 0
    };

    fetch('/filterStoreList', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(filterCriteria)
    })
    .then(response => response.json())
    .then(data => {
        console.log(data); // 필터링된 데이터를 콘솔에 출력하거나 UI에 표시
    })
    .catch(error => console.error('Error:', error));
}