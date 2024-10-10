package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.MasterVO;
import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MasterDAO {
    // 공지사항 추가 DAO
    int createNotice(MasterVO vo);

    // 굿즈 상품테이블 리스트 전체 출력
    public List<MasterVO> getStoreList();
}
