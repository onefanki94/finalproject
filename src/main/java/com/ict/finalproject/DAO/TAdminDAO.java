package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.MasterVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TAdminDAO {
    boolean existsByAdminId(String adminid);
    Integer findIdxByAdminId(@Param("adminid") String adminid);
    MasterVO getAdminByAdminId(@Param("adminid") String adminid);
}
