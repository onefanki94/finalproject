package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.AniListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface AniListDAO {

    List<AniListVO> getAniList();

    List<AniListVO> getAniListSelect(); // 전체 애니메이션 목록 조회

    AniListVO getAniDetailView(@Param("title") String title); // 특정 애니메이션 상세 조회

    void incrementAniHit(String title); // 조회수 증가

    List<AniListVO> findAniListWithPagination(@Param("offset") int offset, @Param("limit") int limit); // 페이지네이션을 위한 애니메이션 목록 조회

    List<AniListVO> getMoviesByGenre(@Param("anitype") int anitype); // 특정 장르의 애니메이션 목록 조회

    List<AniListVO> getSortedAniList(@Param("sortBy") String sortBy); // 정렬된 애니메이션 목록 조회

    // 별점 추가 메서드
    void addGrade(@Param("ani_idx") int aniIdx, @Param("grade") int grade, @Param("useridx") int userIdx);
    // 평균 별점 조회 메서드
    double getAverageRatingByAniId(int aniId);


    // 줄거리 조회 메서드
    String getOutline(@Param("title") String title); // 특정 애니메이션의 줄거리 조회

    // 비슷한 작품 랜덤 구현
    List<AniListVO> getRandomSimilarAnis(String genreType);

    Integer getUseridx(String userid);

    public void aniLike(AniListVO likeVO);  // 좋아요 추가
    public void deleteaniLike(AniListVO likeVO);  // 좋아요 취소
    public AniListVO selectaniLike(@Param("pro_idx") int pro_idx, @Param("userIdx") int userIdx);  // 좋아요 상태 확인
}