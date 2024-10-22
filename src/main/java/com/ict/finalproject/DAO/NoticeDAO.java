package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import com.ict.finalproject.vo.QnaVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Mapper
public interface NoticeDAO {

    // 공지사항 관련 메서드
    List<NoticeVO> getNotices(PagingVO pVO);  // 검색 조건 및 페이징 정보를 사용해 공지사항 목록을 가져오는 메서드
    int getTotalCount(PagingVO pVO);  // 검색 조건을 포함한 전체 공지사항 수를 가져오는 메서드

    // FAQ 목록 가져오는 메서드 (페이징 없이)
    List<NoticeVO> getFaqs();  // FAQ 리스트

    //
    List<NoticeVO> getSearchFas(String type);

    // 1:1문의 메서드 추가
    int saveQna(QnaVO qna);
    QnaVO getQnaByIdx(int idx);

}