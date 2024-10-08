package com.ict.finalproject.controller;


import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.TAdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequestMapping("/master")
public class masterController {

        ModelAndView mav = null;
        TAdminService tAdminService;
        JWTUtil jwtUtil;

    @Autowired
        public masterController(TAdminService tAdminService, JWTUtil jwtUtil) {
        this.tAdminService = tAdminService;
        this.jwtUtil = jwtUtil;
    }

        // t_admin에  admin아이디 있는지 체크 하는 API
        @GetMapping("/checkAdmin")
        public ResponseEntity<Boolean> checkAdmin(@RequestHeader("Authorization") String authHeader) {
            // Authorization 헤더 확인
            if (authHeader == null || !authHeader.startsWith("Bearer ")) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false);
            }

            String token = authHeader.substring(7);  // 'Bearer ' 제거

            // JWT 토큰 유효성 검사
            if (!jwtUtil.validateToken(token)) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false);
            }

            // 토큰에서 사용자 ID 추출
            String userId = jwtUtil.getUserIdFromToken(token);

            // t_admin 테이블의 "admin" 아이디만 접근 허용
            boolean isAdmin = tAdminService.isAdmin(userId);

            return ResponseEntity.ok(isAdmin);  // 관리자 여부를 반환
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
        public ModelAndView masterUserList(){
            mav = new ModelAndView();
            mav.setViewName("master/userMasterList");
            return mav;
        }

        // Dashboard - 애니관리 -  애니목록 리스트
        @GetMapping("/aniMasterList")
        public ModelAndView masterAniList(){
            mav = new ModelAndView();
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
            mav = new ModelAndView();
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
            mav = new ModelAndView();
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
}
