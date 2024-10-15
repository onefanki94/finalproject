package com.ict.finalproject.Service;

import com.ict.finalproject.vo.MasterVO;
import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public interface MasterService {
    MasterVO createNotice(MasterVO notice);
    MasterVO createFAQ(MasterVO faq);
    MasterVO createStore(MasterVO store);
    public List<MasterVO> getFAQList();
    public List<MasterVO> getStoreList();
     int getTotalStore();
    Map<String, Object> getCategoryCountByCode(@Param("categoryCode") int categoryCode);
    List<MasterVO> getBoardList();
    Integer getAdminIdxByAdminid(String adminid);
    public List<MasterVO> getAniAllList();
    List<MasterVO> getNoticeList();
    List<MasterVO> getReviewList();
    void addReport(String userid, String reason, LocalDateTime stopDT, LocalDateTime endDT);
    boolean checkUserBanStatus(String userid);
    boolean checkUserDelected(int idx);
    Integer findUserIdxByUserid(String userid);
    List<MasterVO> getMemberDelList(MasterVO vo);
}
