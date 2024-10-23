function formCheck() {
    // 아이디
    if (document.getElementById("userid").value.trim() === '') {
        alert("아이디를 입력하세요!");
        return false;
    }

    // 비밀번호
    const password = document.getElementById("userpwd").value;
    const passwordConfirm = document.getElementById("userpwd2").value;

    if (password.trim() === '') {
        alert("비밀번호를 입력하세요!");
        return false;
    }
    if (password !== passwordConfirm) {
        alert("비밀번호가 같지 않습니다!");
        return false;
    }

    // 이름
    const username = document.getElementById("username").value;
    const nameRegEx = /^[가-힣]{2,15}$/; // 한글 이름 2~15자
    if (!nameRegEx.test(username)) {
        alert("이름은 한글로 2자 이상 15자 이하로 입력하세요.");
        return false;
    }

    // 이메일
    const email = document.getElementById("email").value;
    const emailRegEx = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 간단한 이메일 정규 표현식
    if (!emailRegEx.test(email)) {
        alert("유효한 이메일 주소를 입력하세요.");
        return false;
    }

    // 우편번호
    if (document.getElementById("zipcode").value.trim() === '') {
        alert("우편번호를 입력하세요.");
        return false;
    }

    // 기본주소
    if (document.getElementById("addr").value.trim() === '') {
        alert("기본주소를 입력하세요.");
        return false;
    }

    // 상세주소
    if (document.getElementById("addrdetail").value.trim() === '') {
        alert("상세주소를 입력하세요.");
        return false;
    }

    // 모든 유효성 검사를 통과한 경우 true 반환
    return true;
}
