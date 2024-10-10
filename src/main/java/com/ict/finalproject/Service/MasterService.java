package com.ict.finalproject.Service;

import com.ict.finalproject.vo.MasterVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MasterService {
    int createNotice(MasterVO masterNotice);
    public List<MasterVO> getStoreList();
     int getTotalStore();
    Map<String, Object> getCategoryCountByCode(@Param("categoryCode") int categoryCode);
    List<MasterVO> getBoardList();
}
