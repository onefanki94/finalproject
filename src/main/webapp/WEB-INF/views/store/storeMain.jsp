<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Store Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="/css/storeMain.css" rel="stylesheet" type="text/css"></link>
    <script src="js/storeMain.js"></script>

    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
   
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>

    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="slick/slick.min.js"></script>
</head>


<script>

$(document).ready(function(){
  $('.carousel-banner-images').slick({
   
  });
});    

</script>



<body>

<header class="header">
    <div class="logo">
        <a href="#">AniWave Shop</a>
    </div>
    
</header>


<!-- 배너 -->
<section class="banner" id="banner">
    <div class="carousel-banner-images" id="slider-div">
        <div class="banner1">
        <a href="bannerDetail1.jsp">
            <img src="img/store/banner1.png" alt="Main Banner1">
        </a>
        </div>
        <div class="banner2">
        <a href="bannerDetail2.jsp">
            <img src="img/store/banner2.png" alt="Main Banner2">
        </a>
        </div>
        <div class="banner3">
        <a href="bannerDetail3.jsp">
            <img src="img/store/banner3.png" alt="Main Banner3">
        </a>
        </div>
    </div>
    <button class="carousel-button left" onclick="moveSlide('banner', -1)">&#10094;</button>
    <button class="carousel-button right" onclick="moveSlide('banner', 1)">&#10095;</button>
</section>


<!-- Featured Products Section -->
<section class="products">
    <h2>Hot #인기굿즈</h2>
    <div class="carousel">
        <button class="carousel-control prev" onclick="moveSlide('featured-products', -1)">&#10094;</button>
        <div class="carousel-wrapper">
            <div class="carousel-images">
                <div class="product">
                    <a href="productDetail1.jsp">
                        <img src="img/store/f1.png" alt="Product 1">
                    </a>
                    <h3>Product 1</h3>
                    <p>$19.99</p>
                </div>
                <div class="product">
                    <a href="productDetail2.jsp">
                        <img src="img/store/f2.png" alt="Product 2">
                    </a>
                    <h3>Product 2</h3>
                    <p>$29.99</p>
                </div>
                <div class="product">
                    <a href="productDetail3.jsp">
                        <img src="img/store/f3.png" alt="Product 3">
                    </a>
                    <h3>Product 3</h3>
                    <p>$39.99</p>
                </div>
                <div class="product">
                    <a href="productDetail4.jsp">
                        <img src="img/store/f4.png" alt="Product 4">
                    </a>
                    <h3>Product 4</h3>
                    <p>$49.99</p>
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
                    <p>나 혼자만 레벨업 : 어라이즈</p>
                </a>
                </div>
            </div>
        </div>
        <button class="carousel-control next" onclick="moveSlide('original-goods', 1)">&#10095;</button>
    </div>
</section>

<!-- More Products Section -->
<section class="products2">
    <h2>More Products</h2>
    <div class="carousel">
        <button class="carousel-control prev" onclick="moveSlide('more-products', -1)">&#10094;</button>
        <div class="carousel-wrapper">
            <div class="carousel-images">
                <div class="product">
                    <a href="productDetail1.jsp">
                        <img src="product1.jpg" alt="Product 1">
                    </a>
                    <h3>Product 1</h3>
                    <p>$19.99</p>
                </div>
                <div class="product">
                    <a href="productDetail2.jsp">
                        <img src="product2.jpg" alt="Product 2">
                    </a>
                    <h3>Product 2</h3>
                    <p>$29.99</p>
                </div>
                <div class="product">
                    <a href="productDetail3.jsp">
                        <img src="product3.jpg" alt="Product 3">
                    </a>
                    <h3>Product 3</h3>
                    <p>$39.99</p>
                </div>
                <div class="product">
                    <a href="productDetail4.jsp">
                        <img src="product4.jpg" alt="Product 4">
                    </a>
                    <h3>Product 4</h3>
                    <p>$49.99</p>
                </div>
            </div>
        </div>
        <button class="carousel-control next" onclick="moveSlide('more-products', 1)">&#10095;</button>
    </div>
</section>



<!-- MD's pick Section -->
<section class="md_pick">
    <h2>MD's pick</h2>
    <div class="md">
        <button class="md-control prev" onclick="moveSlide('md_pick', -1)">&#10094;</button>
        <div class="md-wrapper">
            <div class="md-images">
                <a href="md1.jsp">
                    <img src="product1.jpg" alt="Product 1">
                    <p>MD's pick1</p>
                </a>
                <a href="md2.jsp">
                    <img src="product2.jpg" alt="Product 2">
                    <p>MD's pick2</p>
                </a>
                <a href="md3.jsp">
                    <img src="product3.jpg" alt="Product 3">
                    <p>MD's pick3</p>
                </a>
            </div>
        </div>
        <button class="md-control next" onclick="moveSlide('md_pick', 1)">&#10095;</button>
    </div>
</section>