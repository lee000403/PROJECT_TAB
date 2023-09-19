package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.Project_TABService;

@Controller
@RequestMapping("/TAB_PAGE")
public class DetailController {
    @Autowired
    Project_TABService project_TABService;

    @PostMapping("/detail_partners")
    public ModelAndView detail_partners(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/detail/detail_partners.jsp");
        return modelAndView;
    }

    @PostMapping("/detail_patients")
    public ModelAndView detail_patients(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/detail/detail_patients.jsp");
        return modelAndView;
    }
}


// 동환아 이겨내ㅏ! ㅠ
// 감사합니다!
