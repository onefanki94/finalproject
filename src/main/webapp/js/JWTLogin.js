async function login(username, password) {
    try {
        const response = await fetch('/loginOk', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',  // 반드시 JSON 형식으로 설정
                'Accept': 'application/json'         // 서버로부터 JSON 응답 기대
            },
            body: JSON.stringify({ userid: username, userpwd: password })  // JSON 형식으로 데이터 전송
        });

        const data = await response.json();  // JSON 응답 파싱

        if (response.ok) {
            if (data.success) {
                const token = data.token;
                const userid = data.userid;

                // JWT 토큰을 로컬 스토리지에 저장
                localStorage.setItem("token", token);
                console.log("로그인 성공. JWT 토큰이 로컬 스토리지에 저장되었습니다.");

                // 로그인 성공 시 메인 페이지로 이동
                window.location.href = "/";  // 원하는 경로로 리다이렉트
            } else if (data.isBanned) {
                // 로그인이 정지된 상태일 때 경고 메시지 표시
                alert("로그인이 정지되었습니다.");
            } else if (data.isDeleted) {
                // 탈퇴된 회원일 경우 경고 메시지 표시
                alert("탈퇴된 회원 아이디입니다.");
            } else {
                // 로그인 실패 처리
                alert(data.message || "로그인 실패: 잘못된 사용자명 또는 비밀번호입니다.");
            }
        } else {
            console.error("서버 응답 오류:", response.status);
            alert("서버 오류 발생: " + response.status);
        }
    } catch (error) {
        console.error("로그인 중 오류 발생:", error);
        alert("로그인 중 오류가 발생했습니다. 다시 시도해 주세요.");
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

async function reportUser(userid, reason, endDT) {
    // 로컬 스토리지에서 JWT 토큰 가져오기
    const token = localStorage.getItem("token");

    if (!token) {
        alert("로그인이 필요합니다.");
        return;
    }

    try {
        const response = await fetch('/reportinguserOK', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}` // JWT 토큰을 Authorization 헤더에 추가
            },
            body: JSON.stringify({
                userid: userid,
                reason: reason,
                endDT: endDT
            })
        });

        if (response.ok) {
            alert("신고가 성공적으로 접수되었습니다.");
            // 필요한 후속 처리
        } else {
            const errorData = await response.json();
            alert(`신고 실패: ${errorData.message || "알 수 없는 오류"}`);
        }
    } catch (error) {
        console.error("신고 처리 중 오류 발생:", error);
        alert("신고 처리 중 오류가 발생했습니다.");
    }
}






