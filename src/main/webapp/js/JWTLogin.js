async function login(username, password) {
    try {
        const response = await fetch('/loginOk', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ userid: username, userpwd: password })
        });

        if (response.ok) {
            const data = await response.json();  // JSON 형태의 응답을 파싱
            const token = data.token;
            const userid = data.userid;

            // JWT 토큰을 로컬 스토리지에 저장
            localStorage.setItem("token", token);
            console.log("로그인 성공. JWT 토큰이 로컬 스토리지에 저장되었습니다.");

            // 로그인 성공 시 메인 페이지로 이동
            window.location.href = "/master/masterMain";  // 원하는 경로로 리다이렉트
        } else {
            console.error("로그인 실패:", response.status);
            alert("로그인 실패: 잘못된 사용자명 또는 비밀번호입니다.");
        }
    } catch (error) {
        console.error("로그인 중 오류 발생:", error);
    }
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


window.onload = function() {
    const token = localStorage.getItem('token');
    if (!token) {
        console.error('토큰이 로컬 스토리지에 없습니다.');
    } else {
        $.ajax({
            url: '/checkAuthentication',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer ' + token // JWT 토큰을 Authorization 헤더에 추가
            },
            success: function(response) {
                console.log('Authentication Response:', response);
            },
            error: function(xhr, status, error) {
                console.error('Authentication Error:', error);
            }
        });
    }
};

