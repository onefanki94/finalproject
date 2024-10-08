package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoreDAO {
    public List<StoreVO> getStoreList();
}
