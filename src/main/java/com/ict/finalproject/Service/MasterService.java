package com.ict.finalproject.Service;

import com.ict.finalproject.vo.MasterVO;

import java.util.List;

public interface MasterService {
    int createNotice(MasterVO vo);
    public List<MasterVO> getStoreList();
}
