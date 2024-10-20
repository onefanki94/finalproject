package com.ict.finalproject.controller;


import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.Service.NoticeService;
import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import com.ict.finalproject.vo.QnaVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.List;
import java.util.UUID;

@Controller
@Slf4j
public class noticeController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    MemberService mservice;

    @Autowired
    JWTUtil jwtUtil;

    @GetMapping("/notice2")
    public String getNoticeList(@RequestParam(defaultValue = "1") int page,
                                @RequestParam(defaultValue = "10") int size,
                                @RequestParam(defaultValue = "") String keyword,
                                @RequestParam(defaultValue = "0") int faqtype,
                                Model model) {

        // 공지사항 페이징 처리 및 리스트 조회
        PagingVO noticePVO = noticeService.getNoticePage(page, size, keyword);  // 공지사항 페이징
        List<NoticeVO> notices = noticeService.getNotices(noticePVO);

        // FAQ 페이징 처리 및 리스트 조회
        PagingVO faqPVO = noticeService.getFaqPage(page, size, faqtype);  // 자주 묻는 질문 페이징
        List<NoticeVO> faqs = noticeService.getFaqs(faqPVO);

        // 모델에 데이터 추가
        model.addAttribute("notices", notices);
        model.addAttribute("noticePaging", noticePVO);  // 공지사항 페이징 정보
        model.addAttribute("faqs", faqs);
        model.addAttribute("faqPaging", faqPVO);  // 자주 묻는 질문 페이징 정보
        model.addAttribute("keyword", keyword);
        model.addAttribute("faqtype", faqtype);

        return "notice/notice2";  // 고객센터 페이지로 이동
    }


    // 1:1 문의 등록
    @PostMapping("/inquirySubmit")
    public ResponseEntity<String> inquirySubmit(@RequestParam("title") String title,
                                                @RequestParam("content") String content,
                                                @RequestParam("qnatype") int qnatype,
                                                @RequestParam(value = "file", required = false) List<MultipartFile> files,
                                                @RequestHeader("Authorization") String token) {
        System.out.println("여긴오니?");

        // 토큰에서 "Bearer " 제거
        //String token = authorization.replace("Bearer ", "");
        //토큰에서 사용자 아이디 추출
        String userid = jwtUtil.getUserIdFromToken(token);
        // userid로 index구하기
        int useridx= mservice.getUseridx(userid);

        String imgfile1 = null;
        String imgfile2 = null;
        String uniqueFilename = "";

        try {
            // 파일이 있는 경우에만 처리
            if (files != null && !files.isEmpty()) {
                for (int i = 0; i < files.size(); i++) {
                    MultipartFile file = files.get(i);
                    if (!file.isEmpty()) {
                        uniqueFilename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

                        // 이미지 서버로 파일 전송
                        uploadFileToImageServer(file, uniqueFilename);

                        if (i == 0) {
                            imgfile1 = uniqueFilename;
                        } else if (i == 1) {
                            imgfile2 = uniqueFilename;
                        }
                    }
                }
            }

            // QnaVO 객체 생성 및 설정
            QnaVO qna = new QnaVO();
            qna.setTitle(title);
            qna.setContent(content);
            qna.setQnatype(qnatype);
            qna.setUseridx(useridx);
            qna.setImgfile1(imgfile1);
            qna.setImgfile2(imgfile2);

            // QNA 데이터 저장
            int result = noticeService.saveQna(qna);

            if (result > 0) {
                return ResponseEntity.ok("1:1 문의가 성공적으로 등록되었습니다.");
            } else {
                fileDel(imgfile1);
                fileDel(imgfile2);
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("문의 등록 실패");
            }
        } catch (Exception e) {
            fileDel(imgfile1);
            fileDel(imgfile2);
            log.error("1:1 문의 등록 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("1:1 문의 등록 중 오류 발생");
        }
    }

    // 이미지 서버로 파일을 전송하는 메소드
    private void uploadFileToImageServer(MultipartFile file, String uniqueFilename) throws IOException {
        RestTemplate restTemplate = new RestTemplate();
        String imageServerUrl = "http://192.168.1.92:8000/upload";

        // 파일을 MultiValueMap으로 준비
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("file", new MultipartInputStreamFileResource(file.getInputStream(), uniqueFilename));

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        // 이미지 서버로 파일 전송
        restTemplate.postForEntity(imageServerUrl, requestEntity, String.class);
    }

    // MultipartFile을 InputStream 리소스로 변환하는 클래스
    class MultipartInputStreamFileResource extends InputStreamResource {
        private final String filename;

        public MultipartInputStreamFileResource(InputStream inputStream, String filename) {
            super(inputStream);
            this.filename = filename;
        }

        @Override
        public String getFilename() {
            return this.filename;
        }

        @Override
        public long contentLength() throws IOException {
            return -1;
        }
    }

    // 파일 삭제
    private void fileDel(String filename) {
        RestTemplate restTemplate = new RestTemplate();
        String deleteUrl = "http://192.168.1.92:8000/delete/" + filename;

        try {
            restTemplate.delete(deleteUrl);
            System.out.println("File deleted successfully: " + filename);
        } catch (RestClientException e) {
            System.err.println("Failed to delete file: " + filename + ". Error: " + e.getMessage());
        }
    }






    //상세페이지
//    @GetMapping("/noticeView")
//    public String cmView(){
//        return "notice/noticeView";
//    }
}
