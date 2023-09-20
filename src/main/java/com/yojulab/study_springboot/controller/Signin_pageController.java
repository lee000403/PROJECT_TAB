package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.Project_TABService;

@Controller
@RequestMapping("/TAB_PAGE")
public class Signin_pageController {
    @Autowired
    Project_TABService project_TABService;

    @PostMapping("/mypage/{username}")
    public ModelAndView mypage(@PathVariable String username, @RequestParam Map params, ModelAndView modelAndView) {
        Object result = project_TABService.mypage_detail(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/signin/mypage.jsp");
        return modelAndView;
    }

    @PostMapping("/mypage_update/{username}")
    public ModelAndView mypage_update(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.mypage_updateAndSelectSearch(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/signin/mypage.jsp");
        return modelAndView;
    }

    @PostMapping("/signin_page_a/{MEMBER_ID}")
    public ModelAndView signin_page_a(@PathVariable String member_id, @RequestParam Map params,
            ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_page_a.jsp");
        return modelAndView;
    }

    @PostMapping("/signin_page_b/{MEMBER_ID}")
    public ModelAndView signin_page_b(@PathVariable String member_id, @RequestParam Map params,
            ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_page_b.jsp");
        return modelAndView;
    }

    @PostMapping("/signin_select_page")
    public ModelAndView signin_select_page(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_select_page.jsp");
        return modelAndView;
    }
}
