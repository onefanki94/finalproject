package com.ict.finalproject.config;

import com.ict.finalproject.Service.MasterService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class GlobalModelInterceptor implements HandlerInterceptor {
    @Autowired
    private MasterService masterService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // 관리자 페이지 요청에만 unansweredCount 추가
        if (modelAndView != null && request.getRequestURI().startsWith("/master")) {
            int unanswerCount = masterService.getUnansweredQnaCount();
            modelAndView.addObject("unanswerCount", unanswerCount);
        }
    }
}
