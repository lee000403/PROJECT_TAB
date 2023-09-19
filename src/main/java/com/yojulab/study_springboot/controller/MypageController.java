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
public class MypageController {
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
}
