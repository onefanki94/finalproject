package com.ict.finalproject.Service;

import com.ict.finalproject.vo.CommuVO;

import java.util.List;

public interface CommuService {
    //글작성
    CommuVO writeBoard(CommuVO board);

    //게시글 가져오기
    List<CommuVO> List(String commtype);




}
