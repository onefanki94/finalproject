package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.AniListDAO;
import com.ict.finalproject.vo.AniListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AniListServicelmpl implements AniListService{

    @Inject
    AniListDAO dao;
    @Autowired
    private AniListDAO aniListDAO;

    @Override
    public List<AniListVO> getAniList() {
        return aniListDAO.getAniList();
    }

    @Override
    public List<AniListVO> getAniListSelect() {
        return aniListDAO.getAniListSelect();
    }

    @Override
    public AniListVO getAniDetailView(String title) {
        return aniListDAO.getAniDetailView(title);
    }

    @Override
    public void incrementAniHit(String title) {
        aniListDAO.incrementAniHit(title);
    }

    @Override
    public List<AniListVO> getAniListWithPagination(int offset, int limit) {
        return aniListDAO.findAniListWithPagination(offset, limit);
    }

    @Override
    public List<AniListVO> getAniListByGenre(int anitype) {
        return aniListDAO.getMoviesByGenre(anitype); // 장르에 따른 애니메이션 목록을 반환
    }

    @Override
    public List<AniListVO> getSortedAniList(String sortBy) {

        return aniListDAO.getSortedAniList(sortBy);
    }

    @Override
    public void addGrade(int aniIdx, int grade, int userIdx) {

        aniListDAO.addGrade(aniIdx, grade, userIdx);
    }

    @Override
    public String getOutline(String title) {
        return aniListDAO.getOutline(title);
    }

    @Override
    public List<AniListVO> getRandomSimilarAnis(String genreType) {
        return dao.getRandomSimilarAnis(genreType);
    }

    @Override
    public double getAverageRatingByAniId(int aniId) {
        // 평균 별점을 계산하기 위한 DAO 호출
        return aniListDAO.getAverageRatingByAniId(aniId);
    }

    @Override
    public Integer getUseridx(String userid) {
        return dao.getUseridx(userid);
    }



}
