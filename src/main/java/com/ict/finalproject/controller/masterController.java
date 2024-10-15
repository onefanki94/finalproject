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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
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

    @GetMapping("/userDelMasterList")
    public ModelAndView masterUserDelList(MasterVO vo){
        List<MasterVO> memberDelList = masterService.getMemberDelList(vo);
        mav = new ModelAndView();
        mav.addObject("memberDelList", memberDelList);
        mav.setViewName("master/userDelMasterList");
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
        public ModelAndView masterReportList(MasterVO vo){
            List<MasterVO> reportinguserList = masterService.getReportinguserList(vo);
            mav = new ModelAndView();
            mav.addObject("reportinguserList", reportinguserList);
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
        List<MasterVO> reviewList = masterService.getReviewList();

        // 로그로 데이터 크기 확인
        System.out.println("불러온 댓글 개수: " + reviewList.size());

        ModelAndView mav = new ModelAndView();
        mav.addObject("reviewList", reviewList);
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
            // 관리자페이지 공지사항 글 목록 불러오기
        System.out.println("관리자페이지 공지사항 목록 불러오기");

        List<MasterVO> noticeList = masterService.getNoticeList();
        mav = new ModelAndView();
        mav.addObject("noticeList", noticeList);
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
            @RequestParam("token") String token) {

        String bodyTag = "";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

        try {
            // JWT 토큰에서 adminid 추출
            String adminid = jwtUtil.getUserIdFromToken(token);

            // adminid를 통해 adminidx 조회
            Integer adminidx = masterService.getAdminIdxByAdminid(adminid);

            if (adminidx == null) {
                bodyTag += "<script>alert('관리자 정보를 찾을 수 없습니다.');history.back();</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.UNAUTHORIZED);
            }

            // 공지사항 등록 로직 (예: 데이터베이스에 공지사항 저장)
            MasterVO notice = new MasterVO();
            notice.setTitle(title);
            notice.setContent(content);
            notice.setAdminidx(adminidx);  // adminidx 설정

            // 공지사항 데이터베이스에 삽입
            MasterVO resultNotice = masterService.createNotice(notice);

            if (resultNotice == null) {
                bodyTag += "<script>alert('공지사항 등록에 실패했습니다.');history.back();</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
            } else {
                bodyTag += "<script>alert('공지사항이 성공적으로 등록되었습니다.');location.href='/master/noticeMasterList';</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.OK);
            }

        } catch (Exception e) {
            log.error("공지사항 등록 중 오류 발생", e);
            bodyTag += "<script>alert('공지사항 등록 중 오류가 발생했습니다. 다시 시도해 주세요.');history.back();</script>";
            return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
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
            // 자주묻는 질문 목록 불러오기
        System.out.println("자주묻는질문 목록 불러오기");
        List<MasterVO> faqList = masterService.getFAQList();
        mav = new ModelAndView();
        mav.addObject("faqList", faqList);
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

    @PostMapping("/FAQAddMasterOk")
    public ResponseEntity<String> FAQAddMasterOK(
            @RequestParam("code") String code,
            @RequestParam("question") String question,
            @RequestParam("answer") String answer,
            @RequestParam("token") String token){

            String bodyTag ="";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

            try{
                // 토큰으로 adminid 추출
                String adminid = jwtUtil.getUserIdFromToken(token);

                // adminid를 adminidx로 변환
                Integer adminidx = masterService.getAdminIdxByAdminid(adminid);

                if(adminidx == null){
                    bodyTag += "<script>alert('관리자 정보를 찾을 수 없습니다.');history.back();</script>";
                    return new ResponseEntity<>(bodyTag, headers, HttpStatus.UNAUTHORIZED);
                }

                // 자주묻는 질문 등록 로직 (데이터베이스 저장)
                MasterVO faq = new MasterVO();
                faq.setFaqtype(code);
                faq.setQuestion(question);
                faq.setAnswer(answer);
                faq.setAdminidx(adminidx);

                MasterVO resultFaq = masterService.createFAQ(faq);

                if(resultFaq == null){
                    bodyTag += "<script>alert('FAQ 등록 실패. 다시 시도해 주세요.');history.back();</script>";
                    return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
                }else{
                    bodyTag += "<script>alert('FAQ가 성공적으로 등록되었습니다.');location.href='/master/FAQMasterList';</script>";
                    return new ResponseEntity<>(bodyTag, headers, HttpStatus.OK);
                }
            }catch (Exception e){
                log.error("FAQ 등록 중 오류 발생", e);
                bodyTag += "<script>alert('FAQ 등록 중 오류가 발생했습니다. 다시 시도해 주세요.');history.back();</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
            }
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

    // 굿즈 상품 데이터베이스 등록
    @PostMapping("/storeAddMasterOk")
    public ResponseEntity<String> storeAddMasterOK(
            @RequestParam("code") String code,
            @RequestParam("title") String title,
            @RequestParam("price") Integer price,
            @RequestParam("thumimg") MultipartFile thumimg,
            @RequestParam("ani_title") String ani_title,
            @RequestParam("relDT") String relDT,
            @RequestParam("brand") String brand,
            @RequestParam("pro_detail") MultipartFile pro_detail,
            @RequestParam("fee") int fee,
            @RequestParam("stock") int stock,
            @RequestParam("token") String token) {

        String bodyTag = "";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

        try {
            // JWT 토큰에서 adminid 추출
            String adminid = jwtUtil.getUserIdFromToken(token);

            // adminid로 adminidx 변환
            Integer adminidx = masterService.getAdminIdxByAdminid(adminid);
            if (adminidx == null) {
                bodyTag += "<script>alert('관리자 정보를 찾을 수 없습니다.');history.back();</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.UNAUTHORIZED);
            }

            // 파일 저장 경로 설정
            String thumimgPath = saveFile(thumimg, "img/store/");
            String proDetailPath = saveFile(pro_detail, "img/store/");

            // 파일 저장 실패 시 처리
            if (thumimgPath == null || proDetailPath == null) {
                bodyTag += "<script>alert('파일 업로드에 실패했습니다.');history.back();</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
            }

            // 상품 등록 로직
            MasterVO storeAdd = new MasterVO();
            storeAdd.setCategory(code);
            storeAdd.setTitle(title);
            storeAdd.setPrice(price);
            storeAdd.setThumimg(thumimgPath);  // 저장된 썸네일 이미지 경로
            storeAdd.setAni_title(ani_title);
            storeAdd.setRelDT(relDT);
            storeAdd.setBrand(brand);
            storeAdd.setPro_detail(proDetailPath);  // 저장된 상세 정보 파일 경로
            storeAdd.setFee(fee);
            storeAdd.setStock(stock);
            storeAdd.setAdminidx(adminidx);

            // 서비스 호출하여 저장
            MasterVO resultStore = masterService.createStore(storeAdd);
            if (resultStore == null) {
                bodyTag += "<script>alert('굿즈 상품 등록 실패. 다시 시도해 주세요.');history.back();</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
            } else {
                bodyTag += "<script>alert('굿즈 상품이 성공적으로 등록되었습니다.');location.href='/master/storeMasterList';</script>";
                return new ResponseEntity<>(bodyTag, headers, HttpStatus.OK);
            }
        } catch (IOException e) {
            log.error("파일 처리 중 오류 발생", e);
            bodyTag += "<script>alert('파일 처리 중 오류가 발생했습니다. 다시 시도해 주세요.');history.back();</script>";
            return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            log.error("굿즈 등록 중 오류 발생", e);
            bodyTag += "<script>alert('굿즈 상품 등록 중 오류가 발생했습니다. 다시 시도해 주세요.');history.back();</script>";
            return new ResponseEntity<>(bodyTag, headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 파일을 저장하는 메서드
    private String saveFile(MultipartFile file, String relativePath) throws IOException {
        if (file.isEmpty()) {
            return null;
        }

        // 절대 경로로 파일을 저장
        String absolutePath = new File("src/main/webapp/" + relativePath).getAbsolutePath();

        try {
            String originalFilename = file.getOriginalFilename();
            String filePath = absolutePath + "/" + originalFilename;
            File dest = new File(filePath);

            // 디렉터리가 없으면 생성
            if (!dest.exists()) {
                dest.mkdirs();
            }

            // 파일 저장
            file.transferTo(dest);

            // 서버에서 접근 가능한 경로 반환
            return "img/store/" + originalFilename;
        } catch (IOException e) {
            log.error("파일 저장 중 오류 발생", e);
            throw e;
        }
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

    // 신고 테이블 신청
    @PostMapping("/reportinguserOK")
    public String reportinguserOK(@RequestParam("userid") String userid,
                                  @RequestParam("reason") String reason,
                                  @RequestParam("endDT") String endDT, Model model) {
        LocalDateTime stopDT = LocalDateTime.now(); // 신고 시작 시간

        // EndDT를 String에서 LocalDateTime으로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime parsedEndDT;

        try {
            parsedEndDT = LocalDateTime.parse(endDT, formatter);
        } catch (DateTimeParseException e) {
            log.info("에러 발생: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/user/login";
        }

        // 사용자가 이미 정지된 상태인지 확인
        boolean isBanned = masterService.checkUserBanStatus(userid);

        if (isBanned) {
            // 정지된 사용자임을 JSP로 전달
            model.addAttribute("isBanned", true);
            log.info("사용자 " + userid + " 는 이미 정지된 상태입니다.");
            return "user/login";  // 로그인 페이지로 다시 렌더링 (리다이렉트하지 않음)
        }

        // 신고 내역 추가 처리
        masterService.addReport(userid, reason, stopDT, parsedEndDT);

        return "redirect:/master/reportinguserListMaster";
    }
}
