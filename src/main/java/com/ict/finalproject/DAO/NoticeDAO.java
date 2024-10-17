package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Mapper
public interface NoticeDAO {

    // 공지사항 관련 메서드
    List<NoticeVO> getNotices(PagingVO pVO);  // 검색 조건 및 페이징 정보를 사용해 공지사항 목록을 가져오는 메서드
    int getTotalCount(PagingVO pVO);  // 검색 조건을 포함한 전체 공지사항 수를 가져오는 메서드

    // 자주 묻는 질문(FAQ) 관련 메서드
    List<NoticeVO> getFaqs(PagingVO pVO);  // FAQ 페이징
    int getTotalFaqCount(PagingVO pVO);  // FAQ 전체 개수

}