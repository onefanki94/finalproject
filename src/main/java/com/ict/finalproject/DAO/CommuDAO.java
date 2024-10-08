package com.ict.finalproject.DAO;


import com.ict.finalproject.vo.CommuVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommuDAO {

    // 글 작성 메서드
    int insertBoard(CommuVO board);

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

    // 게시글 수정 메서드
    int UpdateBoard(CommuVO board);
    int Delete(int idx);



}
