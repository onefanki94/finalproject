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

        String token = authorizationHeader.substring(7);  // "Bearer " 부분을 제거한 JWT 토큰
        Claims claims;
        try {
            claims = jwtUtil.getClaims(token);
            System.out.println("JWT Claims: " + claims);
        } catch (Exception e) {
            System.err.println("JWT 토큰 오류: " + e.getMessage());
            response.put("success", false);
            response.put("message", "유효하지 않은 토큰입니다.");
            return response;
        }

        String userid = claims.getSubject();
        System.out.println("JWT에서 추출한 userid: " + userid);
        if (userid == null) {
            response.put("success", false);
            response.put("message", "유효한 사용자 정보가 없습니다.");
            return response;
        }

        // useridx 조회
        Integer useridx = masterService.findUserIdxByUserid(userid);
        System.out.println("데이터베이스에서 조회한 useridx: " + useridx);
        if (useridx == null) {
            response.put("success", false);
            response.put("message", "유효한 사용자 정보가 없습니다.");
            return response;
        }

        // 좋아요 상태 확인 및 토글
        proLikeVO.setUseridx(useridx);  // JWT에서 추출한 useridx를 ProLikeVO에 설정
        boolean liked = ProlikeService.isLiked(proLikeVO.getPro_idx(), useridx);

        if (liked) {
            ProlikeService.removeLike(proLikeVO);  // 좋아요 취소
            response.put("success", true);
            response.put("message", "좋아요 취소됨");
            response.put("liked", false);  // 현재 상태 반환
            response.put("currentLikeCount", ProlikeService.getLikeCount(proLikeVO.getPro_idx()));  // 좋아요 수 반환
        } else {
            ProlikeService.addLike(proLikeVO);  // 좋아요 추가
            response.put("success", true);
            response.put("message", "좋아요 추가됨");
            response.put("liked", true);  // 현재 상태 반환
            response.put("currentLikeCount", ProlikeService.getLikeCount(proLikeVO.getPro_idx()));  // 좋아요 수 반환
        }

        return response;
    }







    @GetMapping("/statusAndCount")
    @ResponseBody
    public Map<String, Object> getLikeStatusAndCount(@RequestParam("pro_idx") int pro_idx, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        System.out.println("test print line 105");
        String authorizationHeader = request.getHeader("Authorization");
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }
        System.out.println("test print line 112");
        String token = authorizationHeader.substring(7);
        Claims claims;
        try {
            claims = jwtUtil.getClaims(token);
            System.out.println("JWT Claims: " + claims);
        } catch (Exception e) {
            System.err.println("JWT 토큰 오류: " + e.getMessage());
            response.put("success", false);
            response.put("message", "유효하지 않은 토큰입니다.");
            return response;
        }

        String userid = claims.getSubject();
        System.out.println("JWT에서 추출한 userid: " + userid);
        if (userid == null) {
            response.put("success", false);
            response.put("message", "유효한 사용자 정보가 없습니다.");
            return response;
        }

        Integer useridx = masterService.findUserIdxByUserid(userid);
        if (useridx == null) {
            System.err.println("해당 userid로 사용자를 찾을 수 없습니다: " + userid);
            response.put("success", false);
            response.put("message", "유효한 사용자 정보가 없습니다.");
            return response;
        }
        System.out.println("test print line 140");
        boolean liked = ProlikeService.isLiked(pro_idx, useridx);
        System.out.println("test liked: " + (liked ? "true" : "false"));
        int likeCount = ProlikeService.getLikeCount(pro_idx);

        // 반환할 데이터 로그로 출력
        System.out.println("좋아요 상태: " + liked);
        System.out.println("좋아요 수: " + likeCount);

        response.put("success", true);
        response.put("liked", liked);
        response.put("likeCount", likeCount);

        return response;
    }
}
