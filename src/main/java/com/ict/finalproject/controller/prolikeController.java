package com.ict.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.ict.finalproject.Service.ProlikeService;
import com.ict.finalproject.vo.ProLikeVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/like")
public class prolikeController {
   
    @Autowired
ProlikeService ProlikeService; 

 @PostMapping("/toggle")
    public String toggleLike(@RequestBody ProLikeVO proLikeVO, HttpSession session) {
        Integer userIdx = (Integer) session.getAttribute("userIdx");  // 세션에서 사용자 ID 가져오기
        if (userIdx == null) {
            return "로그인이 필요합니다.";
        }

        boolean liked = ProlikeService.isLiked(proLikeVO.getPro_idx(), userIdx);

        if (liked) {
            ProlikeService.removeLike(new ProLikeVO(proLikeVO.getPro_idx(), userIdx));  // 좋아요 취소
            return "좋아요 취소됨";
        } else {
            ProlikeService.addLike(new ProLikeVO(proLikeVO.getPro_idx(), userIdx));  // 좋아요 추가
            return "좋아요 추가됨";
        }
    }

    @GetMapping("/status")
    public boolean checkLikeStatus(@RequestParam("pro_idx") int pro_idx, HttpSession session) {
        Integer userIdx = (Integer) session.getAttribute("userIdx");  // 세션에서 사용자 ID 가져오기
        if (userIdx == null) {
            return false;  // 로그인하지 않은 경우 좋아요 없음
        }
        return ProlikeService.isLiked(pro_idx, userIdx);  // 좋아요 상태 반환
    }






}
