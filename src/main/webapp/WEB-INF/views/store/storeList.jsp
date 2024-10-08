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
                                <input type="checkbox">
                                <span class="slider round"></span>
                            </label>
                        </div>
                        <hr>
                        <div class="filter-category">
                            <h3>작품별</h3>
                            <ul class="filter-list">
                                <li class="filter-item">
                                    <img src="img/store/icon.png" alt="Hololive Icon">
                                    <span class="filter-text">홀로 라이브</span>
                                </li>
                            </ul>
                        </div>
                        <hr>
                        <div class="filter-brand">
                            <h3>브랜드</h3>
                            <ul class="filter-list">
                                <li class="filter-item">
                                    <span class="filter-circle"></span>
                                    <span class="filter-text">애니플러스</span>
                                </li>
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
                                <span class="filter-option active" onclick="filterProducts('latest')">최신순</span>
                                <span class="filter-option" onclick="filterProducts('popular')">인기순</span>
                                <span class="filter-option" onclick="filterProducts('high-price')">높은 가격순</span>
                                <span class="filter-option" onclick="filterProducts('low-price')">낮은 가격순</span>
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
                                    <li class="list-products">
                                        <a href="/storeDetail">
                                            <img src="${product.detail_img}" alt="${product.title}">
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



