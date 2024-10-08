package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.CommuVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommuDAO {

    // 글 작성 메서드
    int insertBoard(CommuVO board);

    // 게시글 불러오기 메서드
    List<CommuVO> List(String commtype);

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
