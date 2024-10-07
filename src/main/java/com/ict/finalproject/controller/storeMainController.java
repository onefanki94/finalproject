package com.ict.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.StoreVO;



@Controller
public class storeMainController {

    StoreService service;
    ModelAndView mav = null;

     @GetMapping("/storeMain")
 public String storeMain() {
     return "store/storeMain";
 }

 
    @GetMapping("/storeList")
 public String storeList(){
    return "store/storeList";
 } 

   @GetMapping("/storeDetail")
   public ModelAndView storDetail(StoreVO vo) {
    mav = new ModelAndView();

     vo = service.storeContent(vo);
        
       return mav;
   }

    @GetMapping("/shoppingBag")
    public String shoppingBag() {
        return "store/shopping_bag";
    }

    @GetMapping("/orderpage")
    public String orderpage() {
        return "store/orderpage";
    }
}



