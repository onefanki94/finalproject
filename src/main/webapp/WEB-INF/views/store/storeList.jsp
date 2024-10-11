<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/store_header.jspf"%>


<link href="/css/storeList.css" rel="stylesheet" type="text/css">
<script src="../../../js/storeList.js"></script>

<div class="storeList_container">
        <h2>#hololive GAMERS 콜라보 굿즈 예약 판매 (~12.15)</h2>
            <section class="list-banners" id="banner">
                <div class="list-banner-images" id="List-div">
                    <div class="list-banner">
                            <img src="img/store/list-banner.png" alt="List Banner1">
                    </div>
                </div>
                </section>
            
                <section class="filter-section">  
                    <div class="left-con">
                        <h3>필터</h3>
                        <div class="filter-header">
                            <span>판매종료 포함</span>
                            <label class="switch">
                                <input type="checkbox" id="stockFilter" onclick="applyFilters()">
                                <span class="slider round"></span>
                            </label>
                        </div>
                        <hr>
                        <div class="filter-category">
                            <h3>작품별</h3>
                            <ul class="filter-list">
                                    <!-- 데이터베이스에서 가져온 작품별 리스트를 출력 -->
                                    <c:forEach var="product" items="${storeList}">
                                        <li class="filter-item" onclick="toggleFilter(this)">
                                            <span class="filter-text">${product.ani_title}</span>
                                        </li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <hr>
                        <div class="filter-brand">
                            <h3>카테고리</h3>
                            <ul class="filter-list">
                                <c:forEach var="product" items="${storeList}">
                                    <li class="filter-item" onclick="toggleFilter(this)">
                                        <span class="filter-text">${product.category}</span>
                                    </li>
                                </c:forEach>  
                            </ul>
                        </div>    
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
                                            <img src="${pageContext.request.contextPath}/${product.detail_img}" alt="${product.title}">
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



