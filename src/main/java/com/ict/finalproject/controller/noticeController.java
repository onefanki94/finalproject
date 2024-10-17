package com.ict.finalproject.controller;


import com.ict.finalproject.Service.NoticeService;
import com.ict.finalproject.vo.NoticeVO;
import com.ict.finalproject.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class noticeController {

    @Autowired
    private NoticeService noticeService;

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




    //상세페이지
//    @GetMapping("/noticeView")
//    public String cmView(){
//        return "notice/noticeView";
//    }
}
