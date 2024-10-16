package com.ict.finalproject.Service;

import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;

import java.util.List;

public interface NoticeService {
    List<NoticeVO> getNotices(PagingVO pVO);  // 검색 조건 및 페이징 정보를 사용해 공지사항 목록을 가져오는 메서드
    PagingVO getNoticePage(int page, int size, String keyword, String tag);  // 페이징 정보를 포함한 공지사항 목록을 가져오는 메서드
}
