package com.ict.finalproject.DAO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RefreshTokenDAO {

    // 리프레시 토큰 저장
    void saveRefreshToken(@Param("userid") String userid, @Param("refreshToken") String refreshToken, @Param("expiredAt") String expiredAt);

    // 특정 사용자에 대한 리프레시 토큰 조회
    String getRefreshTokenByUserId(@Param("userid") String userid);

    // 리프레시 토큰 삭제
    void deleteRefreshToken(@Param("userid") String userid);
}
