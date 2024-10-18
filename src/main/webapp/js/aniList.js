
/*@@@@@@@@@@@@@장르@@@@@@@@@@*/
$(document).ready(function () {
    // 애니메이션 카드 클릭 시 첫 번째 모달 열기
    $('.list_img_bg').on('click', function (e) {
        e.preventDefault(); // 기본 동작 방지 (필요 시)
        const title = $(this).data('title'); // 클릭한 카드의 제목 가져오기
        const imageSrc = $(this).find('img').attr('src'); // 클릭한 카드의 이미지 경로 가져오기
        const genre = $(this).find('.genre span').first().text(); // 장르 텍스트 가져오기
        const age = $(this).find('.genre span').last().text(); // 나이 관람 텍스트 가져오기
        const director = $(this).data('director'); // 감독 정보 가져오기
        const idx = $(this).data('idx');

        // AJAX 요청으로 줄거리 및 비슷한 애니메이션 가져오기
        $.ajax({
            url: '/aniDetail', // 줄거리를 가져올 API URL
            method: 'GET',
            data: { title: title }, // 제목을 요청 파라미터로 전달
            success: function (response) {
    console.log("AJAX 응답:", response); // 응답 데이터 확인

    const summary = response.outline; // 줄거리
    const registrationDate = response.registrationDate; // 등록일

    // 줄거리 길이 조절
    const shortSummary = summary.length > 1000 ? summary.substring(0, 100) + '...' : summary;

    // 모달 내용 업데이트
    $('.animodal_item_infoDiv h1').text(title);
    $('.animodal_item_imgBack img').attr('src', imageSrc);
    $('.animodal_item_imgDiv img').attr('src', imageSrc);
    $('.animodal_item_infoDiv .genre').text(` 장르: ${response.anitype}`);
    $('.animodal_item_infoDiv .age').text(` 등급: ${response.agetype}관람  `);
    $('.animodal_item_infoDiv .director').text(` 감독: ${director}`);
    $('.animodal_item_infoDiv .ani_outline .summary').text(shortSummary);
    $('.animodal_item_infoDiv .ani_outline .ouline_more').data('full-summary', summary);

    // 비슷한 애니메이션 목록 업데이트
    const similarAnis = response.randomSimilarAnis || []; // 비슷한 애니메이션 목록 가져오기

    const randomSimilarAnis = similarAnis.sort(() => 0.5 - Math.random()).slice(0, 5);

const similarAniList = similarAnis.map(ani => `
    <li>
        <img src="${pageContext.request.contextPath}/img/ani_img/${ani.post_img}" alt="${ani.title}">
        <p>${ani.title}</p>
    </li>
`).join('');
$('.bottom_ani_content ul').html(similarAniList); // 비슷한 애니메이션 목록 추가

 // 제작 정보 섹션 업데이트 (감독, 등록일)
                $('.director-name').text(director); // 감독 정보
                $('.registration-date').text(response.regDT); // 등록일 정보

// 모달 열기
$('.animodal_body').fadeIn();
},
            error: function (jqXHR, textStatus, errorThrown) {
                console.error('Error status:', textStatus);
                console.error('Error thrown:', errorThrown);
                alert('줄거리를 가져오는 데 실패했습니다. 오류: ' + textStatus);
            }
        });
    });



    // 첫 번째 모달 닫기 (X 버튼 클릭 시)
    $('.animodal_body').on('click', '.fa-x', function (e) {
        e.stopPropagation(); // 이벤트 전파 중지
        $('.animodal_body').fadeOut(); // 첫 번째 모달을 닫기 위해 fadeOut 효과를 사용
    });

    // 첫 번째 모달 닫기 (배경 클릭 시)
    $('.animodal_body').on('click', '.animodal_background', function () {
        $('.animodal_body').fadeOut(); // 첫 번째 모달을 닫기 위해 fadeOut 효과를 사용
    });

    // "더 보기" 클릭 시 두 번째 모달 열기 및 전체 줄거리 표시
    $('.animodal_body').on('click', '.ouline_more', function (e) {
        e.stopPropagation(); // 이벤트 전파 중지

        const fullSummary = $(this).data('full-summary'); // data 속성에서 전체 줄거리 가져오기

        if (!fullSummary) {
            console.error('Full summary is not available.');
            return;
        }

        console.log("전체 줄거리:", fullSummary); // 전체 줄거리 확인

        // 두 번째 모달의 줄거리 업데이트
        $('.aniInfo_modal_body .ani-outline').text(fullSummary); // 두 번째 모달의 줄거리 업데이트

        // 두 번째 모달 열기
        $('.aniInfo_modal_body').fadeIn();
    });

    // 두 번째 모달 닫기 (X 버튼 클릭 시)
    $('.aniInfo_modal_body').on('click', '.fa-x', function (e) {
        e.stopPropagation(); // 이벤트 전파 중지
        $('.aniInfo_modal_body').fadeOut(); // 두 번째 모달만 닫기
    });

    // 두 번째 모달 닫기 (배경 클릭 시)
    $('.aniInfo_modal_body').on('click', function (e) {
        if ($(e.target).is('.aniInfo_modal_body > div:first-child')) {
            $('.aniInfo_modal_body').fadeOut(); // 두 번째 모달만 닫기
        }
    });
});

/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
$(document).ready(function() {
    $('.div_li').each(function() {
        const aniType = $(this).data('anitype'); // 장르 가져오기
        const ageType = $(this).data('agetype'); // 나이 관람 가져오기

        // 콘솔 로그 추가
        console.log('장르:', aniType);
        console.log('나이 관람:', ageType);

        // HTML 업데이트
        $(this).find('.genre').html(`
            <span>${aniType}</span> <!-- 장르 -->
            <span>${ageType} 관람</span> <!-- 나이 관람 -->
        `);
    });
});
/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@검색@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
function searchTable() {
    var input, filter, aniList, divLi, title, i, txtValue;
    input = document.getElementById("searchInput"); // 검색 입력 필드
    filter = input.value.toLowerCase(); // 입력된 검색어
    aniList = document.querySelectorAll(".ani_viewList .div_li"); // 애니메이션 목록

    for (i = 0; i < aniList.length; i++) {
        divLi = aniList[i];
        title = divLi.querySelector("p").textContent || divLi.querySelector("p").innerText; // 제목 텍스트 가져오기
        if (title.toLowerCase().indexOf(filter) > -1) {
            divLi.style.display = ""; // 검색어와 일치하면 보여줌
        } else {
            divLi.style.display = "none"; // 검색어와 일치하지 않으면 숨김
        }
    }
}
 $(document).ready(function () {
            $('.filter').on('change', function () {
                var selectedGenres = $('.filter:checked').map(function () {
                    return $(this).val();
                }).get();

                $('.div_li').show(); // 모든 애니메이션 항목 보여주기

                if (selectedGenres.length > 0) {
                    $('.div_li').filter(function () {
                        return !selectedGenres.includes($(this).data('anitype')); // data-anitype을 사용하여 필터링
                    }).hide();
                }
            });
        });
        /*@@@@@@@@@@@@@@@@@@@@@@@@@왼쪽 필터링@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
$(document).ready(function () {
    $('.filter').change(function () {
        const selectedGenres = [];
        const selectedTags = [];
        const selectedAges = [];

        // 장르 필터링
        $('input[type="checkbox"][value]').each(function () {
            if ($(this).is(':checked')) {
                selectedGenres.push($(this).val());
            }
        });

        // 태그 필터링
        $('input[type="checkbox"][data-tag]').each(function () {
            if ($(this).is(':checked')) {
                selectedTags.push($(this).data('tag'));
            }
        });

        // 연령 필터링
        $('input[type="checkbox"][data-age]').each(function () {
            if ($(this).is(':checked')) {
                selectedAges.push($(this).data('age'));
            }
        });

        $('.div_li').each(function () {
            const genreMatch = selectedGenres.length ? selectedGenres.includes($(this).find('.genre span:first-child').text().trim()) : true;
            const tagMatch = selectedTags.length ? selectedTags.some(tag => $(this).data('tags') && $(this).data('tags').includes(tag)) : true;

            // 수정된 ageMatch
            const ageType = $(this).data('agetype'); // 애니메이션 항목의 연령 데이터 가져오기
            const ageMatch = selectedAges.length ? selectedAges.includes(ageType) : true;

            if (genreMatch && tagMatch && ageMatch) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});
/*@@@@@@@@@@@@@@@@@@@@@오른쪽 필터@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
function sortAniList(sortCriteria) {
    $.ajax({
        url: 'http://localhost:9911/aniList/sort', // 서버의 정렬 API 엔드포인트
        method: 'GET',
        data: { sort: sortCriteria }, // 선택한 정렬 기준을 데이터로 전송
        success: function(response) {
            renderAniList(response); // 서버에서 받은 데이터를 사용하여 목록 렌더링
        },
        error: function(xhr, status, error) {
            console.error("Error fetching sorted list:", error); // 오류 처리
        }
    });
}

function renderAniList(aniList) {
    const listContainer = $('.ani_viewList'); // 애니메이션 목록을 렌더링할 컨테이너
    listContainer.empty(); // 기존 목록을 비움

    aniList.forEach(ani => {
        const listItem = `<div class="div_li" data-anitype="${ani.anitype}" data-agetype="${ani.agetype}">
            <div class="list_img_bg" data-title="${ani.title}" data-director="${ani.director}" data-summary="${ani.summary}">
                <img src="${ani.post_img}" alt="${ani.title}">
                <div class="genre"><span>${ani.anitype}</span></div>
                <div class="age"><span>${ani.agetype} 관람</span></div>
            </div>
            <p>${ani.title}</p>
        </div>`;
        listContainer.append(listItem); // 새로운 목록 아이템 추가
    });
}
/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@별점@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
let currentRating = 0;

// 별점 설정 함수
function setRating(rating) {
    currentRating = rating;
    const stars = document.querySelectorAll("#stars i");
    stars.forEach((star, index) => {
        if (index < rating) {
            star.classList.add("fas"); // 채워진 별 (fa-solid)
            star.classList.remove("fa-regular");
        } else {
            star.classList.remove("fas");
            star.classList.add("fa-regular"); // 빈 별 (fa-regular)
        }
    });
}

// 선택된 별점 가져오기
function getSelectedGrade() {
    return currentRating;
}

// 서버로 데이터 전송 함수
function submitRating() {
    const modal = document.querySelector('.animodal_usergrade');
    const aniIdx = modal.getAttribute('idx'); // jQuery로 data-idx 값 가져오기
    console.log("모달에서 가져온 인덱스:", aniIdx);
    const grade = getSelectedGrade();
    const token = localStorage.getItem("token");

    // 유효성 검사
    if (!aniIdx) {
        alert("애니메이션 인덱스가 제공되지 않았습니다.");
        return;
    }
    if (grade === 0) {
        alert("별점을 선택해 주세요.");
        return;
    }
    if (!token) {
        alert("로그인이 필요합니다. 로그인 후 다시 시도해 주세요.");
        window.location.href = '/user/login';
        return;
    }

    const gradeData = {
        ani_idx: aniIdx,
        grade: grade
    };

    console.log("전송할 데이터:", gradeData);

    $.ajax({
        url: '/addGrade',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        headers: {
            'Authorization': 'Bearer ' + token
        },
        data: JSON.stringify(gradeData),
        success: function (response) {
            if (response.message) {
                alert(response.message);
            } else {
                alert("별점이 성공적으로 등록되었습니다.");
            }
        },
        error: function (xhr) {
            let errorMessage = '별점 등록에 실패했습니다.';
            if (xhr.responseJSON && xhr.responseJSON.error) {
                errorMessage = xhr.responseJSON.error;
            } else if (xhr.status === 401) {
                errorMessage = '인증 실패. 로그인 상태를 확인해주세요.';
                window.location.href = '/user/login';
            } else if (xhr.status === 404) {
                errorMessage = '요청한 경로를 찾을 수 없습니다.';
            } else if (xhr.status === 500) {
                errorMessage = '서버 내부 오류입니다.';
            }
            alert(errorMessage);
        }
    });
}

/*@@@@@@@@@@@@@@@@@@@@@좋아요@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
let isLiked = false; // 좋아요 상태 초기화

// 좋아요 버튼 클릭 시 호출되는 함수
function toggleLike() {
    const aniIdx = document.querySelector('.animodal_usergrade').getAttribute('idx'); // 현재 애니메이션 인덱스 가져오기
    const token = localStorage.getItem("token"); // 사용자 토큰에서 가져오기

    if (!token) {
        alert("로그인이 필요합니다. 로그인 후 다시 시도해 주세요.");
        window.location.href = '/user/login';
        return;
    }

    isLiked = !isLiked; // 좋아요 상태 반전

    const likeIcon = document.getElementById("likeIcon");

    if (isLiked) {
        // 좋아요 추가
        likeIcon.classList.remove('fa-regular'); // 빈 하트
        likeIcon.classList.add('fa-solid'); // 채운 하트

        // DB에 좋아요 추가 요청
        fetch('/addLike', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + token // 토큰 추가
            },
            body: JSON.stringify({ aniIdx })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to add like');
            }
            console.log("좋아요가 추가되었습니다.");
        })
        .catch(error => {
            console.error("Error:", error);
            // 좋아요 상태 반전
            isLiked = false;
            likeIcon.classList.remove('fa-solid'); // 채운 하트
            likeIcon.classList.add('fa-regular'); // 빈 하트
        });
    } else {
        // 좋아요 취소
        likeIcon.classList.remove('fa-solid'); // 채운 하트
        likeIcon.classList.add('fa-regular'); // 빈 하트

        // DB에서 좋아요 삭제 요청
        fetch('/removeLike', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + token // 토큰 추가
            },
            body: JSON.stringify({ aniIdx })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to remove like');
            }
            console.log("좋아요가 취소되었습니다.");
        })
        .catch(error => {
            console.error("Error:", error);
            // 좋아요 상태 반전
            isLiked = true;
            likeIcon.classList.remove('fa-regular'); // 빈 하트
            likeIcon.classList.add('fa-solid'); // 채운 하트
        });
    }
}