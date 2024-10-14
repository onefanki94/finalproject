package com.ict.finalproject.DAO;


import com.ict.finalproject.vo.CommentVO;
import com.ict.finalproject.vo.CommuVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentDAO {

    // 댓글 작성 메서드
    int insertComment(CommentVO comment);

    //댓글 목록
    List<CommentVO> getComment(int comm_idx);

    // 댓글 수정/삭제 메서드
    int updateCommnet(CommentVO comment);
    int deleteComment(int idx);

    // 대댓글 작성 메서드
    int insertReply(CommentVO comment);

    // 대댓글 목록 조회 메서드 (부모 댓글 idx로)
    List<CommentVO> getReplies(int parentidx);


    int updeteReport();

}
