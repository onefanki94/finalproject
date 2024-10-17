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
    const categoryParam = category ? `&category=${category}` : '';
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


 function applyFilter(category) {
     console.log("필터링할 카테고리:", category);

     // 필터 적용 로직
     $.ajax({
         url: '/pagedProducts',
         method: 'GET',
         data: {
             category: category,  // 선택된 카테고리 전달
             pageNum: 1,          // 페이지 초기화
             pageSize: 10         // 기본 페이지 크기
         },
         success: function(response) {
             // 상품 목록 업데이트 로직
             updateProductList(response);
         },
         error: function(error) {
             console.error("필터 적용 중 오류 발생:", error);
         }
     });
 }

 function updateProductList(products) {
     const productList = document.querySelector('.list-carousel-images');
     productList.innerHTML = '';

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
         productList.appendChild(listItem);
     });
 }




  