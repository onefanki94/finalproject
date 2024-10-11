package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.AniListDAO;
import com.ict.finalproject.vo.AniListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class AniListServicelmpl implements AniListService{

    @Inject
    AniListDAO dao;
    @Autowired
    private AniListDAO aniListDAO;

    @Override
    public List<AniListVO> getAniList() {
        return aniListDAO.aniList();
    }

    @Override
    public List<AniListVO> getAniListSelect() {
        return aniListDAO.aniListSelect();
    }

    @Override
    public AniListVO getAniDetailView(String title) {
        return aniListDAO.aniDetailView(title);
    }

    @Override
    public void incrementAniHit(String title) {
        aniListDAO.updateAniHit(title);
    }
}
