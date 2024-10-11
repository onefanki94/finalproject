package com.ict.finalproject.Service;

import com.ict.finalproject.vo.CommentVO;
import com.ict.finalproject.vo.CommuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {

    // 글 작성 메서드
    int insertComment(CommentVO comment);

    // 게시글 수정 메서드
    int updateCommnet(CommentVO comment);

    int deleteComment(int idx);

    int updeteReport();


}
