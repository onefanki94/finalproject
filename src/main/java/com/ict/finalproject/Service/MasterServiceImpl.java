package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.MasterDAO;
import com.ict.finalproject.vo.MasterVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class MasterServiceImpl implements MasterService {
    @Autowired
    MasterDAO dao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    // 관리자페이지 공지사항 추가
    public MasterVO createNotice(MasterVO notice) {
        /**
         * 관리자 페이지에서 공지사항을 추가하는 메서드입니다.
         *
         * @param vo 공지사항의 정보를 담고 있는 MasterVO 객체 (제목, 내용, 작성자 정보 포함)
         * @return 데이터베이스에 공지사항을 성공적으로 추가한 경우 1, 실패한 경우 0 반환
         */
        int result = dao.insertNotice(notice);
        return result > 0 ? notice : null;
    }

    @Override
    public MasterVO createFAQ(MasterVO faq) {
        int result = dao.insertFAQ(faq);
        return result > 0 ? faq : null;
    }

    @Override
    public MasterVO createStore(MasterVO store) {
        int result = dao.insertStore(store); // 여기서 idx가 자동으로 설정됩니다.

        // 첫 번째 insert가 성공한 경우에만 두 번째 작업 수행
        if (result > 0) {
            int pro_idx = store.getIdx(); // 삽입된 상품의 idx를 가져옵니다.

            // 두 번째 insert 수행
            result = dao.insertProductImg(pro_idx, store.getDetailImg());

            // 두 번째 insert도 성공해야 전체 트랜잭션이 커밋됨
            if (result > 0) {
                return store; // 성공적으로 두 작업 수행
            }
        }

        // 실패 시 예외를 발생시켜 트랜잭션 롤백
        throw new RuntimeException("저장 실패: 모든 작업을 완료하지 못했습니다.");
    }

    @Override
    public List<MasterVO> getFAQList() {
        return dao.getFAQList();
    }

    @Override
    public List<MasterVO> getStoreList() {
        return dao.getStoreList();
    }

    @Override
    public int getTotalStore() {
        return dao.getTotalStore();
    }

    @Override
    public Map<String, Object> getCategoryCountByCode(int categoryCode) {
        return dao.getCategoryCountByCode(categoryCode);
    }

    @Override
    public List<MasterVO> getBoardList() {
        return dao.getBoardList();
    }

    @Override
    public Integer getAdminIdxByAdminid(String adminid) {
        return dao.getAdminIdxByAdminid(adminid);
    }

    @Override
    public List<MasterVO> getAniAllList() {
        return dao.getAniAllList();
    }

    @Override
    public List<MasterVO> getNoticeList() {
        return dao.getNoticeList();
    }

    @Override
    public List<MasterVO> getReviewList() {
        return dao.getReviewList();
    }

    @Override
    public void addReport(String userid, String reason, LocalDateTime stopDT, LocalDateTime endDT) {
        dao.insertReport(userid, reason, stopDT, endDT);
    }
    @Override
    public boolean checkUserBanStatus(String userid) {
        return dao.isUserBanned(userid);
    }

    @Override
    public boolean checkUserDelected(int idx) {
        return dao.isUserDeleted(idx);
    }

    @Override
    public Integer findUserIdxByUserid(String userid) {
        return dao.findUserIdxByUserid(userid);
    }

    @Override
    public List<MasterVO> getMemberDelList(MasterVO vo) {
        return dao.getMemberDelList(vo);
    }

    @Override
    public List<MasterVO> getReportinguserList(MasterVO vo) {
        return dao.getReportinguserList(vo);
    }

    @Override
    public void updateReportAndBan(int idx,String userid, String reason, LocalDateTime stopDT, LocalDateTime handleDT, LocalDateTime endDT, int handleState) {
        dao.updateReport(idx,userid, reason, LocalDateTime.now(),handleDT, handleState);
        dao.insertReport(userid, reason, stopDT, endDT);
    }

    @Override
    public List<MasterVO> getReplyList(MasterVO vo) {
        return dao.getReplyList(vo);
    }

    @Override
    public MasterVO getReviewDetail(int idx) {
        return dao.getReviewDetail(idx);
    }

    @Override
    public boolean updateAnimation(MasterVO vo) {
        int result = dao.updateAnimation(vo);
        return result > 0;
    }

    @Override
    public MasterVO aniSelect(int idx) {
        return dao.aniSelect(idx);
    }

    @Override
    public String getCurrentImgFile(int idx) {
        return dao.getCurrentImgFile(idx);
    }

    @Override
    public List<MasterVO> getQNAList() {
        return dao.getQNAList();
    }

    @Override
    public int getUnansweredQnaCount() {
        return dao.getUnansweredQnaCount();
    }

    @Override
    public List<MasterVO> getReportingUser() {
        return dao.getReportingUser();
    }

    @Override
    public int getTotalReportCount() {
        return dao.getTotalReportCount();
    }

    @Override
    public int getTotalUserReport(int useridx) {
        return dao.getTotalUserReport(useridx);
    }

    @Override
    public void updateQnaAndReply(int idx, String reply, int adminIdx) {
        dao.updateHandleState(idx);
        dao.insertReply(idx, reply, adminIdx, LocalDateTime.now());
    }

    @Override
    public Integer findAdminIdxByUserid(String adminId) {
        return dao.findAdminIdxByUserid(adminId);
    }

    @Override
    public void addAnimation(MasterVO aniVO) {
        dao.insertAnimation(aniVO);
    }

    @Override
    public void deletePostByIdx(int idx) {
        dao.deletePostByIdx(idx);
    }

    @Override
    public MasterVO getStoreByIdx(int idx) {
        return dao.getStoreByIdx(idx);
    }

    @Override
    public boolean updateStore(MasterVO store) {
        int result = dao.updateStore(store);
        return result > 0;
    }

    @Override
    public List<MasterVO> getSubCategoriesByCategory(int category) {
        return dao.findSubCategoriesByCategory(category);
    }

    @Override
    public boolean insertProductImg(int pro_idx,String detailImg) {
        return dao.insertProductImg(pro_idx, detailImg) > 0;
    }


    @Override
    public MasterVO getNoticeById(int idx) {
        return dao.getNoticeById(idx);
    }

    @Override
    public boolean updateNotice(MasterVO noticeEdit) {
        return dao.updateNotice(noticeEdit) > 0;
    }

    @Override
    public MasterVO noticeSelect(int idx) {
        return dao.noticeSelect(idx);
    }

    @Override
    public MasterVO getQnaById(int idx) {
        return dao.getQnaReplyById(idx);
    }

    @Override
    public boolean validateAdmin(String adminid, String adminpwd) {
        MasterVO admin = dao.getAdminByAdminId(adminid);

        if (admin != null) {
            log.info("Database password (hashed): " + admin.getAdminpwd()); // 해시된 비밀번호 로그
            log.info("User input password (plain): " + adminpwd); // 사용자가 입력한 비밀번호 로그

            try {
                // 비밀번호 비교
                boolean matches = passwordEncoder.matches(adminpwd, admin.getAdminpwd());
                log.info("Password match result: " + matches);
                return matches; // 비밀번호가 일치하는지 반환
            } catch (Exception e) {
                log.error("Error occurred during password comparison", e);
                throw new RuntimeException("Password comparison failed");
            }
        } else {
            log.info("Admin not found with id: " + adminid);
            return false;
        }
    }
}
