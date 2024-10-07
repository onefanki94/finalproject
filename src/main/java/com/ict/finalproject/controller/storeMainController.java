package com.ict.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.StoreVO;



@Controller
public class storeMainController {
    @Autowired
    private StoreService storeService;
    //StoreService service;
    ModelAndView mav = null;

    @GetMapping("/storeMain")
    public String storeMain() {
        return "store/storeMain";
    }

 
    @GetMapping("/storeList")
    public ModelAndView getStoreList(){
        System.out.println(11);
        List<StoreVO> storeList = storeService.getStoreList();
        System.out.println(storeList);
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", storeList);
        mav.setViewName("store/storeList");
        return mav;
    } 

//    @GetMapping("/storeDetail")
//    public ModelAndView storDetail(StoreVO vo) {
//     mav = new ModelAndView();

//      vo = service.storeContent(vo);
        
//        return mav;
//    }

    @GetMapping("/shoppingBag")
    public String shoppingBag() {
        return "store/shopping_bag";
    }

    @GetMapping("/orderpage")
    public String orderpage() {
        return "store/orderpage";
    }
}



