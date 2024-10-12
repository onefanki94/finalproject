package com.ict.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Map;
import java.util.HashMap;

import com.ict.finalproject.Service.ProlikeService;
import com.ict.finalproject.vo.ProLikeVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/like")
public class prolikeController {
   
    @Autowired
ProlikeService ProlikeService; 

 @PostMapping("/toggle")
@ResponseBody  // JSON 응답을 반환
public Map<String, Object> toggleLike(@RequestBody ProLikeVO proLikeVO, HttpSession session) {
    Map<String, Object> response = new HashMap<>();
    
    Integer useridx = (Integer) session.getAttribute("useridx");  // 세션에서 사용자 ID 가져오기
    if (useridx == null) {
        response.put("success", false);
        response.put("message", "로그인이 필요합니다.");
        return response;
    }

    boolean liked = ProlikeService.isLiked(proLikeVO.getPro_idx(), useridx);

    if (liked) {
        ProlikeService.removeLike(new ProLikeVO(proLikeVO.getPro_idx(), useridx));  // 좋아요 취소
        response.put("success", true);
        response.put("message", "좋아요 취소됨");
    } else {
        ProlikeService.addLike(new ProLikeVO(proLikeVO.getPro_idx(), useridx));  // 좋아요 추가
        response.put("success", true);
        response.put("message", "좋아요 추가됨");
    }

    return response;
}

    @GetMapping("/status")
    public boolean checkLikeStatus(@RequestParam("pro_idx") int pro_idx, HttpSession session) {
        Integer useridx = (Integer) session.getAttribute("useridx");  // 세션에서 사용자 ID 가져오기
        if (useridx == null) {
            return false;  // 로그인하지 않은 경우 좋아요 없음
        }
        return ProlikeService.isLiked(pro_idx, useridx);  // 좋아요 상태 반환
    }






}
