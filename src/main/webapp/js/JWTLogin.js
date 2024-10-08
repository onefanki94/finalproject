function login() {
    const userid = document.getElementById("userid").value.trim();  // 아이디 입력값 가져오기
    const userpwd = document.getElementById("userpwd").value.trim();  // 비밀번호 입력값 가져오기

    // 아이디와 비밀번호가 비어있는지 확인
    if (!userid || !userpwd) {
        alert("아이디와 비밀번호를 입력해 주세요.");  // 입력 오류 알림
        return;
    }

    // 로그인 요청 보내기
    fetch('/user/loginOk', {  // 로그인 요청 URL
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },  // 요청 헤더 설정
        body: JSON.stringify({ userid, userpwd })  // 입력값을 JSON으로 변환하여 요청 본문에 포함
    })
    .then(response => {
        // 서버 응답 헤더에서 JWT 토큰 추출
        let token = response.headers.get("Authorization");

        if (token) {
            // "Bearer " 접두어가 포함되어 있을 경우 제거
            if (token.startsWith("Bearer ")) {
                token = token.substring(7);  // "Bearer " 문자열 제거
            }

            // 로컬 스토리지에 JWT 토큰 저장
            localStorage.setItem("token", token);  // JWT 토큰 저장
            console.log("JWT 토큰 저장 성공: ", token);

            // 로그인 성공 시 메인 페이지로 이동
            window.location.href = "/";  // 메인 페이지로 리다이렉트
        } else {
            console.error("서버로부터 JWT 토큰을 받지 못했습니다.");  // 토큰 미수신 경고
        }
    })
    .catch(error => console.error('로그인 실패:', error));  // 로그인 실패 시 오류 출력
}

// 인증된 요청을 위한 함수
async function makeAuthenticatedRequest(url, options = {}) {
    const token = localStorage.getItem("token");  // 로컬 스토리지에서 JWT 토큰 가져오기
    if (!token) {
        alert("로그인이 필요합니다.");  // 토큰이 없을 경우 로그인 필요 메시지
        throw new Error("JWT 토큰이 없습니다. 로그인이 필요합니다.");  // 에러 발생
    }

    // Authorization 헤더에 JWT 토큰 추가
    if (!options.headers) options.headers = {};
    options.headers['Authorization'] = `Bearer ${token}`;
    console.log("Authorization 헤더에 설정된 JWT 토큰: ", options.headers['Authorization']);  // 디버그용 로그

    try {
        const response = await fetch(url, options);  // 요청 보내기
        return response;  // 응답 반환
    } catch (error) {
        console.error("요청 중 오류 발생:", error);  // 요청 오류 출력
        alert("요청 처리 중 오류가 발생했습니다. 나중에 다시 시도해 주세요.");
        throw error;  // 에러 발생
    }
}

document.addEventListener("DOMContentLoaded", function () {
    const adminLink = document.getElementById("adminLink");  // 관리자 링크 요소 찾기

    if (adminLink) {
        let isNavigating = false;  // 중복 이동 방지 플래그

        // 관리자 링크 클릭 시 이벤트 처리
        adminLink.addEventListener("click", async function (event) {
            event.preventDefault();  // 기본 링크 동작 막기

            if (isNavigating) return;  // 이미 이동 중이면 실행하지 않음
            isNavigating = true;  // 이동 시작

            try {
                // makeAuthenticatedRequest 함수를 사용하여 관리자 권한 확인 요청 보내기
                const response = await makeAuthenticatedRequest('/master/checkAdmin', { method: 'GET' });

                // 응답에서 관리자 여부 확인
                const isAdmin = await response.json();  // 서버에서 반환된 값 (true/false)

                if (response.ok && isAdmin) {
                    console.log("페이지 접근 성공");  // 접근 성공 로그
                    location.href = "/master/masterMain";  // 관리자 페이지로 이동
                } else {
                    console.error('페이지 접근 권한이 없습니다.', response.status);  // 접근 권한 오류 출력
                    alert("admin 계정만 접근 가능합니다.");  // 접근 불가 알림
                }
            } catch (error) {
                console.error('페이지 접근 실패:', error);  // 페이지 접근 실패 로그
                alert("페이지 접근에 실패했습니다. 나중에 다시 시도해 주세요.");  // 오류 발생 시 사용자 피드백
            } finally {
                isNavigating = false;  // 이동 완료, 플래그 초기화
            }
        });
    } else {
        console.error("adminLink 요소가 존재하지 않습니다. ID를 확인하세요.");  // 요소 미발견 경고
    }
});
