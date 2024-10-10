package com.ict.finalproject.controller;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class storeMainController {

    @Autowired
    StoreService storeService;
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

    @GetMapping("/storeDetail")
   public String storDetail() {
       return "store/storeDetail";
   }

    @GetMapping("/shoppingBag")
    public String shoppingBag() {
        return "store/shopping_bag";
    }

}