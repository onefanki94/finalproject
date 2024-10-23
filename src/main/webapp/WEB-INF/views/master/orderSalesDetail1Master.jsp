<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<div class="order-list-container">
    <h2>월별 매출 상세보기 - ${month}</h2>
    <table class="order-list">
        <thead>
            <tr>
                <th style="width:20%">주문번호</th>
                <th style="width:40%">상품명</th>
                <th style="width:15%">결제금액</th>
                <th style="width:15%">아이디</th>
                <th style="width:20%">주문 날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty orderList}">
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.productName}</td>
                        <td>₩${order.paymentAmount}</td>
                        <td>${order.userid}</td>
                        <td>${order.orderDate}</td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty orderList}">
                <tr>
                    <td colspan="5">해당 월에 대한 주문 내역이 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>