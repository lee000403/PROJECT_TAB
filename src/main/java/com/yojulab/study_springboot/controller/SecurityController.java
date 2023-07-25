package com.yojulab.study_springboot.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

public class SecurityController {
    @GetMapping({ "/TAB_PAGE/login_page" }) // 로그인 폼 작성
    public ModelAndView loginForm(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/login/login_page.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({ "/logoutForm" }) // 로그아웃 폼 작성
    public ModelAndView logoutForm(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/security/logoutForm.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
