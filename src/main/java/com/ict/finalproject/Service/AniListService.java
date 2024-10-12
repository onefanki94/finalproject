package com.ict.finalproject.Service;

import com.ict.finalproject.vo.AniListVO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface AniListService {
    List<AniListVO> getAniList(); // 전체 애니메이션 목록 조회

    List<AniListVO> getAniListSelect(); // 애니메이션 선택 조회

    AniListVO getAniDetailView(String title); // 특정 애니메이션 상세 조회

    void incrementAniHit(String title); // 조회수 증가

     List<AniListVO> getAniListWithPagination(int offset, int limit); // 페이지네이션을 위한 애니메이션 목록 조회

}
