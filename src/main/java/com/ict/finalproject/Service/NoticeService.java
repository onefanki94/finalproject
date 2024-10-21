package com.ict.finalproject.Service;

import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import com.ict.finalproject.vo.QnaVO;

import java.util.List;

public interface NoticeService {

    // 공지사항 관련 메서드
    List<NoticeVO> getNotices(PagingVO pVO);  // 공지사항 목록
    PagingVO getNoticePage(int page, int size, String keyword);  // 공지사항 페이징

    // 자주 묻는 질문(FAQ) 관련 메서드
    List<NoticeVO> getFaqs(PagingVO pVO);      // FAQ 목록
    PagingVO getFaqPage(int page, int size, int faqtype);      // FAQ 페이징

    // 1:1문의 메서드 추가
    int saveQna(QnaVO qna);
    QnaVO getQnaByIdx(int idx);

    // 전체 공지사항 목록을 가져오는 메서드(storeMain)
    List<NoticeVO> getAllNotices();


}
