package com.ict.finalproject.controller;

import com.ict.finalproject.Service.AniListService;
import com.ict.finalproject.vo.AniListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class aniListController {

     @Autowired
    private AniListService aniListService;

    // 애니메이션 목록 조회
    @GetMapping("/aniList")
    public String getAniList(Model model) {
        List<AniListVO> aniList = aniListService.getAniList();
        model.addAttribute("aniList", aniList);
        return "ani/aniList"; // JSP 파일 이름 (예: aniList.jsp)
    }

    // 애니메이션 선택 조회
    @GetMapping("/aniListSelect")
    public String getAniListSelect(Model model) {
        List<AniListVO> aniListSelect = aniListService.getAniListSelect();
        model.addAttribute("aniListSelect", aniListSelect);
        return "aniListSelect"; // JSP 파일 이름
    }

    // 특정 애니메이션 상세 조회
    @GetMapping("/aniDetail")
    public String getAniDetailView(String title, Model model) {
        AniListVO aniDetail = aniListService.getAniDetailView(title);
        aniListService.incrementAniHit(title); // 조회수 증가
        model.addAttribute("aniDetail", aniDetail);
        return "aniDetail"; // JSP 파일 이름
    }
}
