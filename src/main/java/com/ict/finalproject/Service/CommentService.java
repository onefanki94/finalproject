package com.ict.finalproject.Service;

import com.ict.finalproject.vo.CommentVO;
import com.ict.finalproject.vo.CommuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {

    // 글 작성 메서드
    int insertComment(CommentVO comment);

    //댓글 목록
    List<CommentVO> getComment(int comm_idx);

    // 게시글 수정 메서드
    int updateCommnet(CommentVO comment);
    int deleteComment(int idx);

    // 대댓글 작성 메서드
    int insertReply(CommentVO comment);

    // 대댓글 목록 조회 메서드 (부모 댓글 idx로)
    List<CommentVO> getReplies(int parentidx);

    int updeteReport();


}
