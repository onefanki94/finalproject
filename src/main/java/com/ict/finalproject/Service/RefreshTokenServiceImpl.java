package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.RefreshTokenDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefreshTokenServiceImpl implements RefreshTokenService {

    private final RefreshTokenDAO refreshTokenDAO;

    @Autowired
    public RefreshTokenServiceImpl(RefreshTokenDAO refreshTokenDAO) {
        this.refreshTokenDAO = refreshTokenDAO;
    }

    @Override
    public void saveRefreshToken(String userid, String refreshToken, String expiredAt) {
        refreshTokenDAO.saveRefreshToken(userid, refreshToken, expiredAt);
    }

    @Override
    public String getRefreshTokenByUserId(String userid) {
        return refreshTokenDAO.getRefreshTokenByUserId(userid);
    }

    @Override
    public void deleteRefreshToken(String userid) {
        refreshTokenDAO.deleteRefreshToken(userid);
    }
}
