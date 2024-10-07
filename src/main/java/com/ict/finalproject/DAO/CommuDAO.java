package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.CommuVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommuDAO {

    // 글 작성 메서드
    int insertBoard(CommuVO board);

    // 전체 게시글 불러오기 메서드
    List<CommuVO> newList();

    List<CommuVO> List(String commtype);
    List<CommuVO> BoastList();
    List<CommuVO> FriendList();
    List<CommuVO> FanartList();
}
