<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 애니 수정</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

<div class="aniEdit">
    <h2>애니 수정</h2>
    <form action="/master/aniEditMasterOk" method="post" enctype="multipart/form-data">
        <div><input type="hidden" id="idx" name="idx" value="${ani.idx}"></div>

        <!-- 기존 이미지 저장용 히든 필드 -->
        <div><input type="hidden" id="currentImg" name="currentImg" value="${ani.post_img}"></div>

        <!-- 포스터 이미지 -->
        <div>
            <label for="post_img">포스터 이미지:</label>
            <input type="file" id="post_img" name="post_img" accept="image/*">
            <c:if test="${not empty ani.post_img}">
                <div>
                    <img src="/reviewFileUpload/${ani.post_img}" alt="Current Image" style="width: 150px; height: auto;">
                    <p>현재 이미지: ${ani.post_img}</p>
                </div>
            </c:if>
        </div>

        <!-- 제목 -->
        <div>
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" value="${ani.title}">
        </div>

        <!-- 장르 -->
        <div>
                 <label for="anitype">장르:</label>
                 <select id="anitype" name="anitype">
                     <option value="1">드라마</option>
                     <option value="2">미스터리</option>
                     <option value="3">스포츠</option>
                     <option value="4">코미디</option>
                     <option value="5">판타지</option>
                     <option value="6">SF</option>
                 </select>
             </div>

        <!-- 감독 -->
        <div>
            <label for="director">감독:</label>
            <input type="text" id="director" name="director" value="${ani.director}">
        </div>

        <!-- 연령 등급 -->
        <div>
                 <label for="agetype">연령 등급:</label>
                 <select id="agetype" name="agetype">
                     <option value="1">전체</option>
                     <option value="2">12세 이상</option>
                     <option value="3">15세 이상</option>
                     <option value="4">19세 이상</option>
                 </select>
             </div>

        <!-- 줄거리 -->
        <div>
            <label for="outline">줄거리:</label>
            <textarea id="outline" name="outline" rows="4">${ani.outline}</textarea>
        </div>

        <!-- 수정 버튼 -->
        <div>
            <input type="submit" value="애니 수정">
        </div>
    </form>
</div>
