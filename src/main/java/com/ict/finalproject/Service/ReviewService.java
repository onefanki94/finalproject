package com.ict.finalproject.Service;

import com.ict.finalproject.vo.ReviewVO;
import java.util.List;


import org.springframework.stereotype.Service;

@Service
public interface ReviewService {
    public List<ReviewVO> getReviewsByProductId(int productId);

    public double getAverageRatingByProductId(int productId);
}