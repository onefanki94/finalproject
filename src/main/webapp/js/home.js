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

AOS.init();