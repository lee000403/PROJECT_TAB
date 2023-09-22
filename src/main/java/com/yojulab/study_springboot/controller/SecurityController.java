package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.Project_TABService;

@Controller
public class SecurityController {
    @Autowired
    Project_TABService project_TABService;

    @GetMapping({"/loginForm"})     // 로그인 폼 작성
    public ModelAndView loginForm(@RequestParam Map params, ModelAndView modelAndView){
        Object result = project_TABService.selectID(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

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
