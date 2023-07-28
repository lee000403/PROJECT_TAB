package com.yojulab.study_springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SecurityController {
    @PostMapping({"/loginForm"})     // 로그인 폼 작성
    public ModelAndView loginForm(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/login/login_page.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @PostMapping({"/logoutForm"})     // 로그아웃 폼 작성
    public ModelAndView logoutForm(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/login/logout_form.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
