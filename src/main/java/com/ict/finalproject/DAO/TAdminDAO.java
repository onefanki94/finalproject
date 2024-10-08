package com.ict.finalproject.DAO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TAdminDAO {
    boolean existsById(String userId);
}
