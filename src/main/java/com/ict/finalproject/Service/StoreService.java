package com.ict.finalproject.Service;

import com.ict.finalproject.vo.StoreVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StoreService {
    public List<StoreVO> getStoreList();
}
