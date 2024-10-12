package com.ict.finalproject.controller;


import com.ict.finalproject.DAO.TAdminDAO;
import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MasterService;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.Service.TAdminService;
import com.ict.finalproject.vo.MasterVO;
import com.ict.finalproject.vo.MemberVO;
import com.ict.finalproject.vo.StoreVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/master")
public class masterController {

        @Autowired
        TAdminService tAdminService;
        @Autowired
        MemberService service;
        @Autowired
        MasterService masterService;
        @Autowired
        JWTUtil jwtUtil;
        @Autowired
        TAdminDAO dao;
        ModelAndView mav = null;
        /*TAdminService tAdminService;


    @Autowired
        public masterController(TAdminService tAdminService, JWTUtil jwtUtil) {
        this.tAdminService = tAdminService;
        this.jwtUtil = jwtUtil;
    }*/

        // t_admin에  admin아이디 있는지 체크 하는 API
        /*@GetMapping("/checkAdmin")
        public ResponseEntity<Boolean> checkAdmin(@RequestHeader("Authorization") String authHeader) {
            // Authorization 헤더 확인
            if (authHeader == null || !authHeader.startsWith("Bearer ")) {
                System.out.println("Authorization 헤더가 없거나 형식이 잘못되었습니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false);
            }

            String token = authHeader.substring(7);  // 'Bearer ' 제거

            // JWT 토큰 유효성 검사
            if (!jwtUtil.validateToken(token)) {
                System.out.println("JWT 토큰이 유효하지 않습니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false);
            }

            // 토큰에서 사용자 ID 추출
            String userId = jwtUtil.getUserIdFromToken(token);
            System.out.println("JWT 토큰에서 추출한 사용자 ID: " + userId);  // 추출된 ID 출력

            // t_admin 테이블의 "admin" 아이디만 접근 허용
            boolean isAdmin = tAdminService.existsByAdminId(userId);
            System.out.println("t_admin 테이블에 " + userId + " 존재 여부: " + isAdmin);

            return ResponseEntity.ok(isAdmin);  // 관리자 여부를 반환
        }*/

        // 관리자페이지 로그인 매핑
        @GetMapping("/admin_login")
        public String adminLogin(){
            return "join/admin_login";
        }


        // Dashboard 매핑
        @GetMapping("/masterMain")
        public ModelAndView masterMain() {
            System.out.println("hey! 모두들 안녕 내가 누군지 아니?");
            mav = new ModelAndView();
            mav.setViewName("master/masterMain");  // 뷰 이름 설정
            return mav;  // 중복 리다이렉트 발생 여부 확인
        }

        //Dashboard - 회원관리 - 회원 목록 리스트
        @GetMapping("/userMasterList")
        public ModelAndView masterUserList(MemberVO vo){

            // 유저 List 가져오기
            List<MemberVO> memberList = service.getMemberList(vo);

            // 총 유저수 구하기
            int totalUser = service.getTotalUser();

            // 오늘 가입자 수 구하기
            int newUsers = service.getNewUsers();

            // 최근 7일간 가입자 수 구하기
            int newSignups = service.getNewSignups();

            mav = new ModelAndView();
            mav.addObject("memberList", memberList);
            mav.addObject("totalUser", totalUser);
            mav.addObject("newUsers", newUsers);
            mav.addObject("newSignups", newSignups);
            mav.setViewName("master/userMasterList");
            return mav;
        }

        // Dashboard - 애니관리 -  애니목록 리스트
        @GetMapping("/aniMasterList")
        public ModelAndView masterAniList(){
            System.out.println("관리자페이지 애니 리스트 불러오기");

            List<MasterVO> aniList = masterService.getAniAllList();

            mav = new ModelAndView();
            mav.addObject("aniList", aniList);
            mav.setViewName("master/aniMasterList");
            return mav;
        }


        // Dashboard - 회원관리 - 신고계정목록 리스트
        @GetMapping("/reporinguserMasterList")
        public ModelAndView masterReportList(){
            mav = new ModelAndView();
            mav.setViewName("master/reportinguserMasterList");
            return mav;
        }

    // Dashboard - 회원관리 - 신고계정목록 리스트
    @GetMapping("/reportinguserMasterList")
    public ModelAndView masterListReport(){
        mav = new ModelAndView();
        mav.setViewName("master/reportinguserMasterList");
        return mav;
    }

        // Dashboard - 애니관리 - 애니 목록 - 애니 추가
        @GetMapping("/aniAddMaster")
        public ModelAndView aniAddMaster(){
            mav = new ModelAndView();
            mav.setViewName("master/aniAddMaster");
            return mav;
        }

    // Dashboard - 애니관리 - 애니 목록 - 애니 수정
    @GetMapping("/aniEditMaster")
    public ModelAndView aniEditMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/aniEditMaster");
        return mav;
    }

        // Dashboard - 굿즈관리 - 굿즈목록 리스트
        @GetMapping("/storeMasterList")
        public ModelAndView storeMasterList(){
            System.out.println("관리자페이지 굿즈 상품 테이블 불러오기");
            List<MasterVO> storeList = masterService.getStoreList();

            // 총 상품 수 구하기
            int totalStore = masterService.getTotalStore();

            Map<String, Object> categoryCode1Count = masterService.getCategoryCountByCode(1); // 의류
            Map<String, Object> categoryCode2Count = masterService.getCategoryCountByCode(2); // 완구/취미
            Map<String, Object> categoryCode3Count = masterService.getCategoryCountByCode(3); // 문구/오피스
            Map<String, Object> categoryCode4Count = masterService.getCategoryCountByCode(4); // 생활용품

            System.out.println(storeList);
            mav = new ModelAndView();
            mav.addObject("storeList", storeList);
            mav.addObject("totalStore", totalStore);
            mav.addObject("categoryCode1Count", categoryCode1Count.get("product_category"));
            mav.addObject("categoryCode2Count", categoryCode2Count.get("product_category"));
            mav.addObject("categoryCode3Count", categoryCode3Count.get("product_category"));
            mav.addObject("categoryCode4Count", categoryCode4Count.get("product_category"));
            mav.setViewName("master/storeMasterList");
            return mav;
        }

        // Dashboard - 주문관리 - 주문내역 리스트
        @GetMapping("/orderMasterList")
        public ModelAndView orderMasterList(){
            mav = new ModelAndView();
            mav.setViewName("master/orderMasterList");
            return mav;
        }

        // Dashboard - 신고관리 - 신고목록 리스트
        @GetMapping("/reportinguserListMaster")
        public ModelAndView reportinguserListMaster(){
            mav = new ModelAndView();
            mav.setViewName("master/reportinguserListMaster");
            return mav;
        }

        //  Dashboard - 게시판, 댓글, 리뷰 - 게시판 전체 목록
        @GetMapping("/boardMasterAll")
        public ModelAndView boardMasterAll(){
            // 커뮤니티 전체 글 목록 불러오기
            System.out.println("관리자페이지에서 커뮤니티 테이블 전체 글 목록 불러오기");
            List<MasterVO> boardList = masterService.getBoardList();
            mav = new ModelAndView();
            mav.addObject("boardList", boardList);
            mav.setViewName("master/boardMasterAll");
            return mav;
        }

    //  Dashboard - 게시판, 댓글, 리뷰 - 리뷰 전체 목록
    @GetMapping("/boardMasterReviewAll")
    public ModelAndView boardMasterReviewAll(){
        mav = new ModelAndView();
        mav.setViewName("master/boardMasterReviewAll");
        return mav;
    }

    //  Dashboard - 게시판, 댓글, 리뷰 - 리뷰 전체 목록
    @GetMapping("/boardMasterReplyAll")
    public ModelAndView boardMasterReplyAll(){
        mav = new ModelAndView();
        mav.setViewName("master/boardMasterReplyAll");
        return mav;
    }

    //  Dashboard - 기타관리 - 공지사항 목록
    @GetMapping("/noticeMasterList")
    public ModelAndView noticeMasterList(){
        mav = new ModelAndView();
        mav.setViewName("master/noticeMasterList");
        return mav;
    }
    //  Dashboard - 기타관리 - 공지사항 - 추가
    @GetMapping("/noticeAddMaster")
    public ModelAndView noticeAddMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/noticeAddMaster");
        return mav;
    }

    @PostMapping("/noticeAddMasterOk")
    public ResponseEntity<String> noticeAddMasterOk(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam(value = "Authorization", required = false) String authorization) {

        String bodyTag = "";
        String token = null;

        // Authorization 헤더에서 JWT 토큰 추출
        if (authorization != null && authorization.startsWith("Bearer ")) {
            token = authorization.substring(7);
            log.info("Authorization 헤더에서 추출한 토큰 값: " + token);
        } else {
            log.info("Authorization 헤더가 없거나 잘못된 형식입니다.");
            bodyTag += "<script>alert('인증 정보가 없습니다. 다시 로그인해 주세요.');history.back();</script>";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
            return new ResponseEntity<>(bodyTag, headers, HttpStatus.UNAUTHORIZED);
        }

        // JWT 토큰에서 adminid 추출 (JWT 파싱 로직 필요)
        Integer adminid = Integer.valueOf(jwtUtil.getAdminIdFromToken(token));  // 토큰에서 adminid 추출
        if (adminid == null) {
            bodyTag += "<script>alert('잘못된 인증 정보입니다. 다시 로그인해 주세요.');history.back();</script>";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
            return new ResponseEntity<>(bodyTag, headers, HttpStatus.UNAUTHORIZED);
        }

        log.info("JWT 토큰에서 추출한 adminid 값: " + adminid);

        // adminid를 통해 adminidx 가져오기
        Integer adminidx = masterService.getAdminIdxByAdminid(String.valueOf(adminid));
        if (adminidx == null) {
            bodyTag += "<script>alert('관리자 정보를 찾을 수 없습니다.');history.back();</script>";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
            return new ResponseEntity<>(bodyTag, headers, HttpStatus.UNAUTHORIZED);
        }

        log.info("관리자 idx(adminidx): " + adminidx);

        // 공지사항 등록 로직 (예: 데이터베이스에 공지사항 저장)
        MasterVO notice = new MasterVO();
        notice.setTitle(title);
        notice.setContent(content);
        notice.setAdminidx(adminidx);  // adminidx 설정

        // 공지사항을 데이터베이스에 삽입
        masterService.addNotice(notice);
        log.info("공지사항 등록 제목: " + title);
        log.info("공지사항 내용: " + content);

        bodyTag += "<script>alert('공지사항이 성공적으로 등록되었습니다.');location.href='/master/noticeMasterList';</script>";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

        return new ResponseEntity<>(bodyTag, headers, HttpStatus.OK);
    }


    //  Dashboard - 기타관리 - 공지사항 - 수정
    @GetMapping("/noticeEditMaster")
    public ModelAndView noticeEditMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/noticeEditMaster");
        return mav;
    }

    //  Dashboard - 매출관리 - 일/월별 매출관리
    @GetMapping("/orderSalesMaster")
    public ModelAndView orderSalesMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/orderSalesMaster");
        return mav;
    }

    // Dashboard - 매출관리 - 일/월별 매출관리 - 상세보기
    @GetMapping("/orderSalesDetailMaster")
    public ModelAndView orderSalesDetailMaster(){
            mav = new ModelAndView();
            mav.setViewName("master/orderSalesDetailMaster");
        return mav;
    }

    // Dashboard - 매출관리 - 일/월별 매출관리 - 상세보기
    @GetMapping("/orderSalesDetail1Master")
    public ModelAndView orderSalesDetail1Master(){
        mav = new ModelAndView();
        mav.setViewName("master/orderSalesDetail1Master");
        return mav;
    }

    // Dashboard - 기타관리 - 문의사항 리스트
    @GetMapping("/QNAMasterList")
    public ModelAndView QNAMasterList(){
        mav = new ModelAndView();
        mav.setViewName("master/QNAMasterList");
        return mav;
    }

    // Dashboard - 기타관리 - 문의사항 - 답변
    @GetMapping("/QNAnswerDetailMaster")
    public ModelAndView QNAnserDetailMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/QNAnswerDetailMaster");
        return mav;
    }

    // Dashboard - 기타관리 - 자주묻는질문
    @GetMapping("/FAQMasterList")
    public ModelAndView FAQMasterList(){
        mav = new ModelAndView();
        mav.setViewName("master/FAQMasterList");
        return mav;
    }

    // Dashboard - 기타관리 - 자주묻는질문 - 작성
    @GetMapping("/FAQAddMaster")
    public ModelAndView FAQAddMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/FAQAddMaster");
        return mav;
    }

    // Dashboard - 기타관리 - 자주묻는질문 - 수정
    @GetMapping("/FAQEditMaster")
    public ModelAndView FAQEditMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/FAQEditMaster");
        return mav;
    }

    // Dashboard - 기타관리 - 자주묻는질문 - 삭제
    @GetMapping("/FAQDelMaster")
    public ModelAndView FAQDelMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/FAQDelMaster");
        return mav;
    }

    // Dashboard - 기타관리 - 이벤트
    @GetMapping("/EventMasterList")
    public ModelAndView EventMasterList(){
        mav = new ModelAndView();
        mav.setViewName("master/EventMasterList");
        return mav;
    }

    // Dashboard - 기타관리 - 이벤트 - 작성
    @GetMapping("/EventAddMaster")
    public ModelAndView EventAddMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/EventAddMaster");
        return mav;
    }

    // Dashboard - 기타관리 - 이벤트 - 수정
    @GetMapping("/EventEditMaster")
    public ModelAndView EventEditMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/EventEditMaster");
        return mav;
    }

    // Dashboard - 기타관리 - 이벤트 - 삭제
    @GetMapping("/EventDelMaster")
    public ModelAndView EventDelMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/EventDelMaster");
        return mav;
    }

    // Dashboard - 굿즈관리 - 상품 추가
    @GetMapping("/storeAddMaster")
    public ModelAndView storeAddMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/storeAddMaster");
        return mav;
    }

    // Dashboard - 굿즈관리 - 상품 수정
    @GetMapping("/storeEditMaster")
    public ModelAndView storeEditMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/storeEditMaster");
        return mav;
    }

    // Dashboard - 굿즈관리 - 상품 수정
    @GetMapping("/orderEditMaster")
    public ModelAndView orderEditMaster(){
        mav = new ModelAndView();
        mav.setViewName("master/orderEditMaster");
        return mav;
    }

    //관리자 로그인 페이지 view
    @GetMapping("/masterLogin")
    public ModelAndView masterLogin(){
        mav = new ModelAndView();
        mav.setViewName("join/admin_login");

        return mav;
    }
}
