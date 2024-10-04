<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/store_header.jspf"%>

<link href="/css/storeDetail.css" rel="stylesheet" type="text/css">
<link href="https://getbootstrap.com/docs/5.3/components/buttons/" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src = "../../../js/storeDetail.js"></script>
<!-- <script src="/js/storeDetail.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- 상품 상세 페이지 컨테이너 -->
<div class="product-container">
    <!-- 상품 이미지 및 정보 섹션 -->
    <div class="product-wrapper">
        <!-- 상품 이미지 섹션 -->
        <div class="product-image-section">
            <img src="img/store/storedetail1.png" alt="상품 이미지" class="main-image">
        </div>

        <!-- 상품 정보 섹션 -->
        <div class="product-info-section">
            <h1 class="product-title">(OG) 러브 라이브 선샤인 가을 아크릴 스탠드 / 하나마루</h1>
            <p class="product-price">18,000원</p>

            <div class="product-meta-info">
                <p>발매일: 2023년 11월 22일 예정</p>
                <p>적립포인트: 180원</p>
                <p>배송비: 3,000원 / 50,000원 이상 또는 멤버십 무료</p>
            </div>

            <!-- 상품 선택 옵션 -->
            <div class="product-selection">
                <div class="selection-box">
                    <span class="product-name">상품명</span>
                    <p>(OG) 러브 라이브 선샤인 가을 아크릴 스탠드 / 하나마루</p>
                    <span class="product-quantity-control">
                        <button class="quantity-button">-</button>
                        <input type="number" value="1" min="1" max="10" class="quantity-input">
                        <button class="quantity-button">+</button>
                    </span>
                    <span class="product-price-info">18,000원</span>
                </div>

                <div class="total-price">총 결제금액: 18,000원</div>
            </div>

            <!-- 구매 버튼 -->
            <div class="buy-buttons">
                <button class="add-to-cart">장바구니</button>
                <button class="buy-now">바로 구매</button>
            </div>
        </div>

    </div>

   

    <!-- 상품 정보 및 기타 탭 -->
    <div class="product-tabs">
        <button class="tab active">상품정보</button>
        <button class="tab">배송/교환/반품</button>
        <button class="tab">1:1 상품문의</button>
        <button class="tab" onclick ="toggleReviewSection()">리뷰</button>
    </div>

    <!-- 상품 정보 섹션 추가 -->
    <div class="product-info-details-section">
        <h2>상품 정보</h2>
        <table class="product-info-table">
            <tr>
                <th>출시일</th>
                <td>2023년 11월 22일</td>
                <th>정가</th>
                <td>18,000원</td>
            </tr>
            <tr>
                <th>상품명</th>
                <td colspan="3">(OG) 러브 라이브 선샤인 가을 아크릴 스탠드 / 하나마루</td>
            </tr>
            <tr>
                <th>작품명</th>
                <td><a href="#">#러브라이브! 선샤인!!</a></td>
                <th>브랜드</th>
                <td><a href="#">#애니플러스</a></td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td colspan="3"><a href="#">#아크릴 굿즈</a></td>
            </tr>
        </table>
    </div>
            <!-- 주의 사항 섹션 -->
            <div class="caution-section">
                <h3>주문 전 유의사항</h3>
                <p>오프라인 매장과 동시에 판매되는 상품의 경우, 결제 완료 후에도 품절/결품이 발생할 수 있습니다. 이로 인한 환불 처리는 고객님께 문자로 안내드리며 빠른 처리 진행해드리겠습니다.</p>
            </div>

        <!-- 텍스트와 이미지 섹션 -->
        <div class="product-details-section">
            <h2>(OG) 러브 라이브 선샤인 가을 아크릴 스탠드 / 하나마루</h2>
            <div class="product-details-wrapper">
                <!-- 이미지 섹션 -->
                <div class="product-image">
                    <img src="img/store/storedetail1.png" alt="상품 상세 이미지" />
                </div>


                          <!-- 상품 설명 섹션 -->
                <div class="product-description-section">
                    <button class="toggle-description btn btn-secondary btn-lg" onclick="toggleDescription()">상품정보 더보기▼</button>
            </div>

            
                    
        <!-- 숨겨진 상품 설명 -->
        <div id="hidden-description" class="hidden-description">
            <img src="img/store/storedetail2.png">
        </div>
    </div>
</div>

        <!-- 배송/교환/반품 섹션 추가 -->
    <div class="shipping-exchange-return-section">
        <h2>배송/교환/반품</h2>
        <div class="shipping-info">
            <h3>배송정보</h3>
            <ul>
                <li>발송 시기는 예고 없이 변경될 수 있습니다.</li>
                <li>입고 상품의 배송 기간은 2~7일이 소요될 수 있습니다.</li>
                <li>운송장 번호는 "마이 쇼핑 - 주문 내역 - 배송 정보"에서 확인 가능합니다.</li>
            </ul>
        </div>
        <div class="exchange-info">
            <h3>교환</h3>
            <ul>
                <li>상품을 수령하신 후 교환이 필요할 시 교환 조건에 따라 가능합니다.</li>
                <li>상품 수령 후 7일 이내에 교환이 가능합니다.</li>
            </ul>
        </div>
        <div class="return-info">
            <h3>반품 및 환불</h3>
            <ul>
                <li>반품은 배송 완료 후 7일 이내에 가능하며, 제품에 손상이 없는 경우에 한해 환불이 진행됩니다.</li>
                <li>반품 시 택배비는 고객님께서 부담하셔야 합니다.</li>
            </ul>
        </div>
    </div>

    <!-- 1:1 문의 버튼 -->
    <div class="inquiry-button-section">
        <button class="inquiry-button">1:1 상품 문의</button>
    </div>



<script src="/js/storeDetail.js"></script>

<!-- 상품 리뷰 제목 -->
<div class="review-title">
    <h2>상품리뷰</h2>
    <p>상품을 구매하신 분들만 본인이 작성하신 리뷰만 있습니다. 리뷰 작성시 아래 금액만큼 포인트가 적립됩니다.</p>
    <div class="review-stats">
        <span>텍스트 리뷰: 50원</span>
        <span>포토/동영상 리뷰: 150원</span>
    </div>
</div>

<!-- 사용자 총 평점과 전체 리뷰수 섹션 -->
<div class="review-summary">
    <div class="average-rating">
        <h3>사용자 총 평점</h3>
        <div class="stars">★★★★★</div>
        <div class="rating-number">
            4.71 <small>/5</small>
        </div>
    </div>
    <div class="total-reviews">
        <h3>전체 리뷰수</h3>
        <div class="review-count">97</div>
    </div>
</div>

<!-- 리뷰 탭과 필터 -->
<div class="review-tabs-and-filter">
    <div class="review-tabs">
        <span class="active" onclick="showTab('text')">텍스트 리뷰</span>
        <span onclick="showTab('photo')">포토/동영상 리뷰</span>
    </div>
    <div class="review-filter">
        <span class="active" onclick="filterReviews('latest')">최신순</span>
        <span onclick="filterReviews('highest')">평점 높은순</span>
        <span onclick="filterReviews('lowest')">평점 낮은순</span>
    </div>
</div>
<!-- 리뷰 리스트 -->
<div id="review-list">
    
    <div class="review-item" data-rating="5" data-date="2024-09-06">    
     
        <div class="review-nickname">
            <span class="review-rating">★★★★☆</span>
            <span class="reviewer-name">naeb*****</span>
            <span class="review-date">2024.09.06</span>         
        </div>
        
        <div class="review-content">착용감 아주 편해요. 잘 맞아요!</div>
        <div class="review-image">
            <img src="/img/store/review1.png" alt="리뷰 이미지">
        </div>
    </div>
    
</div>
   


    <!-- 페이지 네이션 -->
    <div class="pagination">
        <button class="active" onclick="changePage(1)">1</button>
        <button onclick="changePage(2)">2</button>
        <button onclick="changePage(3)">3</button>
        <!-- 페이지 번호 추가 가능 -->
    </div>


    <!-- 이미지 미리보기 영역 -->
    <div id="preview"></div>
<button onclick="backToTop()" id="btn-back-to-top" title="위로 가기">Top</button>
</div>

<!--영역 외부-->

<!-- Sticky Footer -->
<div class="sticky-footer">
    <div class="d-flex justify-content-between">
        <div class="sticky-left">
            <div class="fw-bold">내 마음의 위험한 녀석 트레이딩 캔뱃지</div>
              
        </div>
        <div class="sticky-right">
            <div class="price">4,000 원</div>
            <button class="btn btn-secondary">장바구니</button>
            <button class="btn btn-dark">바로구매</button>
        </div>
    </div>
</div>