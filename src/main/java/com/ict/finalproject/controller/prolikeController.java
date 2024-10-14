package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MasterService;
import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
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
    @ResponseBody
    public Map<String, Object> toggleLike(@RequestBody ProLikeVO proLikeVO, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();

        // 헤더에서 Authorization 토큰 추출
        String authorizationHeader = request.getHeader("Authorization");
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        // JWT 토큰에서 userid 추출
        String token = authorizationHeader.substring(7);  // "Bearer " 부분을 제거한 JWT 토큰
        Claims claims;
        try {
            // JWTUtil을 사용하여 토큰에서 Claims를 추출
            claims = jwtUtil.getClaims(token);
            System.out.println("Extracted Claims from token: " + claims);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "유효하지 않은 토큰입니다.");
            return response;
        }

        // claims에서 userid를 추출하는 로직 (userid는 claims 내에 별도의 필드로 저장됨)
        String userid = claims.get("userid", String.class);  // "userid"라는 키로 값을 가져옴
        System.out.println("Extracted userid from token: " + userid);

        if (userid == null) {
            response.put("success", false);
            response.put("message", "유효한 사용자 정보가 없습니다.");
            return response;
        }

        // useridx 조회 (userid를 통해 useridx를 찾음)
        Integer useridx = masterService.findUserIdxByUserid(userid);
        if (useridx == null) {
            response.put("success", false);
            response.put("message", "유효한 사용자 정보가 없습니다.");
            return response;
        }

        // 좋아요 상태 확인 및 토글
        boolean liked = ProlikeService.isLiked(proLikeVO.getPro_idx(), useridx);
        if (liked) {
            // 이미 좋아요한 상태라면 좋아요 취소
            ProlikeService.removeLike(new ProLikeVO(proLikeVO.getPro_idx(), useridx));
            response.put("success", true);
            response.put("message", "좋아요 취소됨");
        } else {
            // 좋아요 추가
            ProlikeService.addLike(new ProLikeVO(proLikeVO.getPro_idx(), useridx));
            response.put("success", true);
            response.put("message", "좋아요 추가됨");
        }

        return response;
    }


    @GetMapping("/status")
    @ResponseBody
    public Map<String, Object> checkLikeStatus(@RequestParam("pro_idx") int pro_idx, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();

        // 헤더에서 Authorization 토큰 추출
        String authorizationHeader = request.getHeader("Authorization");
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        // JWT 토큰에서 userid 추출
        String token = authorizationHeader.substring(7);  // "Bearer " 부분을 제거한 JWT 토큰
        Claims claims;
        try {
            claims = jwtUtil.getClaims(token);  // JWTUtil을 사용하여 토큰에서 Claims를 추출
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "유효하지 않은 토큰입니다.");
            return response;
        }

        // JWT에서 userid 추출
        String userid = claims.getSubject();

        // 1. useridx 조회
        Integer useridx = masterService.findUserIdxByUserid(userid);
        if (useridx == null) {
            response.put("success", false);
            response.put("message", "유효한 사용자 정보가 없습니다.");
            return response;
        }

        // 2. 좋아요 상태 확인
        boolean liked = ProlikeService.isLiked(pro_idx, useridx);

        response.put("success", true);
        response.put("liked", liked);
        return response;
    }









}
