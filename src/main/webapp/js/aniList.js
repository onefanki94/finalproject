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

