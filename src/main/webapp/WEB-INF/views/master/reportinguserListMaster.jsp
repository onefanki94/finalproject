<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 신고 목록 리스트</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
<script src="/js/Master.js"></script>

<div class="reportinguserList-list-container">
<!-- 사용자 요약 정보 -->
        <div class="summary">
            <div>
                <strong>총 신고 수</strong>
                <p id="totalUsers">3 명</p>
            </div>
            <div>
                <strong>접수중</strong>
                <p id="activeUsers">2 명</p>
            </div>
            <div>
                <strong>처리대기</strong>
                <p id="inactiveUsers">1 명</p>
            </div>
            <div>
                <strong>처리완료</strong>
                <p id="newUsers">1 명</p>
            </div>
        </div>
            <h2>신고 목록</h2>
            <table class="reportinguserList-list table table-hover table-bordered">
                <thead class="table-light">
                    <tr>
                        <th style="width:2%"><input type="checkbox" name="selectAll" id="selectAll"/></th>
                        <th style="width:5%">No.</th>
                        <th style="width:10%">아이디</th>
                        <th style="width:15%">신고상태</th>
                        <th style="width:10%">관리자아이디</th>
                        <th style="width:10%">처리현황</th>
                        <th style="width:20%">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>1</td>
                        <td>user1</td>
                        <td>접수 완료</td>
                        <td>admin1</td>
                        <td>처리중</td>
                        <td>
                            <button class="btn btn-outline-success btn-sm">신고내역추가</button>
                            <button class="btn btn-outline-danger btn-sm">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>2</td>
                        <td>user2</td>
                        <td>처리 대기</td>
                        <td>admin2</td>
                        <td>대기중</td>
                        <td>
                            <button class="btn btn-outline-success btn-sm">신고내역추가</button>
                            <button class="btn btn-outline-danger btn-sm">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>3</td>
                        <td>user3</td>
                        <td>처리 완료</td>
                        <td>admin3</td>
                        <td>완료</td>
                        <td>
                            <button class="btn btn-outline-success btn-sm">신고내역추가</button>
                            <button class="btn btn-outline-danger btn-sm">삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- 페이징 영역 -->
            <div class="reportinguserListPageing">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">이전</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">다음</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <!-- 신고 내역 추가 모달창 -->
        <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="reportModalLabel">신고 내역 추가/해제</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form id="reportForm" action="/master/reportinguserOK" method="post">
                <div class="modal-body">
                  <input type="hidden" id="userid" name="userid" value="">
                  <!-- 신고 내용 입력 -->
                  <div class="form-group">
                    <label for="reason">신고 사유</label>
                    <textarea class="form-control" id="reason" name="reason" rows="3"></textarea>
                  </div>
                  <!-- 제재 기간 입력 (일 단위) -->
                  <div class="form-group">
                    <label for="banPeriod">제재 기간 (일)</label>
                    <input type="number" class="form-control" id="banPeriod" name="banPeriod" min="1" value="7" required>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">닫기</button>
                  <button type="submit" class="btn btn-outline-success btn-sm">신고 제출</button>
                  <!-- 잘못된 신고를 해제할 수 있는 버튼 -->
                  <button type="button" class="btn btn-outline-success btn-sm" id="removeReportBtn">신고 해제</button>
                </div>
              </form>
            </div>
          </div>
        </div>

