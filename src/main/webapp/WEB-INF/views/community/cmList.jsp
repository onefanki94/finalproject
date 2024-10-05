<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="/css/cmList.css" rel="stylesheet" type="text/css">
</link>

<script>
    window.onload = function(){
    console.log("호출");
        var token = localStorage.getItem("token");
        if(token != "" && token != null){
            $.ajax({
                url:"/getuser",
                type:"get",
                data:{Authorization:token},
                success: function(r){
                console.log(r);
                    userid=r;
                    tag="";
                    tag+=`
                        <div>`+userid+`</div>
                    `;
                    document.getElementById("test").innerHTML=tag;
                }

                    })
        }

    }

</script>


<section class="top_info">
    <div class="cm_tab">
        <h1>커뮤니티</h1>
        <div class="cm_opt">
            <ul class="list">
                <li class="selected">
                    <a href="#tap1" class="btn">최신글보기</a>
                </li>
                <li>
                    <a href="#tap2" class="btn">자랑</a>
                </li>
                <li>
                    <a href="#tap4" class="btn">친목</a>
                </li>
                <li>
                    <a href="#tap4" class="btn">팬아트</a>
                </li>
                <li>
                    <a href="/allnotice" class="btn">통합공지</a>
                </li>
            </ul>
        </div>
    </div>
</section>
<div id="test"></div>

<div class="container">
    <div class="cummunity" id="content">

        <div class="search-area">
            <div class="left-area">
                <div class="head-box">
                    <select id="sel-head">
                        <option value="head1">최신글보기</option>
                        <option value="head2">자랑</option>
                        <option value="head1">친목</option>
                        <option value="head2">팬아트</option>
                    </select>
                </div>
                <div class="filter-box">
                    <select id="selectDirection">
                        <option value="DEFAULT">최신글순</option>
                        <option value="NEW_REPLY">최신댓글순</option>
                        <option value="REPLY">많은댓글순</option>
                        <option value="LIKE">조회수순</option>
                    </select>
                </div>
            </div>

            <div class="right-area">
                <div class="select-box">
                    <select id="selectCategory">
                        <option value="THREAD_TITLE_AND_CONTENT">제목 + 내용</option>
                        <option value="THREAD_TITLE">제목</option>
                        <option value="THREAD_CONTENT">내용</option>
                    </select>
                </div>
                <div class="search">
                    <input type="text" id="textSearch" placeholder="검색어를 입력하세요." />
                    <button type="button" id="btnSearch">검색</button>
                </div>
            </div>
        </div>


        <!-- 커뮤니티 리스트 -->
        <div class="content active" id="tap1"> <!-- 기본적으로 active 클래스를 추가 -->
            <div class="newList">

                <div class="row header">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">카테고리</div>
                    <div class="col-sm-7 p-2">제목</div>
                    <div class="col-sm-2 p-2">날짜</div>
                    <div class="col-sm-1 p-2">조회</div>
                </div>

                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/cmView">신나는 일요일</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">1234</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/cmView">배고프네</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
            </div>
        </div>

        <div class="content" id="tap2">
            <div class="boastList">

                <div class="row header">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">카테고리</div>
                    <div class="col-sm-7 p-2">제목</div>
                    <div class="col-sm-2 p-2">날짜</div>
                    <div class="col-sm-1 p-2">조회</div>
                </div>

                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/boards/view/1">신나는 일요일</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">1234</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/boards/view/1">배고프네</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
            </div>
        </div>

        <div class="content" id="tap3">
            <div class="friendList">

                <div class="row header">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">카테고리</div>
                    <div class="col-sm-7 p-2">제목</div>
                    <div class="col-sm-2 p-2">날짜</div>
                    <div class="col-sm-1 p-2">조회</div>
                </div>

                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/boards/view/1">신나는 일요일</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">1234</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/boards/view/1">배고프네</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
            </div>
        </div>

        <div class="content" id="tap4">
            <div class="fanartList">

                <div class="row header">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">카테고리</div>
                    <div class="col-sm-7 p-2">제목</div>
                    <div class="col-sm-2 p-2">날짜</div>
                    <div class="col-sm-1 p-2">조회</div>
                </div>

                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">번호</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/boards/view/1">신나는 일요일</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
                <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                <div class="row">
                    <div class="col-sm-1 p-2">1234</div>
                    <div class="col-sm-1 p-2">[덕질]</div>
                    <div class="col-sm-7 p-2"><a href="/boards/view/1">배고프네</a></div>
                    <div class="col-sm-2 p-2">2024-09-29</div>
                    <div class="col-sm-1 p-2">3</div>
                </div>
            </div>
        </div>

        <div class="new_write">
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
const tabList = document.querySelectorAll('.cm_tab .list li');
const contentList = document.querySelectorAll('.content');

tabList.forEach((tab, index) => {
    const button = tab.querySelector('.btn');

    button.addEventListener('click', function (e) {
        if (button.getAttribute('href') === '/allnotice') {
            // 통합공지 링크 클릭 시 페이지 이동
            return; // 기본 동작을 허용
        }

        e.preventDefault(); // 기본 동작 방지 (탭 링크 클릭 시)
        // 모든 탭 비활성화 및 콘텐츠 숨김
        tabList.forEach(t => t.classList.remove('selected'));
        contentList.forEach(content => content.classList.remove('active'));

        // 현재 탭 활성화 및 해당 콘텐츠 보여줌
        tab.classList.add('selected');
        contentList[index].classList.add('active');
    });
});
</script>

</body>

</html>