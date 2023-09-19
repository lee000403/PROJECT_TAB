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
public class SurveyController {
    @Autowired
    Project_TABService project_TABService;

    @PostMapping("/survey_a")
    public ModelAndView survey_a(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/survey/survey_a.jsp");
        return modelAndView;
    }

    @PostMapping("/survey_result_a")
    public ModelAndView survey_result_a(@PathVariable String username, @RequestParam Map params, ModelAndView modelAndView) {
        Object result = project_TABService.survey_result_a(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/survey/survey_result_a.jsp");
        return modelAndView;
    }

    @PostMapping("/survey_b")
    public ModelAndView survey_b(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/survey/survey_b.jsp");
        return modelAndView;
    }

    @PostMapping("/survey_result_b")
    public ModelAndView survey_result_b(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/survey/survey_result_b.jsp");
        return modelAndView;
    }
}
