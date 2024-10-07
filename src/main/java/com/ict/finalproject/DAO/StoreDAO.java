package com.ict.finalproject.DAO;

import java.util.List;

import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StoreDAO {
    public List<StoreVO> getStoreList();
}
