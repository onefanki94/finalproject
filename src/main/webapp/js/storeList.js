    // 좌측 필터 클릭 시 활성화 
    function filterProductsByType(filterType) {
        const allFilters = document.querySelectorAll('.filter-option');
        allFilters.forEach(filter => filter.classList.remove('active'));

        const activeFilter = document.querySelector(`.filter-option[onclick="filterProductsByType('${filterType}')"]`);
        if (activeFilter) {
            activeFilter.classList.add('active');
        }

        let products = Array.from(document.querySelectorAll('.list-product'));
    
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
        // 작품명을 가져오기
        const aniTitleElement = document.querySelector('.filter-ani-title .active .filter-text');
    
        // 작품명이 선택되었는지 확인
        const aniTitle = aniTitleElement ? aniTitleElement.textContent : null;
    
        // 재고 필터 확인 (체크박스 상태)
        const stockChecked = document.querySelector('.filter-header input[type="checkbox"]').checked ? 1 : 0;
    
        // 작품명이 유효한 경우에만 서버로 필터 요청
        if (aniTitle) {
            const filterCriteria = {
                ani_title: aniTitle,  // 작품명
                stock: stockChecked   // 재고 여부 (체크박스 값)
            };
    
            // 서버로 POST 요청을 보내 필터링된 데이터 가져오기
            fetch('/filterStoreList', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(filterCriteria)
            })
            .then(response => response.json())
            .then(data => {
                console.log(data); // 서버에서 받은 데이터를 콘솔에 출력
    
                // 받은 데이터를 이용해 UI를 업데이트
                const productContainer = document.querySelector('.list-carousel-images');
                productContainer.innerHTML = '';  // 기존의 상품 목록 제거
    
                // 서버에서 받은 필터링된 데이터를 기반으로 UI 업데이트
                data.forEach(product => {
                    const productElement = document.createElement('li');
                    productElement.className = 'list-product';
                    productElement.innerHTML = `
                        <a href="/storeDetail/${product.idx}">
                            <img src="http://192.168.1.92:8000/${product.thumImg}" alt="${product.title}">
                        </a>
                        <p>${product.title}</p>
                        <p>${product.price} 원</p>
                    `;
                    productContainer.appendChild(productElement); // 필터링된 데이터를 UI에 추가
                });
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
    const ani_title = Array.from(document.querySelectorAll('.filter-ani-title .filter-item.active .filter-text'))
        .map(item => item.innerText);
    
    // 판매종료 포함 여부 체크
    const stock = document.getElementById('stockFilter').checked ? 1 : 0;  // boolean을 정수로 변환

    // 필터링된 상품 리스트 출력 (여기서는 콘솔에 출력하지만 실제로는 AJAX로 서버에 필터 요청을 보낼 수 있습니다)
    console.log('선택된 작품:', ani_title);
    console.log('판매종료 포함:', stock);

    // JSON 데이터를 확인하기 위해 콘솔에 출력
    console.log("전송 데이터:", JSON.stringify({
        ani_title: ani_title,  // 배열인지 확인
        stock: stock           // Boolean 값을 정수로 변환
    }));

    // 실제 필터링 작업을 위한 로직 (AJAX로 서버에 요청 보내기)
    $.ajax({
        type: 'POST',
        url: '/filterStoreList',
        contentType: 'application/json',
        data: JSON.stringify({
            ani_title: ani_title,
            stock: stock
        }),
        dataType: 'json',
        success: function (data) {
            console.log(data); // 받은 데이터를 콘솔에 출력하여 확인
    
            const productContainer = document.querySelector('.list-carousel-images');
            productContainer.innerHTML = ''; // 기존 상품 제거
    
            // 받은 데이터를 바탕으로 UI 업데이트
            data.forEach(product => {
                const productElement = document.createElement('li');
                productElement.className = 'list-product';
                productElement.innerHTML = `
                <a href="/storeDetail/${product.idx}"> 
                <img src="${product.thumImg}" alt="${product.ani_title}">
                </a>
                        <p>${product.title}</p>
                        <p>${product.price} 원</p>
                    `;
                    productContainer.appendChild(productElement);
                });
            },
            error: function (error) {
                console.error('Error:', error);
                alert('상품을 불러오는 중 문제가 발생했습니다. 다시 시도해주세요.');
            }
    }); 
}


