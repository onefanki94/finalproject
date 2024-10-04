<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/store_header.jspf"%>


<link href="/css/storeList.css" rel="stylesheet" type="text/css">
<script src="/js/storeList.js"></script>

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
                                <span class="filter-option active" onclick="filterProducts('latest')">최신순</span>
                                <span class="filter-option" onclick="filterProducts('popular')">인기순</span>
                                <span class="filter-option" onclick="filterProducts('high-price')">높은 가격순</span>
                                <span class="filter-option" onclick="filterProducts('low-price')">낮은 가격순</span>
                            </div>
                        </section>


                <!--상품섹션-->
                <section class="list-products">
                    <div class="right-con">
                        <ul class="list-carousel">
                            <li class="list-carousel-wrapper">
                                <ul class="list-carousel-images">
                                    <li class="list-product">
                                        <a href="/storeDetail">
                                            <img src="img/store/f1.png" alt="list-product1">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail2.jsp">
                                            <img src="img/store/f2.png" alt="list-product2">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail3.jsp">
                                            <img src="img/store/f3.png" alt="list-product3">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail4.jsp">
                                            <img src="img/store/f4.png" alt="list-product4">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail1.jsp">
                                            <img src="img/store/f1.png" alt="list-product1">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail2.jsp">
                                            <img src="img/store/f2.png" alt="list-product2">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail3.jsp">
                                            <img src="img/store/f3.png" alt="list-product3">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail4.jsp">
                                            <img src="img/store/f4.png" alt="list-product4">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail1.jsp">
                                            <img src="img/store/f1.png" alt="list-product1">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail2.jsp">
                                            <img src="img/store/f2.png" alt="list-product2">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail3.jsp">
                                            <img src="img/store/f3.png" alt="list-product3">
                                        </a>
                                    </li>
                                    <li class="list-product">
                                        <a href="productDetail4.jsp">
                                            <img src="img/store/f4.png" alt="list-product4">
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </section>

</div>


        

