package com.ict.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class storeMainController {
     @GetMapping("/storeMain")
 public String storeMain() {
     return "store/storeMain";
 }


    @GetMapping("/storeList")
 public String storeList(){
    return "store/storeList";
 }

   @GetMapping("/storeDetail")
   public String storDetail() {
       return "store/storeDetail";
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



