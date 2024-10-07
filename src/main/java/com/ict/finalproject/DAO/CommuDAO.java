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

    // 게시글 불러오기 메서드
    List<CommuVO> List(String commtype);

}
