<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/js/MasterPage.js"></script>
<script src="/js/JWTLogin.js"></script>
<div class="page-header">
            <h1>DashBoard</h1>
            <p>일별 및 월별 통계, 사용자 활동 및 시스템 관리 정보를 확인할 수 있는 대시보드입니다.</p>
        </div>
<!-- 차트 영역 -->
        <div class="chart">
            <div class="combinedDailyChart">
                <h4 class="text-center">일별 / 월별 통합 주문 통계</h4>
                <canvas id="combinedDailyChartView"></canvas>
            </div>
            <div class="avgUserDailyChart">
                <h4 class="text-center">회원가입 유저 수</h4>
            <canvas id="registrationChart" width="400" height="200"></canvas>
            </div>
        </div>


       <div class="summary-card">
                   <div class="card">
                       <div class="icon"><i class="fas fa-users"></i></div>
                       <h4>총 회원 수</h4>
                       <h5 id="totalUsers">1,200명</h5>
                       <p>전체 등록된 회원 수</p>
                   </div>
                   <div class="card">
                       <div class="icon"><i class="fas fa-shopping-cart"></i></div>
                       <h4>총 주문 수</h4>
                       <h5 id="totalOrders">5,000건</h5>
                       <p>전체 주문 건수</p>
                   </div>
                   <div class="card">
                       <div class="icon"><i class="fas fa-dollar-sign"></i></div>
                       <h4>총 매출액</h4>
                       <h5 id="totalRevenue">150,000,000원</h5>
                       <p>전체 누적 매출</p>
                   </div>
                   <div class="card">
                       <div class="icon"><i class="fas fa-chart-line"></i></div>
                       <h4>실시간 접속자</h4>
                       <h5 id="liveUsers">30명</h5>
                       <p>현재 접속 중인 사용자</p>
                   </div>
               </div>

 <div class="table-container">
         <!-- 첫 번째 테이블: 주문 활동 -->
       <div class="activity-section">
                   <div class="section-header">
                       <h4 class="table-title">주문 활동</h4>
                       <a href="/master/orderMasterList" class="more-link">더보기</a>
                   </div>
                   <table class="activity-table">
                       <thead>
                           <tr>
                               <th>주문 번호</th>
                               <th>고객명</th>
                               <th>상품명</th>
                               <th>결제 금액</th>
                               <th>주문 상태</th>
                               <th>주문 일시</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td>20230925001</td>
                               <td>홍길동</td>
                               <td>애니 굿즈 티셔츠</td>
                               <td>45,000원</td>
                               <td><span class="badge badge-warning">배송 중</span></td>
                               <td>2023-09-25 14:35</td>
                           </tr>
                           <tr>
                               <td>20230925002</td>
                               <td>김철수</td>
                               <td>애니 포스터 세트</td>
                               <td>30,000원</td>
                               <td><span class="badge badge-success">배송 완료</span></td>
                               <td>2023-09-24 11:22</td>
                           </tr>
                       </tbody>
                   </table>
               </div>

         <!-- 두 번째 테이블: 기타 활동 -->
                 <div class="activity-section">
                     <div class="section-header">
                         <h4 class="table-title">문의 활동</h4>
                         <a href="/master/QNAMasterList" class="more-link">더보기</a>
                     </div>
                     <table class="activity-table">
                         <thead>
                             <tr>
                                 <th>활동 유형</th>
                                 <th>작성자</th>
                                 <th>내용</th>
                                 <th>상태</th>
                                 <th>작성 일시</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr>
                                 <td>문의 작성</td>
                                 <td>김영희</td>
                                 <td>배송이 지연되고 있는데 언제 받을 수 있을까요?</td>
                                 <td><span class="badge badge-warning">처리 중</span></td>
                                 <td>2023-09-23 09:10</td>
                             </tr>
                             <tr>
                                 <td>리뷰 작성</td>
                                 <td>이철수</td>
                                 <td>애니 굿즈 포스터, 품질이 정말 좋네요! ★★★★☆</td>
                                 <td><span class="badge badge-success">완료</span></td>
                                 <td>2023-09-22 14:55</td>
                             </tr>
                         </tbody>
                     </table>
                 </div>

                 <!-- 세 번째 테이블: 회원 가입 활동 -->
                 <div class="activity-section">
                     <div class="section-header">
                         <h4 class="table-title">회원 가입 활동</h4>
                         <a href="/master/userMasterList" class="more-link">더보기</a>
                     </div>
                     <table class="activity-table">
                         <thead>
                             <tr>
                                 <th>회원명</th>
                                 <th>가입 이메일</th>
                                 <th>가입 상태</th>
                                 <th>가입 일시</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr>
                                 <td>이영희</td>
                                 <td>younghee@example.com</td>
                                 <td><span class="badge badge-info">신규 가입</span></td>
                                 <td>2023-09-24 10:15</td>
                             </tr>
                             <tr>
                                 <td>박민수</td>
                                 <td>minspark@example.com</td>
                                 <td><span class="badge badge-info">신규 가입</span></td>
                                 <td>2023-09-23 16:45</td>
                             </tr>
                         </tbody>
                     </table>
                 </div>
                 </div>