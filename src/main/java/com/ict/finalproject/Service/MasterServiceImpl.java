package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.MasterDAO;
import com.ict.finalproject.vo.MasterVO;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class MasterServiceImpl implements MasterService {
    @Autowired
    MasterDAO dao;

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
        int result = dao.insertStore(store);
        return result > 0 ? store : null;
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
}
