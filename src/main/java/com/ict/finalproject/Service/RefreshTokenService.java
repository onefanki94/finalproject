package com.ict.finalproject.Service;

public interface RefreshTokenService {
    // 리프레시 토큰 저장 메서드
    void saveRefreshToken(String userid, String refreshToken, String expiredAt);

    // 리프레시 토큰 조회 메서드
    String getRefreshTokenByUserId(String userid);

    // 리프레시 토큰 삭제 메서드
    void deleteRefreshToken(String userid);
}
