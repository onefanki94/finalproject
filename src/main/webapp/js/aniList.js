//=================================무한스크롤=======================================================
let page = 1; // 현재 페이지 번호
let loading = false; // 로딩 상태

// 이벤트 목록을 불러오는 함수
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
$('.list_img_bg').click(function() {
    var title = $(this).data('title');
    var genre = $(this).find('.genre span:first').text(); // 첫 번째 span이 장르라고 가정

    $('#modalTitle').text(title);
    $('#modalAnitype').text(genre); // 모달의 장르 업데이트

    var imageUrl = $(this).find('img').attr('src');
    $('#modalImage').attr('src', imageUrl);
})