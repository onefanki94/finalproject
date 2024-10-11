package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.MasterVO;
import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MasterDAO {
    // 공지사항 추가 DAO
    int  insertNotice(MasterVO masterNotice);

    // 굿즈 상품테이블 리스트 전체 출력
    public List<MasterVO> getStoreList();

    // 굿즈 상품테이블 총 상품수 구하기
    int getTotalStore();

    // 굿즈 상품테이블 카테고리별 카운트 구하기
    Map<String, Object> getCategoryCountByCode(@Param("categoryCode") int categoryCode);

    // 커뮤니티 작성된 모든 게시글 불러오기
    List<MasterVO> getBoardList();

    // adminid를 통해 adminidx 가져오기
    Integer getAdminIdxByAdminid(String adminid);

    // 공지사항 삽입
    void addNotice(MasterVO notice);
}
