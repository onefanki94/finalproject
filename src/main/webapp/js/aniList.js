//=================================무한스크롤=======================================================
let page = 1; // 페이지 번호

// 더 많은 데이터를 불러오는 함수 (서버로부터 데이터를 가져오는 부분)
function loadMoreItems() {
    fetch(`/getMoreAniList?page=${page}`)
        .then(response => response.json())
        .then(data => {
            if (data.length === 0) {
                console.log('No more data to load');
                return; // 더 이상 데이터가 없을 경우 종료
            }

            const aniViewList = document.querySelector('.ani_viewList');

            data.forEach(item => {
                const div = document.createElement('div');
                div.classList.add('div_li');
                div.innerHTML = `
                    <div class="list_img_bg" data-bs-toggle="modal" data-bs-target="#exampleModal" data-title="${item.title}">
                        <img src="${item.post_img}" alt="${item.title}">
                        <div class="overlay">상세 보기</div>
                    </div>
                    <p>${item.title}</p>
                    <p class="genre">
                        <span>${item.anitype}</span>
                        <span>${item.agetype} 관람</span>
                    </p>
                `;
                aniViewList.appendChild(div);
            });

            // 새로 추가된 항목 감시
            const divItems = document.querySelectorAll('.div_li');
            divItems.forEach(item => {
                observer.observe(item);
            });

            page++; // 다음 페이지로 이동
        })
        .catch(err => console.error('Error fetching data:', err)); // 에러 핸들링
}

// 스크롤이 끝에 다다를 때 데이터를 더 불러오게 하는 관찰자
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            loadMoreItems();
        }
    });
}, {
    root: null,
    threshold: 0.8 // 80% 지점에서 새 항목 로드 시작
});

// 페이지 로드 시 첫 항목 불러오기
document.addEventListener('DOMContentLoaded', loadMoreItems);
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@이벤트 목록을 불러오는 함수
function loadEvents() {
	if (loading) return; // 이미 로딩 중이면 중단

	loading = true; // 로딩 시작
	document.getElementById('loading').style.display = 'block'; // 로딩 메시지 표시

	fetch(`/api/events?page=${page}`)
		.then(response => response.json())
		.then(data => {
			const eventList = document.getElementById('event-list');
			data.forEach(event => {
				const eventItem = document.createElement('div');
				eventItem.textContent = event.title; // 제목을 표시 (필요에 따라 수정)
				eventList.appendChild(eventItem);
			});

			loading = false; // 로딩 종료
			document.getElementById('loading').style.display = 'none'; // 로딩 메시지 숨김
			page++; // 페이지 번호 증가
		})
		.catch(error => {
			console.error('Error loading events:', error);
			loading = false; // 로딩 종료
			document.getElementById('loading').style.display = 'none'; // 로딩 메시지 숨김
		});
}

// 스크롤 이벤트 리스너
window.addEventListener('scroll', () => {
	if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
		loadEvents(); // 페이지 하단에 도달하면 이벤트 로드
	}
});

// 초기 이벤트 로드
loadEvents();

function toggleSubMenu(submenuId) {
	const submenu = document.getElementById(submenuId);
	submenu.style.display = submenu.style.display === 'none' ? 'block' : 'none';
}

function selectGenre(genre) {
	console.log('Selected genre:', genre);
}

function selectTag(tag) {
	console.log('Selected tag:', tag);
}

function selectRating(rating) {
	console.log('Selected rating:', rating);
}


function toggleSubMenu(submenuId) {
	const submenu = document.getElementById(submenuId);
	submenu.style.display = submenu.style.display === 'none' || submenu.style.display === '' ? 'block' : 'none';
}

function selectCategory(category) {
	alert(`선택한 카테고리: ${category}`);
	// 카테고리에 따라 리스트 필터링 기능을 구현할 수 있습니다.
}

function selectGenre(genre) {
	alert(`선택한 장르: ${genre}`);
}

function selectTag(tag) {
	alert(`선택한 태그: ${tag}`);
}

function selectRating(rating) {
	alert(`선택한 관람가: ${rating}`);
}

$('#exampleModal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget);  // 클릭된 이미지
	var title = button.data('title');     // data-title 속성에서 타이틀 가져오기
	var imageUrl = button.data('img');    // data-img 속성에서 이미지 URL 가져오기
	var genre = button.data('genre');     // data-genre 속성에서 장르 정보 가져오기

	var modal = $(this);
	modal.find('.modal-title').text(title);       // 모달 타이틀 변경
	modal.find('#modalImage').attr('src', imageUrl);  // 모달 이미지 변경
	modal.find('#modalGenre').text(genre);        // 모달 장르 정보 변경
});

/*======별점====== */
document.querySelectorAll('.star-icon').forEach(star => {
	star.addEventListener('click', function () {
		// 클릭된 별점의 값을 가져옴
		const value = this.getAttribute('data-value');

		// 모든 별점의 선택 상태를 초기화
		document.querySelectorAll('.star-icon').forEach(s => {
			s.classList.remove('selected');
		});

		// 클릭된 별점까지의 별점을 선택 상태로 변경
		for (let i = 1; i <= value; i++) {
			document.querySelector(`.star-icon[data-value="${i}"]`).classList.add('selected');
		}
	});
});

/* =============슬라이더============= */
const sliderWrapper = document.querySelector('.slider-wrapper');
const slides = document.querySelectorAll('.slider-wrapper img');
let currentSlide = 0;

document.querySelector('.slider-btn-prev').addEventListener('click', () => {
	currentSlide = (currentSlide > 0) ? currentSlide - 1 : slides.length - 1;
	sliderWrapper.style.transform = `translateX(-${currentSlide * 100}%)`;
});

document.querySelector('.slider-btn-next').addEventListener('click', () => {
	currentSlide = (currentSlide < slides.length - 1) ? currentSlide + 1 : 0;
	sliderWrapper.style.transform = `translateX(-${currentSlide * 100}%)`;
});

/*@@@@@@@@@@@@@장르@@@@@@@@@@*/

$(document).ready(function () {
    // 애니메이션 카드 클릭 시 모달 열기
    $('.list_img_bg').on('click', function () {
        const title = $(this).data('title'); // 클릭한 카드의 제목 가져오기
        const imageSrc = $(this).find('img').attr('src'); // 클릭한 카드의 이미지 경로 가져오기

        // 모달 내용 업데이트
        $('.animodal_item_infoDiv h1').text(title);
        $('.animodal_item_imgBack img').attr('src', imageSrc); // 모달 이미지 업데이트
        $('.animodal_item_bottom_nav div > div > div > div').text(`비슷한 작품 - ${title}`); // 비슷한 작품 제목 업데이트 (예시)

        // 모달 열기
        $('.animodal_body').fadeIn();
    });

    // 모달 닫기 (X 버튼 클릭 시)
    $('.fa-solid.fa-x').on('click', function () {
        $('.animodal_body').fadeOut();
    });

    // 모달 닫기 (배경 클릭 시)
    $('.animodal_background').on('click', function () {
        $('.animodal_body').fadeOut();
    });

    // 애니메이션 줄거리 모달 열기
    $('.ouline_more').on('click', function () {
        // 애니메이션 제목과 정보를 가져와서 모달에 표시
        const summaryTitle = $(this).closest('.animodal_infoHead').find('h1').text();
        const summaryContent = $(this).closest('.animodal_infoBody').find('.ani_outline span').text();

        $('.aniInfo_modal_container .item-detail-info-modal section span').eq(0).text(summaryTitle);
        $('.aniInfo_modal_container .item-detail-info-modal section span').eq(1).text(summaryContent);

        // 줄거리 모달 열기
        $('.aniInfo_modal_body').fadeIn();
    });

    // 줄거리 모달 닫기 (X 버튼 클릭 시)
    $('.aniInfo_modal_container_flex .fa-solid.fa-x').on('click', function () {
        $('.aniInfo_modal_body').fadeOut();
    });

    // 줄거리 모달 닫기 (배경 클릭 시)
    $('.aniInfo_modal_body > div:first-child').on('click', function () {
        $('.aniInfo_modal_body').fadeOut();
    });
});