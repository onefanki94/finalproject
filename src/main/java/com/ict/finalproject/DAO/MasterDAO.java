package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.MasterVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MasterDAO {
    // 공지사항 추가 DAO
    int createNotice(MasterVO vo);
}
