package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface StoreDAO {
    public StoreVO storeContent(StoreVO vo);

}
