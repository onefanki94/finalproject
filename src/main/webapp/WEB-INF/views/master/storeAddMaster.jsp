<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<script src="/js/Master.js"></script>
<script>
function submitStoreForm() {
    // 폼 데이터 유효성 검사
    if (!document.getElementById('title').value || !document.getElementById('ani_title').value || !document.getElementById('relDT').value || !document.getElementById('brand').value) {
        alert("필수 항목을 입력하지 않았습니다.");
        return false;
    }

    if (!document.getElementById('price').value || !document.getElementById('thumimg').value || !document.getElementById('fee').value || !document.getElementById('stock').value) {
        alert("필수 항목을 입력하지 않았습니다.");
        return false;
    }

    const code = document.getElementById('code').value;
    if (!code || code.trim() === "") {
        alert("대분류를 선택하세요.");
        return false;
    }

    // FormData 객체에 값 추가
    const title = document.getElementById('title').value;
    const ani_title = document.getElementById('ani_title').value;
    const relDT = document.getElementById('relDT').value; // 'rel_DT' -> 'relDT' 수정
    const brand = document.getElementById('brand').value;
    const price = document.getElementById('price').value;
    const thumimg = document.getElementById('thumimg').files[0];
    const fee = document.getElementById('fee').value;
    const stock = document.getElementById('stock').value;
    const pro_detail = document.getElementById('pro_detail').files[0]; // 'value' -> 'files[0]' 수정
    const token = localStorage.getItem('token');

    if (!token) {
        alert("로그인이 필요합니다.");
        location.href = "/user/login";
        return false;
    }

    // FormData 객체 생성 및 값 추가
    const postData = new FormData();
    postData.append('code', code);
    postData.append('title', title);
    postData.append('ani_title', ani_title);
    postData.append('relDT', relDT);
    postData.append('brand', brand);
    postData.append('price', price);
    postData.append('thumimg', thumimg);
    postData.append('fee', fee);
    postData.append('stock', stock);
    postData.append('pro_detail', pro_detail);
    postData.append('token', token);

    // AJAX 요청 보내기
    $.ajax({
        url: "/master/storeAddMasterOk",
        type: "POST",
        data: postData,  // FormData 객체를 직접 전송
        contentType: false,  // FormData를 사용할 때는 contentType을 false로 설정해야 함
        processData: false,  // FormData는 자동으로 직렬화되지 않도록 해야 함
        headers: {
            "Authorization": `Bearer ${token}`  // Authorization 헤더에 JWT 토큰 추가
        },
        success: function(data) {
            alert('글 작성이 완료되었습니다.');  // 성공 메시지
            location.href = "/master/storeMasterList";  // 글 목록 페이지로 이동
        },
        error: function(xhr, status, error) {
            if (xhr.status === 401) {
                alert('인증에 실패했습니다. 다시 로그인하세요.');
                location.href = "/user/login";  // 로그인 페이지로 이동
            } else {
                alert("요청 처리 중 오류가 발생했습니다.");
            }
            console.error("Error:", error);  // 오류 출력
        }
    });

    return false;  // 기본 폼 제출 방지
}
</script>

<div class="storeAdd">
    <h2>굿즈 상품 등록</h2>
    <form action="/master/storeAddMasterOk" method="post" enctype="multipart/form-data" onsubmit="return submitStoreForm()">
        <!-- 상품명 추가 -->
        <div><input type="hidden" id="idx" name="idx"/></div>
        <div><input type="hidden" id="token" name="token" /></div>
        <div>
            <label for="title">상품명:</label>
            <input type="text" id="title" name="title">
        </div>

        <!-- 애니 타이틀 추가 -->
        <div>
            <label for="ani_title">애니 타이틀:</label>
            <input type="text" id="ani_title" name="ani_title">
        </div>

        <!-- 상품 섬네일 추가 -->
        <div>
            <label for="thumimg"> 상품 섬네일 :</label>
            <input type="file" id="thumimg" name="thumimg" accept="image/*">
        </div>

        <!-- 출시일 추가 -->
        <div>
            <label for="relDT">출시일:</label>
            <input type="date" id="relDT" name="relDT"> <!-- 'relDT'로 수정 -->
        </div>

        <!-- 브랜드 추가 -->
        <div>
            <label for="brand">브랜드:</label>
            <input type="text" id="brand" name="brand">
        </div>

        <!-- 배송비 추가 -->
        <div>
            <label for="fee">배송비:</label>
            <input type="text" id="fee" name="fee">
        </div>

        <!-- 재고 추가 -->
        <div>
            <label for="stock">재고:</label>
            <input type="number" id="stock" name="stock">
        </div>

        <!-- 가격 추가 -->
        <div>
            <label for="price">가격:</label>
            <input type="text" id="price" name="price">
        </div>

        <!-- 카테고리 ( 대분류 중분류 )추가 -->
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

        <!-- 중분류 선택 -->
        <div>
            <label for="sub-category">중분류:</label>
            <select id="sub-category" name="sub-category" disabled>
                <option value="">중분류 선택</option>
            </select>
        </div>

        <!-- 상세 내용 이미지 추가 -->
        <div>
            <label for="pro_detail">상세 내용 이미지:</label>
            <input type="file" id="pro_detail" name="pro_detail" accept="image/*">
        </div>

        <!-- 폼 제출 버튼 -->
        <div>
            <input type="submit" value="굿즈 상품 추가">
        </div>
    </form>
</div>
