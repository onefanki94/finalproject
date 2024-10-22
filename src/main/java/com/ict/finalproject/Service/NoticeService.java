package com.ict.finalproject.Service;

import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import com.ict.finalproject.vo.QnaVO;

import java.util.List;

public interface NoticeService {

    // 공지사항 관련 메서드
    List<NoticeVO> getNotices(PagingVO pVO);  // 공지사항 목록
    int getTotalCount(PagingVO pVO);  // 공지사항 페이징

    // FAQ 목록 메서드 (페이징 없이)
    List<NoticeVO> getFaqs();


    List<NoticeVO> getSearchFas(String type);

    // 1:1문의 메서드 추가
    int saveQna(QnaVO qna);
    QnaVO getQnaByIdx(int idx);

}
