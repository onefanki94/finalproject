package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.AniListService;
import com.ict.finalproject.vo.AniListVO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.net.URI;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Slf4j
@Controller
public class aniListController {

    @Autowired
    private AniListService aniListService;

    @Autowired
    private JWTUtil jwtUtil;

    // 애니메이션 목록 조회
    @GetMapping("/aniList")
    public String getAniList(Model model) {
        List<AniListVO> aniAllList = aniListService.getAniList();
        model.addAttribute("aniAllList", aniAllList);
//        log.info(aniAllList.toString());

        return "ani/aniList"; // JSP 파일 이름
    }
    // 애니메이션 선택 조회
    @GetMapping("/aniListSelect")
    public String getAniListSelect(Model model) {
        List<AniListVO> aniListSelect = aniListService.getAniListSelect();
        model.addAttribute("aniListSelect", aniListSelect);
        return "aniListSelect"; // JSP 파일 이름
    }

    // 애니메이션 상세 조회
    @GetMapping("/aniDetail")
    @ResponseBody
    public ResponseEntity<AniListVO> getAniDetailView(@RequestParam String title) {
        System.out.println("aniListController test title: " + title);
        AniListVO aniDetail = aniListService.getAniDetailView(title);



        if (aniDetail != null) {
            // 조회수 증가 (필요한 경우 주석을 해제하세요)
            // aniListService.incrementAniHit(title);
            return ResponseEntity.ok(aniDetail); // 객체를 JSON으로 반환
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); // 애니메이션이 없을 경우 404 상태 반환
        }


    }


    // 장르별 애니메이션 목록 조회
    @GetMapping("/aniListByGenre")
    public String getAniListByGenre(@RequestParam int anitype, Model model) {
        List<AniListVO> aniListByGenre = aniListService.getAniListByGenre(anitype);
        model.addAttribute("aniListByGenre", aniListByGenre);
        return "ani/aniList"; // JSP 파일 이름
    }

    // 정렬된 애니메이션 목록 조회
    @GetMapping("/sort")
    public ResponseEntity<List<AniListVO>> sortAniList(@RequestParam String sort) {
        List<AniListVO> sortedList = aniListService.getSortedAniList(sort);
        return ResponseEntity.ok(sortedList); // 정렬된 애니메이션 목록 반환
    }

    // 별점 추가
      @PostMapping("/addGrade")
public ResponseEntity<Map<String, Object>> addGrade(
        @RequestBody AniListVO gradeRequest,
        @RequestHeader("Authorization") String headertoken) {
    Map<String, Object> response = new HashMap<>();
    HttpHeaders headers = new HttpHeaders();

    // Authorization 헤더 확인
    if (headertoken == null || !headertoken.startsWith("Bearer ")) {
        response.put("error", "Authorization 헤더가 없거나 잘못되었습니다.");
        headers.setLocation(URI.create("/user/login")); // 리다이렉션 경로 설정
        return ResponseEntity.status(HttpStatus.SEE_OTHER).headers(headers).body(response);
    }

    // 토큰 값에서 'Bearer ' 문자열 제거
    String token = headertoken.substring(7);

    if (token.isEmpty()) {
        response.put("error", "JWT 토큰이 비어 있습니다.");
        headers.setLocation(URI.create("/user/login"));
        return ResponseEntity.status(HttpStatus.SEE_OTHER).headers(headers).body(response);
    }

    String userid;
    try {
        userid = jwtUtil.getUserIdFromToken(token); // 토큰에서 사용자 ID 추출
    } catch (Exception e) {
        e.printStackTrace();
        response.put("error", "JWT 토큰 파싱 중 오류가 발생했습니다: " + e.getMessage());
        headers.setLocation(URI.create("/user/login"));
        return ResponseEntity.status(HttpStatus.SEE_OTHER).headers(headers).body(response);
    }

    if (userid == null || userid.isEmpty()) {
        response.put("error", "유효하지 않은 JWT 토큰입니다.");
        headers.setLocation(URI.create("/user/login"));
        return ResponseEntity.status(HttpStatus.SEE_OTHER).headers(headers).body(response);
    }

    // userid로 useridx 구하기
    Integer useridx = aniListService.getUseridx(userid);
    if (useridx == null) {
        response.put("error", "사용자 ID에 해당하는 인덱스를 찾을 수 없습니다.");
        headers.setLocation(URI.create("/user/login"));
        return ResponseEntity.status(HttpStatus.SEE_OTHER).headers(headers).body(response);
    }

    // 별점 등록 로직
    if (gradeRequest.getAni_idx() == null) {
        response.put("error", "애니메이션 인덱스가 제공되지 않았습니다.");
        return ResponseEntity.badRequest().body(response);
    }

    if (gradeRequest.getGrade() < 1 || gradeRequest.getGrade() > 5) {
        response.put("error", "유효하지 않은 등급입니다. 1에서 5 사이의 값이어야 합니다.");
        return ResponseEntity.badRequest().body(response);
    }

    // 별점 추가 서비스 호출
    aniListService.addGrade(gradeRequest.getAni_idx(), gradeRequest.getGrade(), useridx);

    response.put("message", "별점이 등록되었습니다.");
    return ResponseEntity.ok(response);
}




}