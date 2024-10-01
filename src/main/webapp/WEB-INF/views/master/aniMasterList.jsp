<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 애니리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
 <div class="anime-list-container">
        <h2>애니 목록</h2>
        <table class="anime-list table table-hover table-bordered">
            <thead>
                <tr>
                    <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
                    <th style="width:5%">애니번호</th>
                    <th style="width:6%">카테고리</th>
                    <th style="width:35%">작품명</th>
                    <th style="width:8%">최초방영일</th>
                    <th style="width:6%">등급</th>
                    <th style="width:15%">관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>1</td>
                    <td>액션</td>
                    <td>나루토</td>
                    <td>2002-10-03</td>
                    <td>15세</td>
                    <td>
                        <button class="btn btn-outline-success btn-sm"><a href="/master/aniAddMaster">추가</a></button>
                        <button class="btn btn-outline-secondary btn-sm">수정</button>
                        <button class="btn btn-outline-danger btn-sm">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>2</td>
                    <td>코미디</td>
                    <td>원피스</td>
                    <td>1999-10-20</td>
                    <td>12세</td>
                    <td>
                        <button class="btn btn-outline-success btn-sm"><a href="/master/aniAddMaster">추가</a></button>
                        <button class="btn btn-outline-secondary btn-sm">수정</button>
                        <button class="btn btn-outline-danger btn-sm">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="select" id="select"/></td>
                    <td>3</td>
                    <td>판타지</td>
                    <td>블리치</td>
                    <td>2004-10-05</td>
                    <td>15세</td>
                    <td>
                        <button class="btn btn-outline-success btn-sm"><a href="/master/aniAddMaster">추가</a></button>
                        <button class="btn btn-outline-secondary btn-sm"><a href="/master/aniEditMaster">수정</a></button>
                        <button class="btn btn-outline-danger btn-sm">삭제</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="aniPageing">1 2 3 4 5 ...</div>
    </div>
</body>
</html>