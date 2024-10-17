package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.NoticeDAO;
import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeDAO noticeDAO;

    // 페이징 정보를 포함한 공지사항 목록을 가져오는 메서드
    // 공지사항 관련 메서드
    @Override
    public PagingVO getNoticePage(int page, int size, String keyword) {
        int totalCount = noticeDAO.getTotalCount(new PagingVO(page, 0, size, keyword, 0));
        return new PagingVO(page, totalCount, size, keyword, 0);
    }

    // 공지사항 목록을 페이징 조건에 따라 가져오는 메서드
    @Override
    public List<NoticeVO> getNotices(PagingVO pVO) {
        return noticeDAO.getNotices(pVO);
    }

    // 자주 묻는 질문(FAQ) 관련 메서드
    @Override
    public PagingVO getFaqPage(int page, int size, int faqtype) {
        int totalFaqCount = noticeDAO.getTotalFaqCount(new PagingVO(page, 0, size, "", faqtype));
        return new PagingVO(page, totalFaqCount, size, "", faqtype);
    }

    @Override
    public List<NoticeVO> getFaqs(PagingVO pVO) {
        return noticeDAO.getFaqs(pVO);
    }




}
