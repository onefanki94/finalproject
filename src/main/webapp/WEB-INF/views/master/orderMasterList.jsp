<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>DashBoard - 주문 내역 리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css" />
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
<div class="orderManagement">
    <h2>주문 내역 리스트</h2>
    <table>
        <thead>
            <tr>
                <th>주문 번호</th>
                <th>사용자 이름</th>
                <th>상품 이름</th>
                <th>수량</th>
                <th>가격</th>
                <th>상태</th>
                <th>주문 일자</th>
                <th>작업</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>데이터 바인딩</td>
                    <td>
                        <a href="#" class="btn btn-info">상세보기</a>
                        <a href="#" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
        </tbody>
    </table>
</div>
  <div class="orderPageing">페이징 영역</div>