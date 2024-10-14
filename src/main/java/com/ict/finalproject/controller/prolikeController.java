package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.HashMap;

import com.ict.finalproject.Service.ProlikeService;
import com.ict.finalproject.vo.ProLikeVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/like")
public class prolikeController {

    @Autowired
    JWTUtil jwtUtil;

    @Autowired
    MasterService masterService;
    @Autowired
ProlikeService ProlikeService;

    @PostMapping("/toggle")
    @ResponseBody  // JSON 응답을 반환
    public Map<String, Object> toggleLike(@RequestBody ProLikeVO proLikeVO, @RequestHeader("Authorization") String authorizationHeader) {
        Map<String, Object> response = new HashMap<>();

        // Authorization 헤더에서 토큰 추출
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            response.put("success", false);
            response.put("message", "토큰이 없습니다.");
            return response;
        }

        String token = authorizationHeader.substring(7); // 'Bearer ' 부분을 제거한 JWT 토큰
        String userid;

        try {
            // JWT 토큰에서 userid 추출
            userid = jwtUtil.extractUserid(token);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "유효하지 않은 토큰입니다.");
            return response;
        }

        // 해당 유저의 useridx를 DB에서 찾음
        Integer useridx = masterService.findUserIdxByUserid(userid);
        if (useridx == null) {
            response.put("success", false);
            response.put("message", "유효하지 않은 사용자입니다.");
            return response;
        }

        // 좋아요 상태 확인
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
