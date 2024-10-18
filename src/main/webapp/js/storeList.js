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

    //상품검색창
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
let category = getParameterByName('category');  // category 추가
let secondCategory = getParameterByName('second_category'); // second_category 추가

// 필터링 조건이 있을 경우 파라미터에 추가
let url = `/pagedProducts?pageNum=${pageNum}&pageSize=${pageSize}`;
if (category) {
    url += `&category=${category}`;
}
if (secondCategory) {
    url += `&second_category=${secondCategory}`;
}

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



//필터에 따른 상품 리스트 불러오기
function loadSubcategories(categoryCode) {
    const categoryParam = categoryCode ? `&category=${categoryCode}` : '';
    const pageNum = 1;  // 페이지 넘버, 예시로 1로 고정
    const pageSize = 10;  // 페이지 크기, 예시로 10으로 고정
    $.ajax({
        url: `/pagedProducts?pageNum=${pageNum}&pageSize=${pageSize}${categoryParam}`,
        method: 'GET',
        data: { code: categoryCode },
        success: function(data) {  // 여기서 data로 변경
            const subcategoryList = document.getElementById('subcategory-list');
            subcategoryList.innerHTML = '';  // 기존 하위 카테고리 목록 초기화

            // 하위 카테고리 목록 생성 및 이벤트 리스너 추가
            data.forEach(subcategory => {  // 여기서도 subcategories 대신 data로 접근
                const listItem = document.createElement('li');
                listItem.className = 'filter-item';
                listItem.innerHTML = `<span class="filter-text">${subcategory}</span>`;
                listItem.addEventListener('click', function() {
                    // 다른 모든 아이템에서 active 제거
                    document.querySelectorAll('.filter-item').forEach(item => item.classList.remove('active'));
                    // 클릭한 아이템에 active 클래스 추가
                    listItem.classList.add('active');
                    // 필터 적용
                    filterProductsByServer();
                });
                subcategoryList.appendChild(listItem);
            });
        },
        error: function(error) {
            console.error('Error loading subcategories:', error);
        }
    });
}

// 필터를 적용하는 함수
function applyFilter(category, second_category) {
    const pageNum = 1;
    const pageSize = 10;

    // AJAX 요청에서 category와 secondCategory를 서버로 전달
    $.ajax({
        url: `/pagedProducts?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'GET',
        data: {
            category: category,  // 선택된 카테고리 전달
            second_category: second_category || null // second_category가 있으면 전달, 없으면 null
        },
        success: function(data) {
            // 성공 시 처리
            console.log("필터링된 상품 목록: ", data);
            // 필터링된 상품 목록을 화면에 표시하는 로직 추가
            updateProductList(data);
        },
        error: function(error) {
            console.error("필터 적용 중 오류 발생: ", error);
        }
    });
}


function filterProductsByServer() {
    // 선택된 카테고리 텍스트를 가져옴
    const selectedCategory = document.querySelector('.filter-item.active .filter-text').textContent;
    const pageNum = 1;  // 기본 페이지 넘버
    const pageSize = 10;  // 페이지 크기

    // AJAX 요청으로 필터링된 상품 목록 가져오기
    $.ajax({
        url: `/pagedProducts?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'GET',
        data: {
        category: selectedCategory || null,
                    second_category: second_category.type || null // 필요에 따라 하위 카테고리도 설정
        },
         success: function(data) {
                    console.log('필터링된 상품 목록: ', data);
                    updateProductList(data);  // 상품 목록 업데이트
                },
        error: function(error) {
            console.error('Error filtering products:', error);
        }
    });
}

function updateProductList(products) {  // 함수 본문에 코드가 존재 (올바른 정의 방식)
    const productList = document.querySelector('.list-carousel-images');  // 함수 내부에 위치
    console.log(products);
    productList.innerHTML = '';  // 기존의 상품 목록을 지움

    products.forEach(product => {
        const listItem = document.createElement('li');
        listItem.className = 'list-product';
        listItem.innerHTML = `
            <a href="/storeDetail/${product.idx}">
                <img src="http://192.168.1.92:8000/${product.thumImg}" alt="${product.title}">
            </a>
            <p>${product.title}</p>
            <p>${product.price.toLocaleString()} 원</p>
        `;
        productList.appendChild(listItem);  // 새로운 상품 목록을 추가
    });
    }
