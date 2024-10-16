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
    List<MasterVO> getReportinguserList(MasterVO vo);

    // 신고 내역을 t_report 테이블에 삽입
    void updateReport(int idx, String userid, String reason, LocalDateTime reportDT, LocalDateTime handleDT, int handleState);

    // 모든 리뷰 불러오기
    List<MasterVO> getReplyList(MasterVO vo);

    // idx에 대한 리뷰 디테일 불러오기
    MasterVO getReviewDetail(int idx);

    // 애니 정보 선택
    MasterVO aniSelect(int idx);

    // 애니 idx의 기존 이미지 값 불러오기
    String getCurrentImgFile(int idx);

    // 애니 정보 수정
    int updateAnimation(MasterVO vo);

    // 문의 내용 목록 불러오기
    List<MasterVO> getQNAList();

    // 문의 들어온 내용 중 답변 처리 안된 갯수 파악하기
    int getUnansweredQnaCount();

    // t_ban에 들어와 있는 데이터 목록 불러오기
    List<MasterVO>getReportingUser();

    // 전체 신고 누적 횟수 카운트
    int getTotalReportCount();

    // 특정 아이디의 신고 횟수 카운트
    int getTotalUserReport(int useridx);

    void insertReply(@Param("idx") int idx, @Param("reply") String reply, @Param("adminIdx") int adminIdx, @Param("regDT") LocalDateTime regDT);

    void updateHandleState(int idx);
    Integer findAdminIdxByUserid(String adminId);

    // 애니 데이터 베이스 추가
    void insertAnimation(MasterVO aniVO);

    // 애니 삭제 하기
    void deletePostByIdx(int idx);

    // 해당 굿즈의 idx 구하기
    MasterVO getStoreByIdx(int idx);

    // 굿즈 상품 수정
    int updateStore(MasterVO store);

    List<MasterVO> findSubCategoriesByCategory(@Param("category") int category);
    int insertProductImg(MasterVO productImg);
}
