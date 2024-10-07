package com.ict.finalproject.Service;

import com.ict.finalproject.vo.CommuVO;

import java.util.List;

public interface CommuService {
    //글작성
    CommuVO writeBoard(CommuVO board);

    // 전체 게시글 가져오기
    List<CommuVO> newList();

    List<CommuVO> BoastList();
    List<CommuVO> FriendList();
    List<CommuVO> FanartList();
    List<CommuVO> List(String commtype);


}
