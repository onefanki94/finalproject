package com.ict.finalproject.Service;

import com.ict.finalproject.vo.AniListVO;

import java.util.List;

public interface AniListService {
    List<AniListVO> getAniList();

    List<AniListVO> getAniListSelect();

    AniListVO getAniDetailView(String title);

    void incrementAniHit(String title);
}
