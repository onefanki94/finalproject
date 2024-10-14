package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface HomeDAO {
    List<StoreVO> getGoodsList();
}
