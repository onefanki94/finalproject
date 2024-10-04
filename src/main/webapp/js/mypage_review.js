function reviewTab(tabId) {
    // 모든 탭을 숨김
    document.getElementById("tab1").classList.remove("on");
    document.getElementById("tab1").classList.add("off");
    document.getElementById("tab2").classList.remove("on");
    document.getElementById("tab2").classList.add("off");

    // 클릭한 탭만 보여줌
    document.getElementById(tabId).classList.remove("off");
    document.getElementById(tabId).classList.add("on");
}

var tag = ``;

function review_write(){
    tag += `<div class="review_modal_body">
              <div class="review_modal_div">
                <button class="exit_btn" type="button" onclick="review_write_exit()">
                  <i class="fa-solid fa-xmark"></i>
                </button>
                <div class="modal_div_size">
                  <div class="review_write_modal">
                    <header class="review_modal_header">
                      <h3>리뷰 작성</h3>
                    </header>
                    <div class="modal_write_ele">
                      <div class="modal_write_ele_top">
                        <div class="review_modal_proinfo">
                          <img
                            src="https://img.29cm.co.kr/item/202404/11ef00748710b484bb6a7fea540fd7e9.jpg?width=100"
                          />
                          <div class="review_modal_protitle">
                            <p>overdue flair</p>
                            <p>SWEET SOUNDS T-SHIRT_BABY PINK</p>
                          </div>
                        </div>

                        <div class="review_modal_grade">
                          <span>상품은 어떠셨나요? </span>
                          <div class="review_modal_grade_check">
                            <span value="1"><i class="fa-regular fa-star"></i></span>
                            <span value="2"><i class="fa-regular fa-star"></i></span>
                            <span value="3"><i class="fa-regular fa-star"></i></span>
                            <span value="4"><i class="fa-regular fa-star"></i></span>
                            <span value="5"><i class="fa-regular fa-star"></i></span>
                          </div>
                        </div>
                        <div class="review_modal_file">
                          <div>
                            <input
                              type="file"
                              multiple=""
                              class="review_imgfile_input"
                            /><button
                              class="review_modal_file_btn"
                              type="button"
                            ></button>
                          </div>
                        </div>
                        <div class="review_modal_txt_div">
                          <div class="review_modal_txt">
                            <textarea
                              placeholder="최소 15자 이상 작성해주세요."
                            ></textarea>
                          </div>
                        </div>
                        <ul class="review_modal_notice">
                          <li>
                            상품과 무관하거나 비속어가 포함된 리뷰, 그 외 리뷰
                            운영정책에 위배되는 리뷰는 고지 없이 블라인드 후 경고
                            조치됩니다.
                          </li>
                          <li>경고 누적 시 리뷰 작성이 제한될 수 있습니다.</li>
                        </ul>
                      </div>
                      <div class="modal_write_ele_bottom">
                        <button class="review_modal_btn" type="button">등록하기</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>`;
    $("body").append(tag);
}

function review_write_exit(){
    $(".review_modal_body").remove();
}

$(function(){
    // reviewTab 함수에 tabId 전달
    reviewTab("tab1");  // tab1을 기본값으로 설정하여 호출

    // 리뷰 작성 모달 띄우기
    review_write();

    // 리뷰 작성 모달 닫기
    review_write_exit();

    $(document).on('click', '.review_modal_grade_check span', function(){

        $(this).children('i').addClass('fa-solid').removeClass('fa-regular');
        $(this).prevAll('span').children('i').addClass('fa-solid').removeClass('fa-regular');

        // 현재 클릭한 별 이후 모든 별에 fa-regular 클래스를 추가
        $(this).nextAll('span').children('i').removeClass('fa-solid').addClass('fa-regular');

        // fa-solid 클래스를 가지는 i 요소의 개수 카운트
        const gradeCount = $(".review_modal_grade_check i.fa-solid").length;
        console.log("fa-solid 클래스를 가진 i 태그의 개수: ", gradeCount);

        /*$("#grade").val(gradeCount);*/
    });
});

