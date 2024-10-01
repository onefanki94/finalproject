<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 문의사항</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>

 <div class="QNA-list-container">
        <h2>문의사항 리스트</h2>
        <table class="QNA-list">
            <thead>
                <tr>
                    <th style="width:2%">No.</th>
                    <th style="width:6%">카테고리</th>
                    <th style="width:40%">제목</th>
                    <th style="width:6%">작성자</th>
                    <th style="width:6%">등록일</th>
                    <th style="width:10%">관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>계정 문의</td>
                    <td>계정 비밀번호 관련 문의</td>
                    <td>홍길동</td>
                    <td>2023-09-25</td>
                    <td>
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/QNAnswerDetailMaster">답변</a></button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>상품 문의</td>
                    <td>상품 재입고 관련 문의</td>
                    <td>김철수</td>
                    <td>2023-09-24</td>
                    <td>
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/QNAnswerDetailMaster">답변</a></button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>배송 문의</td>
                    <td>배송이 지연되고 있습니다.</td>
                    <td>이영희</td>
                    <td>2023-09-23</td>
                    <td>
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/QNAnswerDetailMaster">답변</a></button>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>환불 문의</td>
                    <td>환불 요청 관련 문의</td>
                    <td>박민수</td>
                    <td>2023-09-22</td>
                    <td>
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/QNAnswerDetailMaster">답변</a></button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 페이징 영역 -->
    <div class="QNAPageing">1 2 3 4 5 ...</div>
</div>
</body>
</html>