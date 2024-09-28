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
            </head>

            <body>
                <input id="check-btn" type="checkbox" />
                <label for="check-btn">
                    <img class="customImage"  src="../../../img/main_img/2.png"/>
                </label>

                    <ul class="menubars">
                        <li>
                            <input class="menu-item" id="genre-check" type="checkbox" />
                            <label for="genre-check">장르</label>
                            <ul class="submenu">
                                <li>
                                    <input type="checkbox" id="genre1" />
                                    <label for="genre1">판타지</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre2" />
                                    <label for="genre2">SF</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre3" />
                                    <label for="genre3">코미디</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre4" />
                                    <label for="genre4">스포츠</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre5" />
                                    <label for="genre5">미스테리</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input class="menu-item" id="tag-check" type="checkbox" />
                            <label for="tag-check">태그</label>
                            <ul class="submenu">
                                <li>
                                    <input type="checkbox" id="genre11" />
                                    <label for="genre11">이세계</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre21" />
                                    <label for="genre21">극장판</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre31" />
                                    <label for="genre31">순정/로맨스</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre41" />
                                    <label for="genre41">아이돌</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre51" />
                                    <label for="genre51">먼치킨</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre61" />
                                    <label for="genre61">이능력</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input class="menu-item" id="rating-check" type="checkbox" />
                            <label for="rating-check">관람가</label>
                            <ul class="submenu">
                                <li>
                                    <input type="checkbox" id="genre12" />
                                    <label for="genre12">전체 관람가</label>
                                </li>
                                <li><input type="checkbox" id="genre22" />
                                    <label for="genre22">12세 관람가</label>

                                </li>
                                <li>
                                    <input type="checkbox" id="genre32" />
                                    <label for="genre32">15세 관람가</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="genre42" />
                                    <label for="genre42">19세 관람가</label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!-- ======================================================================= -->

                </body>
                </body>
                <div class="container">


                    <div class="one_line" style="transition: 0.7s; padding-left: 0px;">
                        <div class="div_ul" style="transition: 0.7s; padding-left: 0px;">
                            <div style="display: inline-block;">
                                <div>
                                    <div class="div_li"
                                        style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                        <div class="list_img_bg" style="cursor: pointer;"><img
                                                src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240905151009.png"></div>
                                        <p
                                            style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                            채운국
                                            이야기 2기</p>
                                        <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                    </div>
                                </div>
                            </div>
                            <div style="display: inline-block;">
                                <div>
                                    <div class="div_li"
                                        style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                        <div class="list_img_bg" style="cursor: pointer;"><img
                                                src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240823163331.png"></div>
                                        <p
                                            style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                            장송의
                                            프리렌(한국어더빙)</p>
                                        <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                    </div>
                                </div>
                            </div>
                            <div style="display: inline-block;">
                                <div>
                                    <div class="div_li"
                                        style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                        <div class="list_img_bg" style="cursor: pointer;"><img
                                                src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240731170432.png"></div>
                                        <p
                                            style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                            [극장판] 시티헌터 엔젤 더스트
                                        </p>
                                        <p class="genre"><span>SF/판타지</span><span>19세 관람</span></p>
                                    </div>
                                </div>
                            </div>
                            <div style="display: inline-block;">
                                <div>
                                    <div class="div_li"
                                        style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                        <div class="list_img_bg" style="cursor: pointer;"><img
                                                src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240912180655.png"></div>
                                        <p
                                            style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                            마왕의
                                            딸로 태어났습니다</p>
                                        <p class="genre"><span>코미디</span><span>15세 관람</span></p>
                                    </div>
                                </div>
                            </div>
                            <div style="display: inline-block;">
                                <div>
                                    <div class="div_li"
                                        style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                        <div class="list_img_bg" style="cursor: pointer;"><img
                                                src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240724113021.png"></div>
                                        <p
                                            style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                            키즈모노가타리 -코요미 뱀프-
                                        </p>
                                        <p class="genre"><span>판타지</span><span>19세 관람</span></p>
                                    </div>
                                </div>
                            </div>
                            <div style="display: inline-block;">
                                <div>
                                    <div class="div_li"
                                        style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                        <div class="list_img_bg" style="cursor: pointer;"><img
                                                src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240806172406.jpg"></div>
                                        <p
                                            style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                            신의
                                            탑</p>
                                        <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ======================================================================================================================================= -->
                    <div class="one_line" style="transition: 0.7s; padding-left: 0px;"></div>
                    <div class="div_ul" style="transition: 0.7s; padding-left: 0px;">
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240905151009.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">채운국
                                        이야기
                                        2기</p>
                                    <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240823163331.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">장송의
                                        프리렌(한국어더빙)</p>
                                    <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240731170432.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                        [극장판]
                                        시티헌터 엔젤 더스트
                                    </p>
                                    <p class="genre"><span>SF/판타지</span><span>19세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240912180655.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">마왕의
                                        딸로
                                        태어났습니다</p>
                                    <p class="genre"><span>코미디</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240724113021.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                        키즈모노가타리
                                        -코요미 뱀프-
                                    </p>
                                    <p class="genre"><span>판타지</span><span>19세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240806172406.jpg"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">신의
                                        탑
                                    </p>
                                    <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ======================================================================================================================================= -->
                    <div class="one_line" style="transition: 0.7s; padding-left: 0px;"></div>
                    <div class="div_ul" style="transition: 0.7s; padding-left: 0px;">
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240905151009.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">채운국
                                        이야기 2기
                                    </p>
                                    <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240823163331.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">장송의
                                        프리렌(한국어더빙)</p>
                                    <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240731170432.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                        [극장판] 시티헌터
                                        엔젤 더스트
                                    </p>
                                    <p class="genre"><span>SF/판타지</span><span>19세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240912180655.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">마왕의
                                        딸로
                                        태어났습니다</p>
                                    <p class="genre"><span>코미디</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240724113021.png"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">
                                        키즈모노가타리
                                        -코요미 뱀프-
                                    </p>
                                    <p class="genre"><span>판타지</span><span>19세 관람</span></p>
                                </div>
                            </div>
                        </div>
                        <div style="display: inline-block;">
                            <div>
                                <div class="div_li"
                                    style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                    <div class="list_img_bg" style="cursor: pointer;"><img
                                            src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240806172406.jpg"></div>
                                    <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">신의
                                        탑</p>
                                    <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ======================================================================================================================================= -->
                <div class="one_line" style="transition: 0.7s; padding-left: 0px;"></div>
                <div class="div_ul" style="transition: 0.7s; padding-left: 0px;">
                    <div style="display: inline-block;">
                        <div>
                            <div class="div_li"
                                style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                <div class="list_img_bg" style="cursor: pointer;"><img
                                        src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240905151009.png"></div>
                                <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">채운국 이야기
                                    2기
                                </p>
                                <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                            </div>
                        </div>
                    </div>
                    <div style="display: inline-block;">
                        <div>
                            <div class="div_li"
                                style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                <div class="list_img_bg" style="cursor: pointer;"><img
                                        src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240823163331.png"></div>
                                <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">장송의
                                    프리렌(한국어더빙)</p>
                                <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                            </div>
                        </div>
                    </div>
                    <div style="display: inline-block;">
                        <div>
                            <div class="div_li"
                                style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                <div class="list_img_bg" style="cursor: pointer;"><img
                                        src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240731170432.png"></div>
                                <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">[극장판]
                                    시티헌터
                                    엔젤 더스트
                                </p>
                                <p class="genre"><span>SF/판타지</span><span>19세 관람</span></p>
                            </div>
                        </div>
                    </div>
                    <div style="display: inline-block;">
                        <div>
                            <div class="div_li"
                                style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                <div class="list_img_bg" style="cursor: pointer;"><img
                                        src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240912180655.png"></div>
                                <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">마왕의 딸로
                                    태어났습니다</p>
                                <p class="genre"><span>코미디</span><span>15세 관람</span></p>
                            </div>
                        </div>
                    </div>
                    <div style="display: inline-block;">
                        <div>
                            <div class="div_li"
                                style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                <div class="list_img_bg" style="cursor: pointer;"><img
                                        src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240724113021.png"></div>
                                <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">키즈모노가타리
                                    -코요미 뱀프-
                                </p>
                                <p class="genre"><span>판타지</span><span>19세 관람</span></p>
                            </div>
                        </div>
                    </div>
                    <div style="display: inline-block;">
                        <div>
                            <div class="div_li"
                                style="transition: 0.4s; text-align: center; transform-origin: center center; display: inline-block; width: 274.267px;">
                                <div class="list_img_bg" style="cursor: pointer;"><img
                                        src="https://ah9szoaj9w.ecn.cdn.ofs.kr/images/tvee-admin/content/CS_20240806172406.jpg"></div>
                                <p style="padding-bottom: 15px; white-space: normal; overflow-wrap: break-word;">신의 탑
                                </p>
                                <p class="genre"><span>판타지</span><span>15세 관람</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </div>
            </body>

            </html>

