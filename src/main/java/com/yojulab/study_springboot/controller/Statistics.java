package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

@Controller
@RequestMapping("/TAB_PAGE")
public class Statistics {
    
    @RequestMapping("/statistics")
   public String statistics(){
    return "/WEB-INF/views/statistics/statistics.jsp";
   }
    
}
