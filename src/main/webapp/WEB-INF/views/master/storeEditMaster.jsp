<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<div class="storeEdit">
    <h2>굿즈 상품 수정</h2>
    <form action="/master/storeEditMasterOk" method="post" enctype="multipart/form-data">
        <!-- 상품명 추가 -->
        <div>
            <label for="product_name">상품명:</label>
            <input type="text" id="product_name" name="product_name" required>
        </div>

        <!-- 애니 타이틀 추가 -->
        <div>
            <label for="ani_title">애니 타이틀:</label>
            <input type="text" id="ani_title" name="ani_title" required>
        </div>

        <!-- 상품 섬네일 추가 -->
        <div>
            <label for="detail_img"> 상품 섬네일 :</label>
            <input type="file" id="detail_img" name="detail_img" accept="image/*" required>
        </div>

        <!-- 출시일 추가 -->
        <div>
            <label for="rel_DT">출시일:</label>
            <input type="date" id="rel_DT" name="rel_DT" required>
        </div>

        <!-- 브랜드 추가 -->
        <div>
            <label for="brand">브랜드:</label>
            <input type="text" id="brand" name="brand" required>
        </div>

        <!-- 배송비 추가 -->
        <div>
            <label for="fee">배송비:</label>
            <input type="text" id="fee" name="fee" required>
        </div>

        <!-- 재고 추가 -->
        <div>
            <label for="stock">재고:</label>
            <input type="number" id="stock" name="stock" required>
        </div>

        <!-- 가격 추가 -->
        <div>
            <label for="price">가격:</label>
            <input type="text" id="price" name="price" required>
        </div>

        <!-- 카테고리 추가 -->
        <div>
            <label for="category">카테고리:</label>
            <input type="text" id="category" name="category" required>
        </div>

        <!-- 상세 내용 이미지 추가 -->
        <div>
            <label for="product_img">상세 내용 이미지:</label>
            <input type="file" id="product_img" name="product_img" accept="image/*" required>
        </div>

        <!-- 폼 제출 버튼 -->
        <div>
            <input type="submit" value="굿즈 상품 수정">
        </div>
    </form>
</div>