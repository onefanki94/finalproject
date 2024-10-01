function filterProducts(filterType) {
    const allFilters = document.querySelectorAll('.filter-option');
    allFilters.forEach(filter => filter.classList.remove('active'));
    document.querySelector(`.filter-option[onclick="filterProducts('${filterType}')"]`).classList.add('active');

    let products = Array.from(document.querySelectorAll('.list-product'));

    // 필터 조건에 맞춰 정렬
    if (filterType === 'latest') {
        products.sort((a, b) => new Date(b.getAttribute('data-date')) - new Date(a.getAttribute('data-date')));
    } else if (filterType === 'popular') {
        products.sort((a, b) => b.getAttribute('data-popularity') - a.getAttribute('data-popularity'));
    } else if (filterType === 'high-price') {
        products.sort((a, b) => b.getAttribute('data-price') - a.getAttribute('data-price'));
    } else if (filterType === 'low-price') {
        products.sort((a, b) => a.getAttribute('data-price') - b.getAttribute('data-price'));
    }

    // 정렬된 상품을 화면에 다시 렌더링
    const listCarousel = document.querySelector('.list-carousel-images');
    listCarousel.innerHTML = "";
    products.forEach(product => listCarousel.appendChild(product));
}
