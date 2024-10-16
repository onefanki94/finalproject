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
                                Model model) {
        // 페이징 처리 및 공지사항 리스트 조회
        PagingVO pVO = noticeService.getNoticePage(page, size, keyword, "");  // 태그는 빈 값으로 처리
        List<NoticeVO> notices = noticeService.getNotices(pVO);

        // 모델에 데이터 추가
        model.addAttribute("notices", notices);
        model.addAttribute("paging", pVO);
        model.addAttribute("keyword", keyword);  // 현재 검색어를 뷰에 전달

        return "notice/notice2";  // 뷰 페이지로 이동
    }




    // 공지사항 목록 조회 (검색 조건 포함)


//    @GetMapping("/notice2")
//    public String notice() {
//        return "notice/notice2";
//    }

    //상세페이지
//    @GetMapping("/noticeView")
//    public String cmView(){
//        return "notice/noticeView";
//    }
}
