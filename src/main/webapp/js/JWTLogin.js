function login() {
    const userid = document.getElementById("userid").value.trim();
    const userpwd = document.getElementById("userpwd").value.trim();

    if (!userid || !userpwd) {
        alert("아이디와 비밀번호를 입력해 주세요.");
        return;
    }

    // 로그인 요청 보내기
    fetch('/user/loginOk', {  // URL 앞에 '/'를 추가하여 절대 경로로 설정
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ userid, userpwd, role: 'ROLE_user' })  // 사용자 입력 값을 JSON으로 변환하여 body에 포함
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
            localStorage.setItem("token", token);
            console.log("JWT 토큰 저장 성공: ", token);

            // 로그인 성공 시 메인 페이지로 이동
            window.location.href = "/";  // 원하는 페이지로 리다이렉트
        } else {
            console.error("서버로부터 JWT 토큰을 받지 못했습니다.");
        }
    })
    .catch(error => console.error('로그인 실패:', error));
}

async function makeAuthenticatedRequest(url, options = {}) {
    const token = localStorage.getItem("token");
    if (!token) {
        console.error("로컬 스토리지에 JWT 토큰이 없습니다. 로그인이 필요합니다.");
        throw new Error("JWT 토큰이 없습니다. 로그인이 필요합니다.");
    }

    if (!options.headers) options.headers = {};
    options.headers['Authorization'] = `Bearer ${token}`;

    try {
        const response = await fetch(url, options);
        if (response.redirected) {
            // 서버에서 리다이렉트 응답을 보낸 경우, 해당 URL로 이동
        }
        return response;
    } catch (error) {
        console.error("요청 중 오류 발생:", error);
        throw error;
    }
}

document.addEventListener("DOMContentLoaded", function () {
    const adminLink = document.getElementById("adminLink");

    if (adminLink) {
        let isNavigating = false;  // 중복 이동 방지 플래그

        adminLink.addEventListener("click", async function (event) {
            event.preventDefault();  // 기본 링크 동작 막기

            if (isNavigating) return;  // 이미 이동 중이면 실행하지 않음
            isNavigating = true;

            try {
                const response = await makeAuthenticatedRequest('/master/masterMain');

                if (response.ok) {
                    console.log("페이지 접근 성공");
                    // fetch 요청 후 페이지를 이동시키지 않고 서버의 응답 데이터를 처리함
                    // window.location.href 또는 window.location.replace 사용하지 않음
                    // 대신에 서버의 응답 데이터를 DOM에 표시하거나 다른 방식으로 UI를 업데이트함
                } else {
                    console.error('페이지 접근 권한이 없습니다.', response.status);
                    alert("admin 계정만 접근 가능합니다");
                }
            } catch (error) {
                console.error('페이지 접근 실패:', error);
            } finally {
                isNavigating = false;
            }
        });
    } else {
        console.error("adminLink 요소가 존재하지 않습니다. ID를 확인하세요.");
    }
});