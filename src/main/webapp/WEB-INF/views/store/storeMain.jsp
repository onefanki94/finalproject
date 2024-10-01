<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/store_header.jspf"%>


<!-- jQuery 로드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- jQuery Migrate 로드 (필요할 경우) -->
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- Slick CSS 로드 -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>

<!-- Slick JS 로드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

<!-- Custom CSS -->
<link href="/css/storeMain.css" rel="stylesheet" type="text/css">

<!-- jQuery noConflict 설정 -->
<script type="text/javascript">
    var $371 = $.noConflict();
</script>

<!-- 기존 Custom JS가 있는 경우 -->
<script src="js/storeMain.js"></script>

<div class="storeMain_container">
    <!-- 배너 -->
    <section class="banner" id="banner">
        <div class="carousel-banner-images" id="slider-div">
            <div class="slide">
                <a href="/storeList">
                    <img src="img/store/banner1.png" alt="Main Banner1">
                </a>
            </div>
            <div class="slide">
                <a href="/storeList">
                    <img src="img/store/banner2.png" alt="Main Banner2">
                </a>
            </div>
            <div class="slide">
                <a href="/storeList">
                    <img src="img/store/banner3.png" alt="Main Banner3">
                </a>
            </div>
        </div>
    </section>

    <!--Notification-->
    <section>
    <div class="notification">
        <div class="notification-header">
            <span class="icon">&#128365;</span> <!-- 알림 아이콘 -->
            <span class="date">2024-09-25</span>
        </div>
        <div class="notification-content">
            <p>[9월 20일, 9월 23일 입고] 예약 상품 배송 안내</p>
        </div>
        <div class="pagination">
            <button class="prev">&lt;</button>
            <span class="page-info">1 / 10</span>
            <button class="next">&gt;</button>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="products">
        <h2>Hot #인기굿즈</h2>
        <p>[25/1월 발매] hololive GAMERS 콜라보 굿즈 예약 판매(~09.29)</p>
        <div class="carousel">
            <button class="carousel-control prev" onclick="moveSlide('featured-products', -1)">&#10094;</button>
            <div class="carousel-wrapper">
                <div class="carousel-images">
                    <div class="product">
                        <a href="/storeList">
                            <img src="img/store/f1.png" alt="Product 1">
                        </a>

                    </div>
                    <div class="product">
                        <a href="productDetail2.jsp">
                            <img src="img/store/f2.png" alt="Product 2">
                        </a>

                    </div>
                    <div class="product">
                        <a href="productDetail3.jsp">
                            <img src="img/store/f3.png" alt="Product 3">
                        </a>

                    </div>
                    <div class="product">
                        <a href="productDetail4.jsp">
                            <img src="img/store/f4.png" alt="Product 4">
                        </a>

                    </div>
                </div>
            </div>
            <button class="carousel-control next" onclick="moveSlide('featured-products', 1)">&#10095;</button>
        </div>
    </section>

    <!-- Original Goods Section -->
    <section class="original-goods">
        <h2>오리지널 굿즈</h2>
        <div class="carousel-original">
            <button class="carousel-control prev" onclick="moveSlide('original-goods', -1)">&#10094;</button>
            <div class="carousel-wrapper">
                <div class="carousel-goods-images">
                    <div class="product-item">
                    <a href="detail1.jsp">
                        <img src="img/store/origingoods1.png" alt="Product 1">
                        <p>러브라이브 굿즈 판매</p>
                    </div>
                    <div class="product-item">
                    </a>
                    <a href="detail2.jsp">
                        <img src="img/store/origingoods2.png" alt="Product 2">
                        <p>hololive GAMERS 콜라보 굿즈 예약판매</p>
                    </a>
                    </div>
                    <div class="product-item">
                    <a href="detail3.jsp">
                        <img src="img/store/origingoods3.png" alt="Product 3">
                        <p>도쿄리벤저스 콜라보 굿즈 예약판매</p>
                    </a>
                    </div>
                </div>
            </div>
            <button class="carousel-control next" onclick="moveSlide('original-goods', 1)">&#10095;</button>
        </div>
    </section>


    <!-- More Products Section -->
    <section class="products2">
        <h2>NEW #신상굿즈</h2>
        <p>[11월 15일] 신규입고상품 안내</p>
        <div class="carousel">
            <button class="carousel-control prev" onclick="moveSlide('more-products', -1)">&#10094;</button>
            <div class="carousel-wrapper">
                <div class="carousel-images">
                    <div class="product">
                        <a href="productDetail1.jsp">
                            <img src="img/store/f5.png" alt="Product 1">
                        </a>

                    </div>
                    <div class="product">
                        <a href="productDetail2.jsp">
                            <img src="img/store/f6.png" alt="Product 2">
                        </a>

                    </div>
                    <div class="product">
                        <a href="productDetail3.jsp">
                            <img src="img/store/f7.png" alt="Product 3">
                        </a>

                    </div>
                    <div class="product">
                        <a href="productDetail4.jsp">
                            <img src="img/store/f8.png" alt="Product 4">
                        </a>

                    </div>
                </div>
            </div>
            <button class="carousel-control next" onclick="moveSlide('more-products', 1)">&#10095;</button>
        </div>
    </section>



    <!-- MD news Section -->
    <section class="md_pick">
        <h2>MD news</h2>
        <div class="md">
            <button class="md-control prev" onclick="moveSlide('md_pick', -1)">&#10094;</button>
            <div class="md-wrapper">
                <div class="md-images">
                    <a href="md1.jsp">
                        <img src="img/store/news1.png" alt="Product 1">

                    </a>
                    <a href="md2.jsp">
                        <img src="img/store/news2.png" alt="Product 2">

                    </a>
                    <a href="md3.jsp">
                        <img src="img/store/news3.png" alt="Product 3">

                    </a>
                </div>
            </div>
            <button class="md-control next" onclick="moveSlide('md_pick', 1)">&#10095;</button>
        </div>
    </section>
</div>
