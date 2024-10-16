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
    @Override
    public PagingVO getNoticePage(int page, int size, String keyword, String tag) {
        int totalCount = noticeDAO.getTotalCount(new PagingVO(page, 0, size, keyword, tag));  // 전체 항목 수 계산
        PagingVO pVO = new PagingVO(page, totalCount, size, keyword, tag);
        return pVO;
    }

    // 공지사항 목록을 페이징 조건에 따라 가져오는 메서드
    @Override
    public List<NoticeVO> getNotices(PagingVO pVO) {
        List<NoticeVO> notices = noticeDAO.getNotices(pVO);
        System.out.println("Retrieved Notices: " + notices);
        return notices;
    }

}
