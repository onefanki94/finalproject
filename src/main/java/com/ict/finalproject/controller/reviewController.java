package com.ict.finalproject.controller;

import com.ict.finalproject.Service.ReviewService;
import com.ict.finalproject.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class reviewController {
    
       @Autowired
    private ReviewService reviewService;

      @GetMapping("/product/{idx}/reviews")
    public ModelAndView getProductReviews(@PathVariable("idx") int productId) {
        // 리뷰 리스트 가져오기
        List<ReviewVO> reviews = reviewService.getReviewsByProductId(productId);
        // 평균 별점 가져오기
        double averageRating = reviewService.getAverageRatingByProductId(productId);

        // ModelAndView 객체 생성
        ModelAndView mav = new ModelAndView();
        // 모델에 데이터 추가
        mav.addObject("reviews", reviews);
        mav.addObject("averageRating", averageRating);

        // 반환할 JSP 경로 설정
        mav.setViewName("product/reviewList"); // 리뷰를 보여줄 JSP 페이지

        return mav;
    }
}
