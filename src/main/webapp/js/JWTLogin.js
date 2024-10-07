function login() {
    const userid = document.getElementById("userid").value.trim();
    const userpwd = document.getElementById("userpwd").value.trim();

    if (!userid || !userpwd) {
        alert("아이디와 비밀번호를 입력해 주세요.");
        return;
    }

    fetch('/user/loginOk', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `userid=${encodeURIComponent(userid)}&userpwd=${encodeURIComponent(userpwd)}`
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('로그인 실패: ' + response.status);
        }
        return response.json();
    })
    .then(data => {
        if (data.token) {
            // JWT 토큰을 localStorage에 저장
            localStorage.setItem("token", data.token);
            alert("로그인 성공!");

            // 메인 페이지로 이동
            window.location.href = "/";
        } else {
            alert("로그인 실패: " + data.errorMessage);
        }
    })
    .catch(error => {
        console.error("로그인 중 오류 발생:", error);
        alert("로그인 실패: 다시 시도해 주세요.");
    });
}

// 모든 요청에 JWT 토큰을 Authorization 헤더로 추가
function makeAuthenticatedRequest(url, options = {}) {
    const token = localStorage.getItem("token");
    if (!token) {
        console.error("로컬 스토리지에 토큰이 없습니다. 로그인이 필요합니다.");
        return;
    }

    if (!options.headers) options.headers = {};
    options.headers['Authorization'] = `Bearer ${token}`;

    return fetch(url, options);
}

