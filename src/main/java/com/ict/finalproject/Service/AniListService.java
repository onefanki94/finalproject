package com.ict.finalproject.Service;

import com.ict.finalproject.vo.AniListVO;

import java.util.List;

public interface AniListService {
    List<AniListVO> getAniList(); // 전체 애니메이션 목록 조회

    List<AniListVO> getAniListSelect(); // 애니메이션 선택 조회

    AniListVO getAniDetailView(String title); // 특정 애니메이션 상세 조회

    void incrementAniHit(String title); // 조회수 증가

     List<AniListVO> getAniListWithPagination(int offset, int limit); // 페이지네이션을 위한 애니메이션 목록 조회

    List<AniListVO> getAniListByGenre(int anitype); // 특정 장르의 애니메이션 목록 조회 추가

    List<AniListVO> getSortedAniList(String sortBy); // 정렬된 애니메이션 목록 조회 추가

     void addGrade(int aniIdx, int grade, int userIdx); // 별점


     String getOutline(String title); // 특정 애니메이션의 줄거리 조회
          List<AniListVO> getRandomSimilarAnis(String genreType);

     double getAverageRatingByAniId(int aniId); // 평균 별점 조회 메서드
    Integer getUseridx(String userid);

/*

    void aniLike(AniListVO likeVO);  // 좋아요 추가
    void deleteaniLike(AniListVO likeVO);  // 좋아요 취소
    AniListVO selectaniLike(int ani_idx, int userIdx);  // 좋아요 조회
*/


}
