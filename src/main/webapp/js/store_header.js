$(document).ready(function () {
        // li 요소를 클릭할 때 이벤트 발생
        $(".snav_inner nav ul li").click(function () {
          // 모든 li에서 check 클래스를 제거
          $(".snav_inner nav ul li").removeClass("check");

          // 클릭된 li에 check 클래스를 추가
          $(this).addClass("check");
        });

        // a 요소를 클릭할 때 이벤트 발생
        $(".snav_inner nav ul li a").click(function () {
          // 모든 a에서 active 클래스를 제거
          $(".snav_inner nav ul li a").removeClass("active");

          // 클릭된 a에 active 클래스를 추가
          $(this).addClass("active");
        });

        $(window).on("scroll", function () {
          var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치
          var headerHeight = $("#header").outerHeight(); // 헤더의 높이

          if (scrollTop > 100) {
            // 스크롤이 100px 이상일 때
            $("#header").addClass("fixed");
            $("body").css("padding-top", headerHeight + "px"); // 헤더의 높이만큼 패딩 추가
          } else {
            $("#header").removeClass("fixed");
            $("body").css("padding-top", "0"); // 패딩 제거
          }
        });
      });