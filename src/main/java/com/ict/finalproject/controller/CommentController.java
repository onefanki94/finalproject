package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.CommentService;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.nio.charset.Charset;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    MemberService mservice;

    @Autowired
    JWTUtil jwtUtil;

    @Autowired
    private CommentService commentService;

    //댓글 등록(DB)
    @PostMapping("/regiComm")
    public ResponseEntity<String> regiComm(
            @RequestParam("comm_idx") int comm_idx,
            @RequestParam("content") String content,
            @RequestParam("token") String token
    ) {
        //토큰에서 사용자 아이디 추출
        String userid = jwtUtil.getUserIdFromToken(token);
        if (userid == null) {
            return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
        }

        // userid로 index구하기
        int useridx= mservice.getUseridx(userid);

        // comment VO 객체 생성 및 설정
        CommentVO comment = new CommentVO();
        comment.setUseridx(useridx);
        comment.setContent(content);
        comment.setComm_idx(comm_idx);

        //참고로 이런 비즈니스 로직은 service단에서 하고 컨트롤러에서는 그냥 서비스에 전달해주는 게 권장되는 방식
        String bodyTag = "";
        try {

            int resultCommrnt = commentService.insertComment(comment); //댓글 등록 서비스 호출

//            if (resultCommrnt == null) { // 등록 실패 시
//                bodyTag += "<script>alert('등록 실패');history.back();</script>";
//            } else { // 등록 성공 시
//                // 자바스크립트로 페이지 이동 처리
//                bodyTag += "<script>alert('등록 성공'); location.href='/cmList';</script>";
//            }
        } catch (Exception e) {
            e.printStackTrace();
            bodyTag += "<script>alert('등록 실패');history.back();</script>";
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

        return new ResponseEntity<>(bodyTag, headers, HttpStatus.OK);
    }



    // 댓글 목록 조회
    @GetMapping("/getComment")
    public ResponseEntity<List<CommentVO>> getComment(@RequestParam("comm_idx") int comm_idx) {
        List<CommentVO> comments = commentService.getComment(comm_idx);
        return new ResponseEntity<>(comments, HttpStatus.OK);
    }

}
