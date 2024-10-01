<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/inc/Masterheader.jspf" %>
<title>DashBoard - 애니 추가</title>
<link href="/css/masterStyle.css" rel="stylesheet" type="text/css"></link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/MasterPage.js"></script>
 <div class="aniAdd">
         <h2>애니 등록</h2>
         <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                          <input type="submit" class="btn btn-outline-success btn-sm" value="애니 추가" style="width:150px; margin-bottom : 20px;">
                      </div>
         <form action="/master/aniAddMasterOk" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
             <div class="mb-3 row">
                 <label for="post_img" class="col-sm-2 col-form-label">포스터 이미지:</label>
                 <div class="col-sm-8">
                     <input type="file" class="form-control" id="post_img" name="post_img" accept="image/*" placeholder="1개의 포스터 이미지를 선택해주세요." required>
                     <div class="invalid-feedback">포스터 이미지를 선택해 주세요.</div>
                 </div>
             </div>

             <div class="mb-3 row">
                 <label for="title" class="col-sm-2 col-form-label">제목:</label>
                 <div class="col-sm-8">
                     <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required>
                     <div class="invalid-feedback">제목을 입력해 주세요.</div>
                 </div>
             </div>

             <div class="mb-3 row">
                 <label for="anitype" class="col-sm-2 col-form-label">장르:</label>
                 <div class="col-sm-8">
                     <select id="anitype" name="anitype" class="form-select" required>
                         <option value="" disabled selected>장르를 선택하세요.</option>
                         <option value="액션">액션</option>
                         <option value="모험">모험</option>
                         <option value="로맨스">로맨스</option>
                         <option value="판타지">판타지</option>
                         <option value="공포">공포</option>
                     </select>
                     <div class="invalid-feedback">장르를 선택해 주세요.</div>
                 </div>
             </div>

             <div class="mb-3 row">
                 <label for="director" class="col-sm-2 col-form-label">감독:</label>
                 <div class="col-sm-8">
                     <input type="text" class="form-control" id="director" name="director" placeholder="애니 감독을 입력하세요" required>
                     <div class="invalid-feedback">감독을 입력해 주세요.</div>
                 </div>
             </div>

             <div class="mb-3 row">
                 <label for="country" class="col-sm-2 col-form-label">국가:</label>
                 <div class="col-sm-8">
                     <input type="text" class="form-control" id="country" name="country" placeholder="국가를 입력하세요" required>
                     <div class="invalid-feedback">국가를 입력해 주세요.</div>
                 </div>
             </div>

             <div class="mb-3 row">
                 <label for="agetype" class="col-sm-2 col-form-label">연령 등급:</label>
                 <div class="col-sm-8">
                     <select id="agetype" name="agetype" class="form-select" required>
                         <option value="전체">전체</option>
                         <option value="12세 이상">12세 이상</option>
                         <option value="15세 이상">15세 이상</option>
                         <option value="19세 이상">19세 이상</option>
                     </select>
                     <div class="invalid-feedback">연령 등급을 선택해 주세요.</div>
                 </div>
             </div>

             <div class="mb-3 row">
                 <label for="outline" class="col-sm-2 col-form-label">줄거리:</label>
                 <div class="col-sm-8">
                     <textarea id="outline" name="outline" class="form-control" rows="4" placeholder="줄거리를 입력하세요" required></textarea>
                     <div class="invalid-feedback">줄거리를 입력해 주세요.</div>
                 </div>
             </div>

             <div class="mb-3 row">
                 <label for="content" class="col-sm-2 col-form-label">내용:</label>
                 <div class="col-sm-8">
                     <textarea id="content" name="content" class="form-control" rows="10" placeholder="애니 상세내용을 입력하세요" required></textarea>
                     <div class="invalid-feedback">상세내용을 입력해 주세요.</div>
                 </div>
             </div>


         </form>
     </div>