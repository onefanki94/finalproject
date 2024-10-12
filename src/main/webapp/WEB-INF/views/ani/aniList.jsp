<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/inc/page_header.jspf" %>

<script src="${pageContext.request.contextPath}/WEB-INF/js/aniList.js"></script>
<!DOCTYPE html>
 <html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSP Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/aniList.css" rel="stylesheet" type="text/css">
    <script src="/js/aniList.js"></script>
</link>

<body>
    <div class="aniList">
        <nav class="aniList navbar-dark bg-dark">
                <div class="aniList category-title">카테고리</div>
            <div>
                <hr />
                <div class="manage_menu">
                      <ul>
                        <li class="menu-item">장르</li>
                        <li class="submenu"><label><input type="checkbox" data-genre="미스터리"> 미스터리</label></li>
                        <li class="submenu"><label><input type="checkbox" data-genre="판타지"> 판타지</label></li>
                        <li class="submenu"><label><input type="checkbox" data-genre="드라마"> 드라마</label></li>
                        <li class="submenu"><label><input type="checkbox" data-genre="스포츠"> 스포츠</label></li>
                        <li class="submenu"><label><input type="checkbox" data-genre="코미디"> 코미디</label></li>
                        <li class="submenu"><label><input type="checkbox" data-genre="SF"> SF</label></li>
                    </ul>
                    <hr />
                    <ul>
                        <li class="menu-item">태그</li>
                        <li class="submenu"><label><input type="checkbox"> 이세계</label></li>
                        <li class="submenu"><label><input type="checkbox"> 극장판</label></li>
                        <li class="submenu"><label><input type="checkbox"> 이능력</label></li>
                        <li class="submenu"><label><input type="checkbox"> 순정/로맨스</label></li>
                        <li class="submenu"><label><input type="checkbox"> 스릴러</label></li>
                    </ul>
                    <hr />
                    <ul>
                        <li class="menu-item">전체관람가</li>
                        <li class="submenu"><label><input type="checkbox"> 12세 이상</label></li>
                        <li class="submenu"><label><input type="checkbox"> 15세 이상</label></li>
                        <li class="submenu"><label><input type="checkbox"> 19세 이상</label></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>


<!--===============================================================================-->
<div class="ani_view">
    <div class="ani_View">


        <div class="vod_list_select">
            <select name="select_input vod_select" class="select_input vod_select" style="background-color: white;">
                <option value="0" style="font-weight: 600; font-size: 14px;">최신순</option>
                <option value="1" style="font-weight: 600; font-size: 14px;">제목순</option>
                <option value="2" style="font-weight: 600; font-size: 14px;">인기순</option>
            </select>
        </div>

                <div class="search-container">
                    <input type="search" id="user-search" name="query" aria-label="사이트 내용을 통해 검색">
                    <button type="submit">검색</button>
                </div>

        </div>

        <div class="ani_viewList">
            <c:forEach var="ani" items="${aniList}">
                <div class="div_li">
                    <div class="list_img_bg" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        data-title="${ani.title}">
                        <img src="/img/ani_img/${ani.post_img}" alt="${ani.title}">
                        <div class="overlay">상세 보기</div>
                    </div>
                    <p>${ani.title}</p>
                    <p class="genre">
                        <span>${ani.anitype}</span> <!-- 장르 -->
                        <span>${ani.agetype} 관람</span> <!-- 나이 관람 -->
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!--==========================MODAL=======================================-->
<div class="animodal_body">
      <div class="animodal_background"></div>
          <div class="animodal_container">
            <div class="animodal_item">
              <div class="animodal_item_top">
                <div class="animodal_item_imgDiv">
                  <div class="animodal_item_imgBack">
                    <img src="/img/ani_img/${ani.post_img}" />
                  </div>
                  <img src="/img/ani_img/${ani.post_img}" />
                </div>
                <div class="animodal_item_infoDiv">
                  <nav>
                    <button><i class="fa-regular fa-heart"></i></button>
                    <button><i class="fa-solid fa-x"></i></button>
                  </nav>
                  <div>
                    <div class="animodal_infoHead">
                      <div class="ani_ageGrade">
                        <div>
                          <label>
                            <i class="fa-solid fa-star"></i>
                            4.7
                          </label>
                        </div>
                      </div>
                      <h1>주술회전 2기 : 시부야사변</h1>
                      <div class="ani_typeinfo">
                        <span>판타지</span>
                        <div></div>
                        <span>15세 관람가</span>
                        <div></div>
                        <span>감독 : 누구누구</span>
                      </div>
                    </div>
                    <div class="animodal_infoBody">
                      <div class="animodal_usergrade">
                        <span>내 평가 : </span>
                        <div>
                          <i class="fa-regular fa-star"></i>
                          <i class="fa-regular fa-star"></i>
                          <i class="fa-regular fa-star"></i>
                          <i class="fa-regular fa-star"></i>
                          <i class="fa-regular fa-star"></i>
                        </div>
                        <button class="grade_inputBtn">등록</button>
                      </div>
                      <div class="ani_outline">
                        <div>
                          <span
                            >최후에 웃는 건 사람인가, 저주인가 ‘고죠 사토루는 마땅한 때, 마땅한 장소 이쪽의 어드밴티지를 확립한 다음에 봉인에 나선다 결행은 10월 31일, 시부야’ 2018년 10월, 특급 주령의 교류회 습격 이후, 주술고전 내의 긴장감이 높아지는
                            가운데 드디어 내통자의 정체가 밝혀진다. 과연 내통자는 누구인가? 그 목적은? 그리고 2018년 10월 31일. 핼러윈으로 인해 북적거리는 시부야역 주변에 갑자기 ‘장막’이 쳐지고, 수많은 일반인이 갇힌다. ‘일반인만 가두는 장막’이란 고도의
                            결계술과, 일반인을 통해 전해진 ‘고죠 사토루를 데려와라’라는 지명에, 상층부는 피해를 최소화하기 위해 고죠 혼자서 시부야를 평정하라고 한다. 게토와 마히토 등 주저사와 주령들이 함정을 파놓고 기다리는 가운데, 고죠는 그곳에 홀로
                            진입한다. 장막의 밖에선 이타도리, 후시구로, 쿠기사키, 나나미, 그리고 수많은 주술사가 집결해 있었다. 시부야에 집결한 주술사 VS 주저사 · 주령! 역사상 가장 대규모의 저주가 드디어 시작된다!
                          </span>
                          <span class="ouline_more">...더 보기</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="animodal_item_bottom">
                <div class="animodal_item_bottom_nav">
                  <div>
                    <div>
                      <div><span>비슷한 작품</span></div>
                      <div></div>
                    </div>
                  </div>
                </div>
                <div class="bottom_ani_content">
                  <div>
                    <ul>
                      <li>
                        <div class="similar_ani_img">
                          <img src="/img/ani_img/${ani.post_img}" />
                        </div>
                        <div class="similar_ani_title">
                          <p>혈계전선</p>
                        </div>
                      </li>
                      <li>
                        <div class="similar_ani_img">
                          <img src="./img/anipost1.png" />
                        </div>
                        <div class="similar_ani_title">
                          <p>(무삭제) 귀멸의 칼날</p>
                        </div>
                      </li>
                      <li>
                        <div class="similar_ani_img">
                          <img src="./img/anipost1.png" />
                        </div>
                        <div class="similar_ani_title">
                          <p>(무삭제) 귀멸의 칼날</p>
                        </div>
                      </li>
                      <li>
                        <div class="similar_ani_img">
                          <img src="./img/anipost1.png" />
                        </div>
                        <div class="similar_ani_title">
                          <p>(무삭제) 귀멸의 칼날</p>
                        </div>
                      </li>
                      <li>
                        <div class="similar_ani_img">
                            <img src="./img/anipost1.png" />
                        </div>
                        <div class="similar_ani_title">
                            <p>(무삭제) 귀멸의 칼날</p>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

    2. 애니 줄거리 모달
    <div class="aniInfo_modal_body">
          <div></div>
          <div class="aniInfo_modal_container">
            <div class="aniInfo_modal_container_flex">
              <div>
                <span>작품 정보</span>
                <i class="fa-solid fa-x"></i>
              </div>
              <div class="item-detail-info-modal">
                <div>
                  <section>
                    <span>줄거리</span>
                    <span
                      >숯을 파는 마음씨 착한 소년 탄지로는, 어느 날 혈귀에게 가족을 몰살당한다. 유일하게 살아남은 누이동생 네즈코 마저도 혈귀로 변하고 마는데... 절망적인 현실에 큰 타격을 입은 탄지로였지만, 동생을 인간으로 돌려놓기 위해, 가족을 죽인
                      혈귀를 심판하기 위해, ‘귀살대’의 길을 가기로 결의한다. 인간과 혈귀가 엮어낸 애절한 오누이의 이야기가 지금 시작된다-!
                    </span>
                  </section>
                  <section>
                    <span>제작 정보</span>
                    <ul>
                      <li>
                        <span
                          >감독
                          <span>누구누구감독이름</span>
                        </span>
                      </li>
                      <li>
                        <span
                          >등록
                          <span>2024.10.10</span>
                        </span>
                      </li>
                    </ul>
                  </section>
                </div>
              </div>
            </div>
      </div>
    </div>

</body>
