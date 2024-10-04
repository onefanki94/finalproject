<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="orderEdit">
        <h2>배송 정보 수정</h2>
        <form action="/master/OrderEditOk" method="post">
            <!-- 주문일시 (읽기 전용) -->
            <div class="form-group">
                <label for="orderDate">주문일시</label>
                <input type="datetime-local" id="orderDate" name="orderDate" value="2023-10-01T12:30" readonly>
            </div>

            <!-- 주문번호 (읽기 전용) -->
            <div class="form-group">
                <label for="orderNumber">주문번호</label>
                <input type="text" id="orderNumber" name="orderNumber" value="ORD123456" readonly>
            </div>

            <!-- 주문자명 (읽기 전용) -->
            <div class="form-group">
                <label for="orderName">주문자명</label>
                <input type="text" id="orderName" name="orderName" value="홍길동" readonly>
            </div>

            <!-- 주문자 연락처 (읽기 전용) -->
            <div class="form-group">
                <label for="orderContact">주문자 연락처</label>
                <input type="tel" id="orderContact" name="orderContact" value="010-1234-5678" readonly>
            </div>

            <!-- 수령자명 (읽기 전용) -->
            <div class="form-group">
                <label for="receiverName">수령자명</label>
                <input type="text" id="receiverName" name="receiverName" value="김영희" readonly>
            </div>

            <!-- 수령자 연락처 (읽기 전용) -->
            <div class="form-group">
                <label for="receiverContact">수령자 연락처</label>
                <input type="tel" id="receiverContact" name="receiverContact" value="010-8765-4321" readonly>
            </div>

            <!-- 배송지 (읽기 전용) -->
            <div class="form-group">
                <label for="shippingAddress">배송지</label>
                <input type="text" id="shippingAddress" name="shippingAddress" value="서울특별시 강남구 테헤란로 123" readonly>
            </div>

            <!-- 주문 상태 (수정 가능) -->
            <div class="form-group">
                <label for="orderStatus">주문 상태</label>
                <select id="orderStatus" name="orderStatus" required>
                    <option value="주문 접수">주문 접수</option>
                    <option value="배송 준비 중">배송 준비 중</option>
                    <option value="배송 중">배송 중</option>
                    <option value="배송 완료">배송 완료</option>
                    <option value="주문 취소">주문 취소</option>
                </select>
            </div>
            <!-- 제출 버튼 -->
            <button type="submit" class="btn-submit">배송 정보 수정</button>
        </form>
</div>