package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.AniListVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface AniListDAO {

    List<AniListVO> aniList();

    List<AniListVO> aniListSelect();

    AniListVO aniDetailView(String title);

    void updateAniHit(String title);
}