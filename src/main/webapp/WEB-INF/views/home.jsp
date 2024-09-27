<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../inc/main_header.jspf" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link href="/css/home.css" rel="stylesheet" type="text/css"></link>

<div id="mainVisual">
  <div class="swiper-container main_slide">
    <div class="main_txt">
      <span></span>
      <p></p>
      <div data-aos="fade-blur" data-aos-delay="200" data-aos-duration="1500" class="pager"></div>
    </div>
    <ul class="swiper-wrapper">
      <li class="swiper-slide bg01"></li>
      <li class="swiper-slide bg02"></li>
      <li class="swiper-slide bg03"></li>
    </ul>
  </div>

  <div class="scroll">
    <span data-aos="fade-blur" data-aos-delay="200" data-aos-duration="1500" class="aos-init aos-animate">Scroll down</span>
    <div class="bar aos-init aos-animate" data-aos="fade-blur" data-aos-delay="200" data-aos-duration="1500"></div>
  </div>
</div>

<div class="mainContents">
    <div class="mainContent1">
      <div class="inc01">
        <div class="tit aos-init aos-animate" data-aos="fade-left">
          <p data-aos="fade-blur" data-aos-delay="200" class="aos-init aos-animate"><span>Recommend </span> List</p>
          <div class="pl" style="color: #fff">
            모두가 애니메이션을 즐기는 세상, <br />
            sing2727님이 선호할만한 애니메이션을 만나보세요!
          </div>
          <a class="more_btn" href="#">MORE VIEW</a>
        </div>
        <div class="recommend_ani">
          <ul class="grid_imgs">
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost1.png" alt="" />
              </a>
            </li>
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost2.png" alt="" />
              </a>
            </li>
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost3.png" alt="" />
              </a>
            </li>
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost4.png" alt="" />
              </a>
            </li>
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost5.png" alt="" />
              </a>
            </li>
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost6.png" alt="" />
              </a>
            </li>
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost7.jpg" alt="" />
              </a>
            </li>
            <li data-aos="zoom-in" data-aos-offset="300">
              <a href="">
                <div class="mask"></div>
                <div class="txt">
                  <p>정적인 공간, 나만의 아늑한 안식처</p>
                  <span>View more<i class="on fa fa-long-arrow-right"></i><i class="off fa fa-long-arrow-right"></i></span>
                </div>
                <img class="thum" src="/img/main_img/anipost8.jpg" alt="" />
              </a>
            </li>
          </ul>
        </div>
      </div>
  </div>
  <div class="mainContent2">
    <div class="inc02">
      <div class="inner">
        <div class="tit">
          <div class="control">
            <div class="swiper-button-prev prev"><i data-feather="chevron-left"></i></div>
            <p>함께 공유해요</p>
            <div class="swiper-button-next next"><i data-feather="chevron-right"></i></div>
          </div>
          샘플장애인복지관의 특별하고 소중한 이야기를 소개합니다.
        </div>
        <div class="gall_slide">
          <div class="swiper-container gall_list">
            <ul class="swiper-wrapper">
              <li class="swiper-slide">
                <a href="">
                  <div class="img_wrap"><div class="thum_img" style="background-image: url(https://co1137-res.shiningcorp.com/data/editor/2407/thumb-736ccff3f71ced47e0106f2103e2c1a2_1721960900_9954_690x.jpg)"></div></div>
                </a>
              </li>
              <li class="swiper-slide">
                <a href="">
                  <div class="img_wrap"><div class="thum_img" style="background-image: url(https://co1137-res.shiningcorp.com/data/editor/2407/thumb-736ccff3f71ced47e0106f2103e2c1a2_1721960900_9954_690x.jpg)"></div></div>
                </a>
              </li>
              <li class="swiper-slide">
                <a href="">
                  <div class="img_wrap"><div class="thum_img" style="background-image: url(https://co1137-res.shiningcorp.com/data/editor/2407/thumb-736ccff3f71ced47e0106f2103e2c1a2_1721960900_9954_690x.jpg)"></div></div>
                </a>
              </li>
              <li class="swiper-slide">
                <a href="">
                  <div class="img_wrap"><div class="thum_img" style="background-image: url(https://co1137-res.shiningcorp.com/data/editor/2407/thumb-736ccff3f71ced47e0106f2103e2c1a2_1721960900_9954_690x.jpg)"></div></div>
                </a>
              </li>
              <li class="swiper-slide">
                <a href="">
                  <div class="img_wrap"><div class="thum_img" style="background-image: url(https://co1137-res.shiningcorp.com/data/editor/2407/thumb-736ccff3f71ced47e0106f2103e2c1a2_1721960900_9954_690x.jpg)"></div></div>
                </a>
              </li>
            </ul>
          </div>
          <div class="pager_wrap">
            <div class="swiper-pagination"></div>
            <div class="more_box">
              view more <a href="" class="more"><i data-feather="plus"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/js/home.js"></script>