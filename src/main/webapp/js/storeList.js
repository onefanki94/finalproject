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

    //필터리스트
    function loadCategories(firstCategoryList) {
        console.log(firstCategoryList); // 서버에서 전달된 카테고리 데이터 확인
        const filterList = document.querySelector('.filter-list');
        filterList.innerHTML = ''; // 기존의 리스트 초기화
    
        firstCategoryList.forEach(category => {
            const listItem = document.createElement('li');
            listItem.className = 'filter-item';
            listItem.setAttribute('onclick', `loadSubcategories('${category.code}')`);
            listItem.innerHTML = `<span class="filter-text">${category.name}</span>`;
            filterList.appendChild(listItem);
        });
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
        // 세컨드 카테고리를 가져오기 (필터 요소에서 활성화된 텍스트 선택)
        const secondCategoryElement = document.querySelector('.filter-second-category .active .filter-text');
    
        // 세컨드 카테고리가 선택되었는지 확인
        const secondCategory = secondCategoryElement ? secondCategoryElement.textContent : null;
    
        // 재고 필터 확인 (체크박스 상태)
        const stockChecked = document.querySelector('.filter-header input[type="checkbox"]').checked ? 1 : 0;
    
        // 세컨드 카테고리가 유효한 경우에만 서버로 필터 요청
        if (secondCategory) {
            const filterCriteria = {
                second_category: secondCategory,  // 세컨드 카테고리명
                stock: stockChecked               // 재고 여부 (체크박스 값)
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
            console.warn('세컨드 카테고리에 대한 유효한 데이터를 찾을 수 없습니다.');
        }
    }


    //세컨드 카테고리에 따른 상품 정렬렬
    function filterProductsByServer() {
        // 세컨드 카테고리를 가져오기 (필터 요소에서 활성화된 텍스트 선택)
        const secondCategoryElement = document.querySelector('.filter-second-category .active .filter-text');
    
        // 세컨드 카테고리가 선택되었는지 확인
        const secondCategory = secondCategoryElement ? secondCategoryElement.textContent : null;
    
        // 재고 필터 확인 (체크박스 상태)
        const stockChecked = document.querySelector('.filter-header input[type="checkbox"]').checked ? 1 : 0;
    
        // 세컨드 카테고리가 유효한 경우에만 서버로 필터 요청
        if (secondCategory) {
            const filterCriteria = {
                second_category: secondCategory,  // 세컨드 카테고리명
                stock: stockChecked               // 재고 여부 (체크박스 값)
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
            console.warn('세컨드 카테고리에 대한 유효한 데이터를 찾을 수 없습니다.');
        }
    }
    
    


    // 필터 클릭 시 active 클래스를 토글하는 함수
    function toggleFilter(element) {
        // active 클래스 토글
        element.classList.toggle('active');

        // 필터 적용 함수 호출
        applyFilters();
    }

  