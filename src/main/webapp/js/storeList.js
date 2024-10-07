function filterProducts(filterType) {
    const allFilters = document.querySelectorAll('.filter-option');
    allFilters.forEach(filter => filter.classList.remove('active'));
    document.querySelector(`.filter-option[onclick="filterProducts('${filterType}')"]`).classList.add('active');

    let products = Array.from(document.querySelectorAll('.list-product'));

    // 모든 상품 숨기기
    products.forEach(product => product.style.display = 'none');

    // 특정 필터 타입에 맞는 상품만 표시하기
    products.forEach(product => {
        if (product.dataset.filter === filterType || filterType === 'all') {
            product.style.display = 'block';
        }
    });
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