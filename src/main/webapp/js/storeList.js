    // 좌측 필터 클릭 시 활성화 
    function filterProductsByType(filterType) {
        const allFilters = document.querySelectorAll('.filter-option');
        allFilters.forEach(filter => filter.classList.remove('active'));

        const activeFilter = document.querySelector(`.filter-option[onclick="filterProductsByType('${filterType}')"]`);
        if (activeFilter) {
            activeFilter.classList.add('active');
        }

        let products = Array.from(document.querySelectorAll('.list-product'));
    }
        // 상품 정렬 로직 추가
        if (filterType === 'latest') {
            // 최신순: data-date 값으로 정렬
            products.sort((a, b) => new Date(b.dataset.date) - new Date(a.dataset.date));
        } else if (filterType === 'popular') {
            // 인기순: data-popular 값으로 정렬
            products.sort((a, b) => parseInt(b.dataset.popular) - parseInt(a.dataset.popular));
        } else if (filterType === 'high-price') {
            // 높은 가격순: data-price 값으로 정렬
            products.sort((a, b) => parseInt(b.dataset.price) - parseInt(a.dataset.price));
        } else if (filterType === 'low-price') {
            // 낮은 가격순: data-price 값으로 정렬
            products.sort((a, b) => parseInt(a.dataset.price) - parseInt(b.dataset.price));
        }

        // 정렬된 상품을 다시 DOM에 추가
        const productContainer = document.querySelector('.list-carousel-images');
        if (productContainer) {
            productContainer.innerHTML = '';  // 기존 상품 제거
            products.forEach(product => productContainer.appendChild(product));  // 정렬된 상품 다시 추가
        } else {
            console.error('Product container not found');
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

    function filterProductsByServer() {
        const aniTitleElement = document.querySelector('.filter-category .active .filter-text');
        const brandElement = document.querySelector('.filter-brand .active .filter-text');

        // null 체크 추가
        const aniTitle = aniTitleElement ? aniTitleElement.innerText : null;
        const brand = brandElement ? brandElement.innerText : null;

        const stockChecked = document.querySelector('.filter-header input[type="checkbox"]').checked ? 1 : 0;

        if (ani_title && brand) {
            const filterCriteria = {
                ani_title: aniTitle,
                brand: brand,
                stock: stockChecked
            };

            fetch('/filterStoreList', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(filterCriteria)
            })
            .then(response => response.json())
            .then(data => {
                console.log(data); // 필터링된 데이터를 콘솔에 출력하거나 UI에 표시
                // 여기서 data를 이용해 UI 업데이트 가능
            })
            .catch(error => console.error('Error:', error));
        } else {
            console.warn('필터에 대한 유효한 데이터를 찾을 수 없습니다.');
        }
    }


    // 필터 클릭 시 active 클래스를 토글하는 함수
    function toggleFilter(element) {
        // active 클래스 토글
        element.classList.toggle('active');

        // 필터 적용 함수 호출
        applyFilters();
    }

    // 필터를 적용하는 함수 (실제 필터링 로직은 필요에 따라 수정 가능)
    function applyFilters() {
        // 선택된 작품 필터 리스트 가져오기
        const activeCategories = Array.from(document.querySelectorAll('.filter-category .filter-item.active .filter-text'))
            .map(item => item.innerText);

        // 선택된 카테고리 필터 리스트 가져오기
        const activeBrands = Array.from(document.querySelectorAll('.filter-brand .filter-item.active .filter-text'))
            .map(item => item.innerText);

        // 판매종료 포함 여부 체크
        const includeOutOfStock = document.getElementById('stockFilter').checked;

        // 필터링된 상품 리스트 출력 (여기서는 콘솔에 출력하지만 실제로는 AJAX로 서버에 필터 요청을 보낼 수 있습니다)
        console.log('선택된 작품:', activeCategories);
        console.log('선택된 카테고리:', activeBrands);
        console.log('판매종료 포함:', includeOutOfStock);

        //실제 필터링 작업을 위한 로직 (예: 서버에 요청 보내기, DOM 업데이트 등)
    // 예시: 서버에 필터 데이터를 보내는 코드 (AJAX)
        fetch('/filterStoreList', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                ani_title: activeCategories,
                category: activeBrands,
                stock: includeOutOfStock ? 1 : 0
            })
        }).then(response => response.json())
        .then(data => {
            // 필터링된 데이터를 기반으로 UI 업데이트
        });
    }
