var main_slide = new Swiper(".main_slide", {
    loop: true,
    speed: 1000,
    effect: "fade",
    pagination: {
      el: ".pager",
      clickable: true,
      bulletActiveClass: "on",
      renderBullet: function (i, className) {
        return `
                <button class="${className}">
                    <svg class="progress" width="16" height="16">
                        <circle class="circle-origin" r="6" cx="8" cy="8"></circle>
                    </svg>
                </button>
                `;
      },
    },
    autoplay: {
      delay: 3500,
      disableOnInteraction: false,
    },
});

feather.replace();
  var imgSwiper = new Swiper(".gall_slide .gall_list", {
    speed: 700,
    slidesPerView: "1.5",
    spaceBetween: 10,
    autoHeight: true,
    loop: true,
    centeredSlides: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    pagination: {
      el: ".swiper-pagination",
      type: "progressbar",
    },
    breakpoints: {
      1025: {
        slidesPerView: "4",
        spaceBetween: 40,
        centeredSlides: false,
      },
      769: {
        slidesPerView: "3",
        spaceBetween: 20,
        centeredSlides: true,
      },
      481: {
        slidesPerView: "2",
        spaceBetween: 15,
        centeredSlides: false,
      },
    },
});

AOS.init();