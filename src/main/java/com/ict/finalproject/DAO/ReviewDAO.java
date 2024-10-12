package com.ict.finalproject.DAO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ict.finalproject.vo.ReviewVO;
import java.util.List;


@Mapper
public interface ReviewDAO {
        // 제품별 리뷰 리스트를 가져오는 메서드
    List<ReviewVO> getReviewsByProductId(@Param("idx") int idx);

    // 제품별 평균 별점을 가져오는 메서드
    double getAverageRatingByProductId(@Param("idx") int idx);


}
