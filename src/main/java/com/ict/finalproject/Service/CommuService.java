package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.CommuDAO;
import com.ict.finalproject.vo.CommuVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface CommuService {



    //글작성
    CommuVO writeBoard(CommuVO board);

    // 게시글(탭 구분-전체, 자랑, 추천 등)
    List<CommuVO> List(String commtype);

    // 필터, 정렬, 검색 게시글 목록
    List<CommuVO> FilteredList(String commtype, String orderBy, String searchCategory, String searchKeyword);

    //상세페이지
    CommuVO Detail(int idx);

    //조회수
    void HitCount(@Param("idx") int idx);

    //이전, 다음페이지
    CommuVO PreviousPost(int idx);
    CommuVO NextPost(int idx);

    // 게시글 수정, 삭제
    boolean UpdateBoard(CommuVO board);
    int Delete(int idx);
}
