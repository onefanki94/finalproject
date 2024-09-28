<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>DashBoard - 애니 추가</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<div class="mastermain">
    <nav class="navbar navbar-dark bg-dark">
        <div class="management"><a href="/master/masterMain">관리자 Management</a></div>
        <div>
            <div class="manage_menu">
                <ul>
                    <a href="" class="menu-item">회원관리</a>
                    <li class="submenu"><a href="/master/userMasterList">회원목록</a></li>
                    <li class="submenu"><a href="/master/reporinguserMasterList">신고계정목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">애니관리</a>
                    <li class="submenu"><a href="/master/aniMasterList">애니목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">굿즈관리</a>
                    <li class="submenu"><a href="/master/storeMasterList">굿즈목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">주문관리</a>
                    <li class="submenu"><a href="/master/orderMasterList">주문내역리스트</a></li>
                    <li class="submenu"><a href="#">일/월별 매출내역</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">신고관리</a>
                    <li class="submenu"><a href="/master/reportinguserListMaster">신고목록</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">게시판,댓글, 리뷰관리</a>
                    <li class="submenu"><a href="/master/boardMasterAll">게시판</a></li>
                    <li class="submenu"><a href="/master/boardMasterReplyAll">댓글</a></li>
                    <li class="submenu"><a href="/master/boardMasterReviewAll">리뷰</a></li>
                </ul>
                <ul>
                    <a href="#" class="menu-item">기타관리</a>
                    <li class="submenu"><a href="/master/noticeMasterList">공지사항</a></li>
                    <li class="submenu"><a href="#">문의사항</a></li>
                    <li class="submenu"><a href="#">FAQ</a></li>
                    <li class="submenu"><a href="#">이벤트</a></li>
                </ul>
        </div>
        </div>
    </nav>
</div>
<div class="aniAdd">
<h2>애니 등록</h2>
<form action="/master/aniAddMasterOk" method="post" enctype="multipart/form-data">
    <div>
        <label for="post_img">포스터 이미지:</label>
        <input type="file" id="post_img" name="post_img" accept="image/*" required>
    </div>

    <div>
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>
    </div>

    <div>
        <label for="anitype">장르:</label>
        <select id="anitype" name="anitype" required>
            <option value="액션">액션</option>
            <option value="모험">모험</option>
            <option value="로맨스">로맨스</option>
            <option value="판타지">판타지</option>
            <option value="공포">공포</option>
        </select>
    </div>

    <div>
        <label for="director">감독:</label>
        <input type="text" id="director" name="director" required>
    </div>

    <div>
        <label for="country">국가:</label>
        <input type="text" id="country" name="country" required>
    </div>

    <div>
        <label for="agetype">연령 등급:</label>
        <select id="agetype" name="agetype" required>
            <option value="전체">전체</option>
            <option value="12세 이상">12세 이상</option>
            <option value="15세 이상">15세 이상</option>
            <option value="19세 이상">19세 이상</option>
        </select>
    </div>

    <div>
        <label for="outline">줄거리:</label>
        <textarea id="outline" name="outline" rows="4" required></textarea>
    </div>


    <div class="contentdiv">
        <label for="내용">내용:</label>
        <textarea id="content" name="content" rows="10" required></textarea>
    </div>
    <div>
        <input type="submit" value="애니 추가">
    </div>
</form>
</div>
