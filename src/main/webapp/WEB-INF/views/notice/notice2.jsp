<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/main_header.jspf"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>JSP Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/ckeditor/ckeditor.css"/>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<script src="/ckeditor/ckeditor.js"></script>
<link href="/css/notice2.css" rel="stylesheet" type="text/css">
</link>
</head>

<body>


<div class="detail_layer_pop" style="display:none;">
    <div class="detail_view">
        <div class="detail_layer_close" style="cursor:pointer;">
        <img src="/img/notice/close_1.png" alt="Close">
        </div>
        <div class="detail_view_layer">
            <div class="detil_new">

                <div class="titarea">
                    <div class="tit">
                        <span id="modalDate">2024.09.30</span>
                        " 애니플러스 VOD 추가 없데이트 안내 건"
                        <div id="modalTitle">" 애니플러스 VOD 추가 없데이트 안내 건"</div>
                    </div>
                </div>

                <div class="detail_content">
                    <div class="sample_txt">
                    <p id="modalContent">안녕하세요.애니플러스입니다.</p>
                    <p><br></p>
                    <p>VOD 작품 관련한 추가 업데이트 관련 안내 드립니다.</p>
                    <p>- 빅 오더 OVA</p>
                    <p>- 슈퍼 러버즈 OVA</p>
                    <p>공개일: 2024.09.28(토) 오전 10시 이후</p>
                    <p>※ 해당 작품은 멤버십 & 화별 과금 모두 이용 가능합니다.</p>
                    <p>많은 시청 바랍니다.</p>
                    <p>감사합니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="all">

<section class="notice_info">
    <div class="notice_top">
        <h1 class="customer">고객센터</h1>
        <div class="aaa">
            <div class="notice_tab">
                <ul class="list">
                    <li class="selected">
                        <a href="#tap1" class="btn">공지사항</a>
                    </li>
                    <li class="selected">
                        <a href="#tap2" class="btn">자주 묻는 질문</a>
                    </li>
                    <li class="selected">
                        <a href="#tap3" class="btn">1:1 문의</a>
                    </li>
                    <li class="selected">
                        <a href="#tap4" class="btn">이용약관</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>

    <div class="container">
        <div class="con_width">
            <div class="notice" id="content">
                <div class="tools">
                    <div class="search">
                        <select>
                            <option>제목</option>
                        </select>
                        <input type="text" id="textSearch" placeholder="검색어를 입력하세요." />
                        <button type="button" id="btnSearch">검색</button>
                    </div>
                </div>

                <h2 class="search-tags">
                    <a class="on" style="cursor:pointer;">
                    "#전체"
                    </a>
                    <a style="cursor:pointer;">
                    "#VOD"
                    </a>
                    <a style="cursor:pointer;">
                    "#멤버십"
                    </a>
                    <a style="cursor:pointer;">
                    "#환불"
                    </a>
                </h2>
            </div>

            <!-- 공지사항 리스트 -->
            <div class="bbb">
                <div class="content active" id="tap1"> <!-- 기본적으로 active 클래스를 추가 -->
                    <div class="noticeList">
                        <div class="row header">
                            <div class="col-sm-1 p-2">번호</div>
                            <div class="col-sm-2 p-2">카테고리</div>
                            <div class="col-sm-8 p-2">제목</div>
                            <div class="col-sm-1 p-2">등록일</div>
                        </div>
                        <!-- <c:forEach var="vo" items="${list}"></c:forEach> -->
                        <div class="row">
                            <div class="col-sm-1 p-2">3</div>
                            <div class="col-sm-2 p-2">[공지]</div>
                            <div class="col-sm-8 p-2"><a href="#" class="noticeTitle" data-title="공지사항 1" data-content="공지사항 1의 내용입니다.">제목</a></div>
                            <div class="col-sm-1 p-2">20024.01.01</div>
                        </div>
                    </div>
                </div>

                <div class="content" id="tap2">
                    <div class="FAQList">
                        <div class="f_header" style="height:auto; overflow:hidden; text-align:center;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="customer_table2">
                                <colgroup>
                                    <col width="20">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                    <!-- 질문 항목 -->
                                    <tr class="faq-question" style="cursor:pointer;">
                                        <td>Q</td>
                                        <td>
                                            멤버십 정기결제와 3개월권의 혜택 차이는 무엇인가요?
                                            <img src="img/notice/down.png" class="toggle-icon" style="width: 16px; height: 16px; vertical-align: middle;">
                                        </td>
                                    </tr>

                                    <!-- 답변 항목 (초기에는 숨김 처리) -->
                                    <tr class="faq-answer" style="display: none;">
                                        <td colspan="2">
                                            <div class="answer-text" style="padding: 15px; background: #333; color: #ddd;">
                                                <p>A. 멤버십 상품별 누릴 수 있는 혜택의 차이는 아래와 같습니다.</p>
                                                <p><strong>정기결제 (첫달무료)</strong></p>
                                                <p>- 혜택: 동시 방영 LIVE, 1080 VOD 다운로드 제공, 상영회 예매권 우대, 온라인샵 배송비 무료</p>
                                                <p>- 결제일 기준으로, 매달 12,900원이 결제 됩니다.</p>
                                                <p><strong>3개월권</strong></p>
                                                <p>- 혜택: 동시 방영 LIVE, 1080 VOD 다운로드 제공, 상영회 예매권 우대, 온라인샵 배송비 무료</p>
                                                <p>- 결제일 기준으로, 3개월간 이용 가능하며 만료 이후 추가 결제가 발생되지 않습니다.</p>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <div class="content" id="tap3">
                    <div class="inquiry-container">
                        <!-- 체크박스 영역 추가 -->
                        <div class="inquiry-checkbox-container">
                            <!-- 여러 개의 체크박스 추가 -->
                            <label>
                                <input type="checkbox" name="category" value="멤버십"> 멤버십
                            </label>
                            <label>
                                <input type="checkbox" name="category" value="환불"> 환불
                            </label>
                            <label>
                                <input type="checkbox" name="category" value="상품"> 상품
                            </label>
                            <label>
                                <input type="checkbox" name="category" value="배송"> 배송
                            </label>
                            <label>
                                <input type="checkbox" name="category" value="이벤트"> 이벤트
                            </label>
                            <label>
                                <input type="checkbox" name="category" value="기타"> 기타
                            </label>
                        </div>

                        <!-- 제목 입력 영역 -->
                        <form class="inquiry-write-tbl" method="post" action="" onsubmit="return commuFormCheck()">
                            <table class="inquiry-cm-write">
                                <tr>
                                    <th>제목</th>
                                    <td>
                                        <input type="text" name="subject" value="" id="subject" size="100" placeholder="제목을 입력하세요" class="inquiry-title">
                                    </td>
                                </tr>
                            </table>

                            <!-- 본문 내용 입력 영역 -->
                            <div class="inquiry-body">
                                <textarea id="content" name="content" class="inquiry-editor" placeholder="내용을 입력하세요" style="width: 90%; height: 300px;"></textarea>
                            </div>

                            <!-- 등록 버튼 -->
                            <div class="inquiry-footer">
                                <button type="button" class="inquiry-submit-btn">1:1 문의하기</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="content" id="tap4">
                    <div class="terms-container">
                        <h2>서비스 이용약관</h2>
                        <div class="terms-content">
                            <p><strong>제 1 조 (목적)</strong></p>
                            <p>본 약관은 주식회사 애니웨이브(이하 "회사")가 제공하는 콘텐츠와 재화 또는 용역(이하 "상품")을 구입하는 경우(이하 "구매")와 관련하여 회사와 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.</p>

                            <p><strong>제 2 조 (용어의 정의)</strong></p>
                            <p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br>
                            1. "회사" : 회사 또는 회원이 서비스 계약을 통해 이용 계약을 체결하여 제공받는 서비스 전반을 의미합니다.<br>
                            2. "이용자" : 회원 가입을 완료하고 회사의 서비스에 접근하여 이용하는 모든 개인 및 단체를 의미합니다.<br>
                            3. "서비스" : 회사가 제공하는 모든 온라인, 오프라인 서비스를 의미합니다.</p>


                        </div>
                    </div>
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

    </div>
</div>


<script>
//탭1_공지사항_모달
    document.querySelectorAll('.noticeTitle').forEach(item => {
        item.addEventListener('click', function (e) {
            e.preventDefault(); // 링크 기본 동작 방지

            // 모달 내용 업데이트
            const title = this.getAttribute('data-title');
            const content = this.getAttribute('data-content');

            document.getElementById('modalTitle').textContent = title;
            document.getElementById('modalContent').textContent = content;
            document.querySelector('.detail_layer_pop').style.display = 'block'; // 모달 보이기
        });
    });

    // 모달 닫기
    document.querySelector('.detail_layer_close').addEventListener('click', function () {
        document.querySelector('.detail_layer_pop').style.display = 'none'; // 모달 숨기기
    });




//탭 전환
    const tabList = document.querySelectorAll('.notice_tab .list li');
    const contentList = document.querySelectorAll('.content');

    tabList.forEach((tab, index) => {
        tab.querySelector('.btn').addEventListener('click', function (e) {
            e.preventDefault();
            // 모든 탭 비활성화 및 콘텐츠 숨김
            tabList.forEach(t => t.classList.remove('selected'));
            contentList.forEach(content => content.classList.remove('active'));

            // 현재 탭 활성화 및 해당 콘텐츠 보여줌
            tab.classList.add('selected');
            contentList[index].classList.add('active');
        });
    });


// 모든 질문 항목에 대해 클릭 이벤트 추가
    document.querySelectorAll('.faq-question').forEach(question => {
        question.addEventListener('click', function () {
            // 현재 질문의 다음 요소(답변)를 가져옴
            const answer = this.nextElementSibling;

            // 모든 답변을 숨기고 아이콘을 초기화
            document.querySelectorAll('.faq-answer').forEach(ans => {
                if (ans !== answer) ans.style.display = 'none';
            });

            document.querySelectorAll('.toggle-icon').forEach(icon => {
                icon.src = "img/notice/down.png"; // 모든 아이콘을 down으로 초기화
            });

            // 현재 답변을 보이거나 숨기기
            answer.style.display = (answer.style.display === 'none' || answer.style.display === '') ? 'table-row' : 'none';

            // 아이콘 변경
            const icon = this.querySelector('.toggle-icon');
            icon.src = (answer.style.display === 'table-row') ? "img/notice/up.png" : "img/notice/down.png";
        });
    });



</script>

</body>

</html>