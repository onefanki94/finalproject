package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.NoticeDAO;
import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import com.ict.finalproject.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeDAO noticeDAO;

    // 페이징 정보를 포함한 공지사항 목록을 가져오는 메서드
    // 공지사항 관련 메서드
//

    // 공지사항 목록을 페이징 조건에 따라 가져오는 메서드
    @Override
    public List<NoticeVO> getNotices(PagingVO pVO) {
        return noticeDAO.getNotices(pVO);
    }

    @Override
    public PagingVO getNoticePage(int page, int size, String keyword) {
        return null;
    }

    // 자주 묻는 질문(FAQ) 관련 메서드
//    @Override
//    public PagingVO getFaqPage(int page, int size, int faqtype) {
//        int totalFaqCount = noticeDAO.getTotalFaqCount(new PagingVO(page, 0, size, "", faqtype));
//        return new PagingVO(page, totalFaqCount, size, "", faqtype);
//    }

    @Override
    public List<NoticeVO> getFaqs(PagingVO pVO) {
        return noticeDAO.getFaqs(pVO);
    }

    @Override
    public PagingVO getFaqPage(int page, int size, int faqtype) {
        return null;
    }


    //1:1 문의
    @Override
    public int saveQna(QnaVO qna) {
        // NoticeDAO를 통해 QNA 데이터를 저장
        return noticeDAO.saveQna(qna);
    }

    @Override
    public QnaVO getQnaByIdx(int idx) {
        // NoticeDAO를 통해 QNA 데이터를 가져옴
        return noticeDAO.getQnaByIdx(idx);
    }




}
