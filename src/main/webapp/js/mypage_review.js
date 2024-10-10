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

function review_write_exit(){
    $(".review_modal_body").remove();
}

var reviewbeforeData;

//리뷰 작성 버튼 누르면 나오는 모달
function review_writeModal(index){
    tag = ``;
    const reviewbefore = reviewbeforeData[index];
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
                            src=""
                          />
                          <div class="review_modal_protitle">
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
                            <p>이미지는 최대 2개까지 첨부가 가능합니다.</p>
                            <div id="fileimg_preview" class="fileimg_preview"></div>
                            <label for="fileInput" class="review_modal_file_btn">이미지 업로드</label>
                            <input
                              type="file"
                              id="fileInput"
                              style="display:none;"
                            />
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

    $(".review_modal_proinfo img").attr("src","/" + reviewbefore.detail_img);
    console.log(reviewbefore.detail_img);
    $(".review_modal_protitle").html(`
            <p>${reviewbefore.title}</p>
            <p>${reviewbefore.price}원 / 수량 ${reviewbefore.amount}개</p>
    `);
};

$(function(){
    const token = localStorage.getItem("token");
    console.log(token);

    // 리뷰 작성전, 작성완료 데이터 리스트 불러오기
    $.ajax({
        url: '/user/reviewList',
        type: 'POST',
        contentType: 'application/json',
        headers: {
            "Authorization": `Bearer ${token}`  // JWT 토큰을 Authorization 헤더에 포함
        },
        success: function(response) {
            console.log(response.reviewBefore);

            reviewbeforeData = response.reviewBefore;

            // 리뷰 작성 전 for문
            response.reviewBefore.forEach(function(reviewbefore, index){
                $("#review_list_ul").append(`
                    <li class="review_list_li">
                        <input type="hidden" name="order_idx" id="order_idx" value="${reviewbefore.orderList_idx}">
                       <div class="review_list_li_one">
                         <div class="review_list_li_one_detail">
                           <div class="review_product">
                             <a href="">
                               <img src="/${reviewbefore.detail_img}" class="review_product_img" />
                             </a>
                             <div class="review_product_inform">
                               <a href="">
                                 <strong>${reviewbefore.title}</strong>
                                 <p>${reviewbefore.price}원 / 수량 ${reviewbefore.amount}개</p>
                               </a>
                             </div>
                           </div>
                           <span class="order_state_date"><span>구매확정</span></span>
                           <div><button class="review_write_btn" type="button" onclick="review_writeModal(${index})">리뷰쓰기</button></div>
                         </div>
                       </div>
                     </li>
                `)
            })



        },
        error: function(xhr, status, error) {
            console.log('오류 발생: ' + error);  // 에러 메시지 자체 출력
        }
    });



    // reviewTab 함수에 tabId 전달
    reviewTab("tab1");  // tab1을 기본값으로 설정하여 호출

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

    $(document).on('change', '#fileInput', function(event) {
        var files = event.target.files;
        var preview = $('#fileimg_preview');
        var fileCount = preview.find('img').length; // 현재 추가된 이미지 개수 확인
        /*preview.empty(); // 미리보기 초기화*/

        $.each(files, function(i, file) {
            if (file.type.startsWith('image/') && fileCount < 2) {  // 이미지 파일만 처리하고, 2개까지만 추가
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img = $('<img>').attr('src', e.target.result).css({
                        width: '76px',
                        height: '76px',
                        marginRight:'10px'
                    });
                    preview.append(img);
                    fileCount++;

                    // 파일이 2개 추가되면 파일 선택 버튼 숨김
                    if (fileCount >= 2) {
                        $('#fileInput').hide();
                        $('.review_modal_file_btn').hide();
                    }
                };
                reader.readAsDataURL(file);
            }
        });
        // 파일 선택 초기화하여 추가 선택 가능하게 설정
        $(this).val('');
    });
});

