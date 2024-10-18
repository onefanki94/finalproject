<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<script src="/js/Master.js"></script>
<div class="storeEdit">
    <h2>굿즈 상품 수정</h2>
    <form id="storeEditForm" action="/master/storeEditMasterOK" method="post" enctype="multipart/form-data">
        <input type="hidden" id="idx" name="idx" value="${Editstore.idx}">
        <input type="hidden" id="token" name="token">

        <!-- 상품명 추가 -->
        <div>
            <label for="title">상품명:</label>
            <input type="text" id="title" name="title" value="${Editstore.title}">
        </div>

        <!-- 애니 타이틀 추가 -->
        <div>
            <label for="ani_title">애니 타이틀:</label>
            <input type="text" id="ani_title" name="ani_title" value="${Editstore.ani_title}">
        </div>

        <!-- 상품 섬네일 추가 -->
        <div>
            <label for="thumimg">상품 섬네일:</label>
            <input type="file" id="thumimg" name="thumimg" accept="image/*">
        </div>

        <!-- 출시일 추가 -->
        <div>
            <label for="relDT">출시일:</label>
            <input type="date" id="relDT" name="relDT" value="${Editstore.relDT}">
        </div>

        <!-- 브랜드 추가 -->
        <div>
            <label for="brand">브랜드:</label>
            <input type="text" id="brand" name="brand" value="${Editstore.brand}">
        </div>

        <!-- 배송비 추가 -->
        <div>
            <label for="fee">배송비:</label>
            <input type="text" id="fee" name="fee" value="${Editstore.fee}">
        </div>

        <!-- 재고 추가 -->
        <div>
            <label for="stock">재고:</label>
            <input type="number" id="stock" name="stock" value="${Editstore.stock}">
        </div>

        <!-- 가격 추가 -->
        <div>
            <label for="price">가격:</label>
            <input type="text" id="price" name="price" value="${Editstore.price}">
        </div>

        <!-- 대분류 및 중분류 추가 -->
        <div>
            <label for="main-category">대분류:</label>
            <select id="code" name="code">
                <option value="">대분류 선택</option>
                <option value="1">의류</option>
                <option value="2">완구/취미</option>
                <option value="3">문구/오피스</option>
                <option value="4">생활용품</option>
            </select>
        </div>

        <div>
            <label for="second_category">중분류:</label>
            <select id="second_category" name="second_category" disabled>
                <option value="">중분류 선택</option>
            </select>
        </div>

        <!-- 상세 내용 이미지 추가 -->
                <div>
                    <label for="pro_detail">상세 내용 :</label>
                    <input type="text" id="pro_detail" name="pro_detail" value="${Editstore.pro_detail}">
                </div>

                <div>
                    <label for="detailImg">상세 내용 이미지 :</label>
                    <input type="file" id="detailImg" name="detailImg" accept="image/*">
                </div>

        <!-- 폼 제출 버튼 -->
        <div>
            <input type="submit" value="굿즈 상품 수정">
        </div>
    </form>