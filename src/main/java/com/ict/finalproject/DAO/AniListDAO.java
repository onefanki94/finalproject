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

    AniListVO getAniDetailView(String title); // 특정 애니메이션 상세 조회

    void incrementAniHit(String title); // 조회수 증가

    List<AniListVO> findAniListWithPagination(@Param("offset") int offset, @Param("limit") int limit); // 페이지네이션을 위한 애니메이션 목록 조회


}