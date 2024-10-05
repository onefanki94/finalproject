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

// 로컬 스토리지에서 JWT 토큰을 가져와 요청에 Authorization 헤더로 추가하는 예제 코드
function makeAuthenticatedRequest(url, options = {}) {
    // 로컬 스토리지에서 JWT 토큰 가져오기
    const token = localStorage.getItem("token");
    if (!token) {
        console.error("로컬 스토리지에 JWT 토큰이 없습니다. 로그인이 필요합니다.");
        return Promise.reject("JWT 토큰이 없습니다. 로그인이 필요합니다.");
    }

    // Authorization 헤더에 JWT 토큰 추가 (Bearer 접두어 포함)
    if (!options.headers) options.headers = {};
    options.headers['Authorization'] = `Bearer ${token}`;
    console.log("Authorization 헤더에 설정된 JWT 토큰: ", options.headers['Authorization']);

    // fetch를 사용하여 요청 보내기
    return fetch(url, options);
}

document.addEventListener("DOMContentLoaded", function () {
    const adminLink = document.getElementById("adminLink");

    if (adminLink) {
        adminLink.addEventListener("click", function (event) {
            event.preventDefault();  // 기본 링크 동작 막기

            // JWT 토큰을 포함하여 요청 보내기
            makeAuthenticatedRequest('/master/masterMain')
                .then(response => {
                    if (response.ok) {
                        console.log("페이지 접근 성공 - 응답 데이터를 사용하여 UI를 업데이트");
                        alert("관리자 페이지로 이동합니다.");

                        // 서버의 응답 데이터를 사용하여 UI를 업데이트하거나 상태를 변경할 수 있음
                        response.text().then(data => console.log(data));
                    } else {
                        console.error('페이지 접근 권한이 없습니다.', response.status);
                        alert("admin계정만 접근 가능합니다");
                    }
                })
                .catch(error => console.error('페이지 접근 실패:', error));
        });
    } else {
        console.error("adminLink 요소가 존재하지 않습니다. ID를 확인하세요.");
    }
});