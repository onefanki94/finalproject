<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/inc/store_header.jspf"%>


<link href="/css/storeList.css" rel="stylesheet" type="text/css">
<script src="../../../js/storeList.js"></script>
<script>
       function loadSubcategories(category) {
    $.ajax({
        type: 'GET',
        url: '/subcategories',  // 서버에서 하위 카테고리를 반환하는 엔드포인트
        data: { category: category },  // 선택된 카테고리의 ID를 파라미터로 전송
        success: function(subcategories) {
            // 하위 카테고리 리스트를 업데이트할 HTML 요소를 선택
            const filterList = document.querySelector('.filter-list');
            filterList.innerHTML = '';  // 기존의 카테고리 항목을 초기화

            // 서버에서 받아온 하위 카테고리들을 순회하며 UI에 추가
            subcategories.forEach(function(subcategory) {
                const li = document.createElement('li');
                li.className = 'filter-item';
                li.innerHTML = `<span class="filter-text">${subcategory.type}</span>`;
                filterList.appendChild(li);
            });
        },
        error: function(error) {
            console.error('Error fetching subcategories:', error);
        }
    });
}
</script>
<div class="storeList_container">
        <h2>#hololive GAMERS 콜라보 굿즈 예약 판매 (~12.15)</h2>
            <section class="list-banners" id="banner">
                <div class="list-banner-images" id="List-div">
                    <div class="list-banner">
                            <img src="img/store/list-banner.png" alt="List Banner1">
                    </div>
                </div>
                </section>

                    <!-- 좌측 필터 -->
                    <section class="filter-section">  
                        <div class="left-con">
                            <h3>필터</h3>
                            <div class="filter-header">
                                <span>판매종료 포함</span>
                                <label class="switch">
                                    <input type="checkbox" id="stockFilter" onclick="applyFilters(this)">
                                    <span class="slider round"></span>
                                </label>
                            </div>
                            <hr>
                            <div class="filter-type-title">
                                <h3>카테고리별</h3>
                                <ul class="filter-list">
                                    <!-- firstCategoryList를 순회하면서 카테고리 목록을 출력 -->
                                    <c:forEach var="category" items="${firstCategoryList}">
                                        <li class="filter-item" onclick="loadSubcategories('${category.type}')">
                                            <span class="filter-text">${category.type}</span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            
                            </ul>
                            <hr>
                        </div>
                    </section>
                

                <!-- 상품 섹션 위쪽에 필터 추가 -->
                        <section class="product-filter">
                            <div class="filter-options">
                                <!-- 검색창 추가 -->
                                <div class="search-section">
                                    <div class="search_window">
                                    <input type="text" id="productSearch" class="search-input" placeholder="검색어를 입력하세요..." onkeyup="searchProducts()" />
                                    </div>
                                    <div class="search-icon">
                                        <img src="img/store/search_box_btn.png">
                                    </div>
                                </div>
                                <div class="filter-option-keyword">
                                    <span class="filter-option" onclick="filterProductsByType('latest')">최신순</span>
                                    <span class="filter-option" onclick="filterProductsByType('popular')">인기순</span>
                                    <span class="filter-option" onclick="filterProductsByType('high-price')">높은 가격순</span>
                                    <span class="filter-option" onclick="filterProductsByType('low-price')">낮은 가격순</span>
                                    
                                </div>
                            </div>
                        </section>


                <!--상품섹션-->
                <section class="list-products">
                    <div class="right-con">
                        <ul class="list-carousel">
                            <li class="list-carousel-wrapper">
                                <ul class="list-carousel-images">
                                  <!--db에서 가져온 상품목록-->
                                  <c:forEach var="product" items="${storeList}">
                                    <li class="list-product">
                                        <!-- idx 값을 사용하여 링크 생성 -->
                                        <a href="/storeDetail/${product.idx}"> 
                                            <img src="http://192.168.1.92:8000/${product.thumImg}" alt="${product.title}">
                                        </a>
                                        <p>${product.title}</p>
                                        <p>${product.price} 원</p>
                                    </li>
                                </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </section>
      


</div>


<%@include file="/WEB-INF/inc/store_footer.jspf"%>

