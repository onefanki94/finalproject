package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.CommuService;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.vo.CommuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.nio.charset.Charset;
import java.util.List;


//@RequestMapping("/community")
@Controller
public class communityController {
    // userid로 index구하기
    @Autowired
    MemberService mservice;

    @Autowired
    JWTUtil jwtUtil;

    @Autowired
    private CommuService commuService;


//    ModelAndView mav = null;

    // 커뮤니티 리스트 페이지
    @GetMapping("/cmList")
    public String cmList(
            @RequestParam(value = "commtype", required = false, defaultValue = "all") String commtype,
            @RequestParam(value = "orderBy", required = false, defaultValue = "DEFAULT") String orderBy,
            @RequestParam(value = "searchCategory", required = false, defaultValue = "TITLE_AND_CONTENT") String searchCategory,
            @RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
            Model model) {

        // commtype이 "all"인 경우에만 드롭다운의 필터링 조건을 사용
        List<CommuVO> list;
        if ("all".equals(commtype)) {
            list = commuService.FilteredList(null, orderBy, searchCategory, searchKeyword); // 전체 탭에서 드롭다운 조건 사용
        } else {
            list = commuService.List(commtype); // 특정 commtype (예: 자랑, 친목 등)으로 필터링
        }

        model.addAttribute("list", list);
        model.addAttribute("commtype", commtype);
        model.addAttribute("orderBy", orderBy);
        model.addAttribute("searchCategory", searchCategory);
        model.addAttribute("searchKeyword", searchKeyword);

        return "community/cmList";  // JSP 파일 이름 (cmList.jsp)
    }

    //상세페이지
    @GetMapping("/cmView")
    public String cmView(@RequestParam("idx") int idx, Model model) {
        System.out.println("Received idx: " + idx); // idx 값 확인

        CommuVO Detail = commuService.Detail(idx);
        if (Detail == null) {
            return "redirect:/error";
        }

        commuService.HitCount(idx);

        CommuVO previousPost = commuService.PreviousPost(idx);
        CommuVO nextPost = commuService.NextPost(idx);

        model.addAttribute("vo", Detail);
        model.addAttribute("go", previousPost);
        model.addAttribute("tun", nextPost);

        return "community/cmView";
    }

    // 수정 페이지로 이동
    @GetMapping("/cmEdit")
    public String editPage(@RequestParam("idx") int idx, Model model) {
        // 기존 게시글 정보 조회
        CommuVO detail = commuService.Detail(idx);
        model.addAttribute("vo", detail);
        return "community/cmEdit";  // 수정 페이지로 이동 (cmEdit.jsp)
    }


    @PostMapping("/cmEditOk")
    public String updateBoard(CommuVO board) {
        boolean success = commuService.UpdateBoard(board);

        // 수정 성공 시 수정된 게시글의 상세 페이지로 리다이렉트
        if (success) {
            return "redirect:/cmView?idx=" + board.getIdx();
        } else {
            // 실패 시 오류 메시지 출력 후, 수정 페이지로 다시 이동
            return "community/cmEdit";
        }
    }


    @GetMapping("/cmDelete")
    public String delete(@RequestParam("idx") int idx, Model model) {
        int result = commuService.Delete(idx);
        if (result > 0) {
            return "redirect:/cmList";  // 삭제 성공 시 게시글 목록 페이지로 이동
        } else {
            model.addAttribute("errorMessage", "게시글 삭제에 실패했습니다.");
            return "community/cmView";  // 삭제 실패 시 현재 페이지로 다시 이동
        }
    }












    //로그인 여부
    @ResponseBody
    @GetMapping("/getuser")
    public String getuser(@RequestParam("Authorization")String token){
        System.out.println("hi2");
        String userid = jwtUtil.getUserIdFromToken(token); //토큰에서 사용자 아이디 추출
        System.out.println("userid : " + userid);
        return userid;
    }

    //글등록폼
    @GetMapping("/cmWrite")
    public String cmwrite(){

//        mav = new ModelAndView();
//        mav.setViewName("community/cmWrite");
        return "community/cmWrite";
    }

    //글 등록(DB)
    @PostMapping("/cmWriteOk")
    public ModelAndView writeOk(
            @RequestParam("code") String code,// communitytype 테이블의 code 필드와 매핑
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestHeader(value = "Authorization", required = false) String authHeader  // Authorization 헤더 값이 없을 때도 예외가 발생하지 않도록 설정
    ) {
        ModelAndView mav = new ModelAndView();

        // Authorization 헤더 확인
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            mav.setViewName("redirect:/user/login");  // 인증 실패 시 로그인 페이지로 리다이렉트
            mav.addObject("errorMessage", "Authorization 헤더가 없거나 잘못되었습니다.");
            return mav;
        }

        // 토큰 값에서 'Bearer ' 문자열 제거
        String token = authHeader.substring(7);  // 'Bearer ' 다음의 문자열부터 토큰이 시작됨

        if (token.isEmpty()) {
            mav.setViewName("redirect:/user/login");
            mav.addObject("errorMessage", "JWT 토큰이 비어 있습니다.");
            return mav;
        }

        // JWT 토큰 파싱 및 검증
        String userid;
        try {
            userid = jwtUtil.getUserIdFromToken(token);  // 토큰에서 사용자 ID 추출
        } catch (Exception e) {
            // 토큰 파싱 오류 처리
            e.printStackTrace();
            mav.setViewName("redirect:/user/login");
            mav.addObject("errorMessage", "JWT 토큰 파싱 중 오류가 발생했습니다: " + e.getMessage());
            return mav;
        }

        if (userid == null || userid.isEmpty()) {
            mav.setViewName("redirect:/user/login");
            mav.addObject("errorMessage", "유효하지 않은 JWT 토큰입니다. 사용자 정보를 찾을 수 없습니다.");
            return mav;
        }

        // userid로 index 구하기 (Integer 타입으로 반환하여 null 처리)
        Integer useridx = mservice.getUseridx(userid);
        if (useridx == null) {
            mav.setViewName("redirect:/user/login");
            mav.addObject("errorMessage", "사용자 ID에 해당하는 인덱스를 찾을 수 없습니다.");
            return mav;
        }

        // 게시글 VO 객체 생성 및 설정
        CommuVO board = new CommuVO();
        board.setUseridx(useridx); // 사용자 ID 설정
        board.setCommtype(code); // communitytype의 code 필드 설정
        board.setTitle(title); // 제목 설정
        board.setContent(content); // 내용 설정
        //참고로 이런 비즈니스 로직은 service단에서 하고 컨트롤러에서는 그냥 서비스에 전달해주는 게 권장되는 방식

        try {
            CommuVO resultBoard = commuService.writeBoard(board);  // 게시글 등록 서비스 호출

            if (resultBoard == null) {  // 등록 실패 시
                mav.setViewName("community/cmWrite");
                mav.addObject("errorMessage", "게시글 등록에 실패했습니다.");
            } else {  // 등록 성공 시
                mav.setViewName("redirect:/cmList");
                mav.addObject("successMessage", "게시글이 성공적으로 등록되었습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mav.setViewName("community/cmWrite");
            mav.addObject("errorMessage", "게시글 등록 중 오류가 발생했습니다.");
        }

        return mav;
    }





    //커뮤니티-공지사항 이동
    @GetMapping("/allnotice")
    public String allnotice(){
        return "notice/notice2";
    }
}
