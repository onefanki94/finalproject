<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="/css/cmList.css" rel="stylesheet" type="text/css">
</link>



<section class="top_info">
    <div class="cm_tab">
        <h1>커뮤니티</h1>
        <div class="cm_opt">
            <ul class="list">
                <li class="${commtype == 'all' ? 'selected' : ''}">
                    <a href="javascript:void(0);" class="btn" onclick="showTab('all')">최신글보기</a>
                </li>
                <li class="${commtype == '10' ? 'selected' : ''}">
                    <a href="javascript:void(0);" class="btn" onclick="showTab('10')">자랑</a>
                </li>
                <li class="${commtype == '30' ? 'selected' : ''}">
                    <a href="javascript:void(0);" class="btn" onclick="showTab('30')">친목</a>
                </li>
                <li class="${commtype == '40' ? 'selected' : ''}">
                    <a href="javascript:void(0);" class="btn" onclick="showTab('40')">팬아트</a>
                </li>
                <li>
                    <a href="/allnotice" class="btn">통합공지</a>
                </li>
            </ul>
        </div>
    </div>
</section>

<div class="container">
    <div class="cummunity" id="content">
        <form id="searchForm" action="/cmList" method="get">
            <div class="search-area">
                <div class="left-area">
                    <div class="head-box">
                        <select id="commtype" name="commtype" onchange="submitSearchForm()">
                            <option value="all" ${commtype == 'all' ? 'selected="selected"' : ''}>최신글보기</option>
                            <option value="10" ${commtype == '10' ? 'selected="selected"' : ''}>자랑</option>
                            <option value="30" ${commtype == '30' ? 'selected="selected"' : ''}>친목</option>
                            <option value="40" ${commtype == '40' ? 'selected="selected"' : ''}>팬아트</option>
                        </select>
                    </div>
                    <div class="filter-box">
                        <select id="selectDirection" name="orderBy" onchange="submitSearchForm()">
                            <option value="DEFAULT" ${orderBy == 'DEFAULT' ? 'selected="selected"' : ''}>최신글순</option>
                            <option value="NEW_REPLY" ${orderBy == 'NEW_REPLY' ? 'selected="selected"' : ''}>최신댓글순</option>
                            <option value="REPLY" ${orderBy == 'REPLY' ? 'selected="selected"' : ''}>많은댓글순</option>
                            <option value="LIKE" ${orderBy == 'LIKE' ? 'selected="selected"' : ''}>조회수순</option>
                        </select>
                    </div>
                </div>

                <div class="right-area">
                    <div class="select-box">
                        <select id="selectCategory" name="searchCategory">
                            <option value="TITLE_AND_CONTENT" ${searchCategory == 'TITLE_AND_CONTENT' ? 'selected' : ''}>제목 + 내용</option>
                            <option value="TITLE" ${searchCategory == 'TITLE' ? 'selected' : ''}>제목</option>
                            <option value="CONTENT" ${searchCategory == 'CONTENT' ? 'selected' : ''}>내용</option>
                        </select>
                    </div>
                    <div class="search">
                        <input type="text" id="textSearch" id="searchKeyword" name="searchKeyword" value="${searchKeyword}" placeholder="검색어를 입력하세요." />
                        <button type="button" id="btnSearch" onclick="submitSearchForm()">검색</button>
                    </div>
                </div>
            </div>
        </form>

        <!-- 공통 커뮤니티 리스트 -->
        <div class="content active" id="contentList">
            <div class="allList">
                <div class="row header">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">카테고리</div>
                    <div class="col-sm-7 p-2">제목</div>
                    <div class="col-sm-2 p-2">날짜</div>
                    <div class="col-sm-1 p-2">조회</div>
                </div>

                <!-- 통합된 리스트 출력 -->
                <c:forEach var="vo" items="${list}">
                    <!-- commtype을 문자열로 변환 후 비교 -->
                    <c:if test="${commtype eq 'all' || (vo.commtype eq '자랑' && commtype eq 10) || (vo.commtype eq '친목' && commtype eq 30) || (vo.commtype eq '팬아트' && commtype eq 40)}">
                        <div class="row">
                            <div class="col-sm-1 p-2">${vo.idx}</div>
                            <div class="col-sm-1 p-2">${vo.commtype}</div>
                            <div class="col-sm-7 p-2"><a href="/cmView?idx=${vo.idx}">${vo.title}</a></div>
                            <div class="col-sm-2 p-2">${vo.regDT}</div>
                            <div class="col-sm-1 p-2">${vo.hit}</div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <div class="new_write" style="display:none;">
            <a href="/cmWrite">글쓰기</a>
        </div>
    </div>
    <div class="pagination">
        <ul  class="paging">

            <!-- 이전페이지 -->
                <%-- <c:if test="${pVO.nowPage==1}"> </c:if>--%>
                <li  class="pre"><a class="page-link" href="javascript:void(0);"><img src="/img/cm/left-chevron.png" style=" width:20px; height:18px; " /></a></li>

            <!-- 첫번쨰 페이지가 아니면 -->
                <%-- <c:if test="${pVO.nowPage>1}"> </c:if>--%>
                   <li class="pre"><a class="page-link" href="javascript:reloadPage(${pVO.searchKey},${pVO.nowPage-1});"'><img src="/img/cm/left-chevron.png" style=" width:20px; height:18px; " /></a></li>

            <%--<c:forEach var="p" begin="${pVO.startPageNum}" end="${pVO.startPageNum+pVO.onePageNum-1 }"> </c:forEach>--%>
                <%-- c:if test="${p<=pVO.totalPage}"> </c:if>--%>
                    <li class="page" <c:if test="${p==pVO.nowPage}">active</c:if>'><a class="page-link"  href="javascript:reloadPage(${pVO.searchKey},${p});">${p}</a></li>



            <!-- 다음페이가 없을때 -->
                <%-- <c:if test="${pVO.nowPage==pVO.totalPage}"></c:if>--%>
                    <li class="next"><a class="page-link" href="javascript:void(0);"><img src="/img/cm/right-chevron.png" style=" width:20px; height:18px; "/></a></li>

            <!-- 다음페이지가 있을때 -->
                <%-- <c:if test="${pVO.nowPage<pVO.totalPage}"></c:if>--%>
                    <li  class="next"><a class="page-link" href="javascript:reloadPage(${pVO.searchKey},${pVO.nowPage+1});"><img src="/img/cm/right-chevron.png" style=" width:20px;height:18px; " /></a></li>

         </ul>
    </div>

</div>


<script>

// 전체 탭을 클릭하면 필터를 초기화하고 탭 필터링을 수행
    function resetFilterAndShowTab(commtype) {
        document.getElementById("commtype").value = "all"; // 드롭다운을 초기화
        showTab(commtype);
    }





// showTab 함수 정의(탭 전환)
        function showTab(commtype) {
            console.log("Tab clicked: " + commtype); // 클릭 시 commtype 값 출력
            // 검색 폼에 commtype 값을 설정
            document.getElementById("commtype").value = commtype;
            document.getElementById("searchForm").submit();
        }

// 드롭다운 변경 시 폼 제출
    function submitSearchForm() {
        document.getElementById("searchForm").submit();
    }


        // 검색 폼 제출 함수
            function submitSearchForm() {
                document.getElementById("searchForm").submit();
            }

window.onload = function(){
    console.log("호출");

    var token = localStorage.getItem("token"); //토근 값 가져오기
    if(token != "" && token != null){
        $.ajax({
            url:"/getuser",
            type:"get",
            data:{Authorization:token},
            success: function(userid){
                console.log("로그인된 사용자 ID:" + userid);

                    if(userid && userid.trim() !== ""){
                        //로그인 상태일 때 글쓰기 버튼을 표시
                        document.querySelector(".new_write").style.display ="block";
                    }else{
                        //로그인되지 않은 상태일 때 글쓰기 버튼을 숨김
                        document.querySelector(".new_wrtie").style.display= "none";
                    }
                },
                error: function(){
                    console.error("로그인 여부 확인 실패");
                    document.querySelector(".new_write").style.display = "none"
                }
        });
    }else{
        //토큰이 없을 때 글쓰기 버튼 숨김
        document.querySelector(".new_write").style.display ="none";
    }






};

</script>

</body>

</html>