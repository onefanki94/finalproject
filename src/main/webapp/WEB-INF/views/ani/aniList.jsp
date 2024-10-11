<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <%@include file="/WEB-INF/inc/main_header.jspf" %>
            <!DOCTYPE html>
            <html lang="ko">
            <head>
                <meta charset="UTF-8">
                <title>JSP Template</title>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/aniList.css" rel="stylesheet" type="text/css">
                <script src="/js/aniList.js"></script>
                </link>
<bady>
    <div class="aniList">
        <nav class="aniList navbar-dark bg-dark">

            <div class="aniList category-title">카테고리</div>

                <div class="aniList category-title">카테고리</div>

            <div>
                <hr />
                <div class="manage_menu">
                    <ul>
                        <li class="menu-item">장르</li>
                        <li class="submenu"><label><input type="checkbox"> 미스터리</label></li>
                        <li class="submenu"><label><input type="checkbox"> 오리지널</label></li>
                        <li class="submenu"><label><input type="checkbox"> 드라마</label></li>
                        <li class="submenu"><label><input type="checkbox"> 로맨스</label></li>
                        <li class="submenu"><label><input type="checkbox"> SF</label></li>
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


        <div class="ani_viewList">
            <div class="div_li">
                <div class="list_img_bg" data-bs-toggle="modal" data-bs-target="#exampleModal"
                    data-title="바람의 검심 -메이지 검객 낭만기- 교토 동란"
                    data-img="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240923164753.jpeg">


        <div class="vod_list_select"></div>
            <select name="select_input vod_select" class="select_input vod_select" style="background-color: white;">
                <option value="0" style="font-weight: 600; font-size: 14px;">최신순</option>
                <option value="1" style="font-weight: 600; font-size: 14px;">제목순</option>
                <option value="2" style="font-weight: 600; font-size: 14px;">인기순</option>
            </select>

            <div class="search-container">
                <input type="search" id="user-search" name="query" aria-label="사이트 내용을 통해 검색">
                <button type="submit">검색</button>
            </div>
        </div>

        <div class="ani_viewList">
            <div class="div_li">
                <div class="list_img_bg" data-bs-toggle="modal" data-bs-target="#exampleModal"
                    data-title="바람의 검심 -메이지 검객 낭만기- 교토 동란">

                    <img src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240923164753.jpeg"
                        alt="바람의 검심 -메이지 검객 낭만기- 교토 동란">
                    <div class="overlay">상세 보기</div>
                </div>
                <p>바람의 검심 -메이지 검객 낭만기- 교토 동란</p>
                <p class="genre"><span>판타지</span><span>15세 관람</span></p>
            </div>
            <div class="div_li">
                <div class="list_img_bg">
                    <img src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240926170927.png"
                        alt="흔해빠진 직업으로 세계최강 3기">
                    <div class="overlay">상세 보기</div>
                </div>
                <p>흔해빠진 직업으로 세계최강 3기</p>
                <p class="genre"><span>판타지</span><span>19세 관람</span></p>
            </div>
            <div class="div_li">
                <div class="list_img_bg">
                    <img src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240927174027.jpg"
                        alt="빅 오더 OVA">
                    <div class="overlay">상세 보기</div>
                </div>
                <p>빅 오더 OVA</p>
                <p class="genre"><span>코미디</span><span>15세 관람</span></p>
            </div>
            <div class="div_li">
                <div class="list_img_bg">
                    <img src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240926113151.png"
                        alt="러브 라이브! 슈퍼스타!! 3기">
                    <div class="overlay">상세 보기</div>
                </div>
                <p>러브 라이브! 슈퍼스타!! 3기</p>
                <p class="genre"><span>드라마</span><span>15세 관람</span></p>
            </div>
            <div class="div_li">
                <div class="list_img_bg">
                    <img src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240925112028.png"
                        alt="아내, 초등학생이 되다.">
                    <div class="overlay">상세 보기</div>
                </div>
                <p>아내, 초등학생이 되다.</p>
                <p class="genre"><span>드라마</span><span>15세 관람</span></p>
            </div>
            <div class="div_li">
                <div class="list_img_bg">
                    <img src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240925103336.png"
                        alt="내세에는 남남이 좋겠어">
                    <div class="overlay">상세 보기</div>
                </div>
                <p>내세에는 남남이 좋겠어</p>
                <p class="genre"><span>판타지</span><span>19세 관람</span></p>
            </div>
        </div>
    </div>
</div>

<!--==========================MODAL=======================================-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <div class="image-container">
                    <img id="modalImage" src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240923164753.jpeg"
                        alt="" class="img-fluid">

                    <div class="overlay-text">
                        <h1 id="modalGenre">바람의 검심</h1>
                    </div>
                    <div class="description-text">
                        <p id="modalDescription">《바람의 검심 -메이지 검객 낭만기-》의 교토 동란은 주요 인물들이 교토에서 벌어지는 갈등과 싸움을 중심으로 전개됩니다. 주인공인 켄신 히무라는
                            과거의 죄를 씻기 위해 무사의 길을 걷고 있으며, 친구들과 함께 교토에서 평화를 지키기 위해 노력합니다.</p>
                    </div>
                    <div class="star">

                </div>
                    <div class="overlay-text">
                        <h1 id="modalGenre">바람의 검심</h1>

                        <p>내 평가</p>
                        <span class="star-icon" data-value="1">☆</span>
                        <span class="star-icon" data-value="2">☆</span>
                        <span class="star-icon" data-value="3">☆</span>
                        <span class="star-icon" data-value="4">☆</span>
                        <span class="star-icon" data-value="5">☆</span>
                    </div>

                    <div class="tp">
                        <p>감독 : 김 정</p>
                    </div>
                    <div class="bp">
                        <p>출연 : 김 정, 김정, 김이저엉, 김저엉,김정일껄?, ㅇ하기싫다,
                            어렵디, 김정, 집가고싶다, 김정, 김정, 김정
                        </p>
                    </div>
                    <div class="ta">
                        <p>태그 : 판타지아, 아르헨티나, 러시아, 우루과이, 지구</p>
                    </div>
                    <div class="new-image-container">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지1" class="img-fluid">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지2" class="img-fluid">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지3" class="img-fluid">
                    </div>
                </div>


                    <div class="description-text">
                        <p>감독 : 김 정</p>
                        <p>출연 : 김 정, 김정, 김이저엉, 김저엉,김정일껄?, ㅇ하기싫다,
                        어렵디, 김정, 집가고싶다, 김정, 김정, 김정</p>
                        <p>태그 : 판타지아, 아르헨티나, 러시아, 우루과이, 지구</p>
                        <p id="modalDescription">《바람의 검심 -메이지 검객 낭만기-》의 교토 동란은 주요 인물들이 교토에서 벌어지는 갈등과 싸움을 중심으로 전개됩니다. 주인공인 켄신 히무라는
                            과거의 죄를 씻기 위해 무사의 길을 걷고 있으며, 친구들과 함께 교토에서 평화를 지키기 위해 노력합니다.</p>
                    </div>



                    <div class="new-image-container">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지2" class="img-fluid">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지3" class="img-fluid">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지3" class="img-fluid">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지3" class="img-fluid">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지3" class="img-fluid">
                        <img src="../../../img/main_img/img1.png" alt="새로운 이미지3" class="img-fluid">
                    </div>


                                    <div class="side_img">
                                        <img src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240923164753.jpeg" alt=""
                                            class="side_ma">
                                    </div>

            </div>
        </div>
    </div>
</div>
</bady>
