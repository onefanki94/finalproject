package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.MasterVO;
import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MasterDAO {
    // 공지사항 추가 DAO
    int  insertNotice(MasterVO notice);
    // 자주묻는 질문 추가
    int insertFAQ(MasterVO faq);
    int insertStore(MasterVO store);
    // 자주 묻는 질문 리스트 전체 출력
    public List<MasterVO> getFAQList();
    // 굿즈 상품테이블 리스트 전체 출력
    public List<MasterVO> getStoreList();
    // 굿즈 상품테이블 총 상품수 구하기
    int getTotalStore();

    // 굿즈 상품테이블 카테고리별 카운트 구하기
    Map<String, Object> getCategoryCountByCode(@Param("categoryCode") int categoryCode);

    // 커뮤니티 작성된 모든 게시글 불러오기
    List<MasterVO> getBoardList();

    // adminid를 통해 adminidx 가져오기
    Integer getAdminIdxByAdminid(String adminid);

    // 애니 리스트 불러오기
    public List<MasterVO> getAniAllList();

    // 공지사항 삽입
    void addNotice(MasterVO notice);

    // 공지사항 글 불러오기
    List<MasterVO> getNoticeList();

    List<MasterVO> getReviewList();

    // 신고 추가
    void insertReport(@Param("userid") String userid, @Param("reason") String reason, @Param("stopDT") LocalDateTime stopDT, @Param("endDT") LocalDateTime endDT);

    // 유저가 정지 상태인지 확인
    boolean isUserBanned(@Param("userid") String userid);

    // 유저가 탈퇴 상태인지 확인
    boolean isUserDeleted(@Param("idx") int idx);
    Integer findUserIdxByUserid(String userid);

    // 탈퇴 회원 조회 하기
    List<MasterVO> getMemberDelList(MasterVO vo);

    // 회원이 신고 한 유저 목록 구하기
    List<MasterVO> getReportUserList(MasterVO vo);
}
