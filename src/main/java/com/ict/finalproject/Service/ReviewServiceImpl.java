package com.ict.finalproject.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.finalproject.DAO.ReviewDAO;
import com.ict.finalproject.vo.ReviewVO;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    
     @Autowired
     ReviewDAO dao;

    @Override
    public List<ReviewVO> getReviewsByProductId(int productId) {
        return dao.getReviewsByProductId(productId);
    }

    @Override
    public double getAverageRatingByProductId(int productId) {
        return dao.getAverageRatingByProductId(productId);
    }

}
