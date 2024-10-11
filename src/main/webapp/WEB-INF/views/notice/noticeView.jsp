<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

	<link href="/css/noticeView.css" rel="stylesheet" type="text/css">


    <section class="notice_info">
        <div class="notice_top">
            <h1>고객센터</h1>
            <div class="notice_tab">
                <ul class="list">
                    <li class="selected">
                        <a href="#tap1" class="btn">공지사항</a>
                    </li>
                    <li>
                        <a href="#tap2" class="btn">자주 묻는 질문(FAQ)</a>
                    </li>
                    <li>
                        <a href="#tap3" class="btn">1:1 문의</a>
                    </li>
                    <li>
                        <a href="#tap4" class="btn">이용약관</a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="noticeView">
            <h1>공지사항</h1>
        </div>
            <div class="viewInfo">
                <div class="row">
                    <div class="col-sm-12 p-2"><h3>꿈을 꾸는 고래</h3></div>
                </div>
                <div class="row custom-col">
                    <div class="col-sm-9 p-2">[공지]</div>
                    <div class="col-sm-2 text-end">2024-00-00</div>
                    <div class="col-sm-1 text-end"><img src="/img/cm/ico_view.png">4</div>
                </div>
            </div>

            <div class="cmContent">
                안녕하세요, 넥슨 고객 여러분.
                </br>
                매주 목요일은 넥슨 정기점검으로 9월 26일(목) 오전 4시 30분부터 오전 6시까지
                넥슨OTP 이용이 원활하지 않습니다.
                </br>
                고객 여러분들의 너그러운 양해 부탁드리며
                자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.


            </div>
        <div>



        <!-- 리스트 목록 -->
           <div class="list_section">
               <!-- <c:if test="${otherVo.preNo!=0}"></c:if> -->
                    <a href="#">
                    <div class="list_pre">
                        <i class="bi bi-chevron-up"></i>이전페이지
                    </div>
                    </a>

               <!-- <c:if test="${otherVo.preNo==0}"></c:if> -->



               <!-- <c:if test="${otherVo.nextNo!=0}"> -->
               <a href="#">
                <div class="list_next">
                    <i class="bi bi-chevron-down"></i>다음페이지
                </div>
                  </a>
               <!-- </c:if> -->
               <!-- <c:if test="${otherVo.nextNo==0}"></c:if>-->
           </div>

            <div class="listBt">
                <a class="btn btn-secondary btn-sm" href="javascript:reloadPage(${vo.nowSearchKey});" role="button">
                    목록
                </a>
          </div>
    </div>

</body>
</html>