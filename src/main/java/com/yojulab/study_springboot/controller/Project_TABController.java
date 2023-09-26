package com.yojulab.study_springboot.controller;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.Project_TABService;

@Controller
@RequestMapping("/TAB_PAGE")
public class Project_TABController {
    @Autowired
    Project_TABService project_TABService;

    // 메인화면 URL(페이징 구현) (경로 설정 완료)
    @RequestMapping(value = { "/home", "/home/" }, method = { RequestMethod.GET,
            RequestMethod.POST })
    public ModelAndView mainPage(@PathVariable(required = false) String currentPage, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.selectSearchWithPagination(currentPage,
                params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/main_page/main_page.jsp");
        return modelAndView;
    }

    @RequestMapping(value = { "/home_after", "/home_after/" }, method = { RequestMethod.GET,
            RequestMethod.POST })
    public ModelAndView mainPage_after(@PathVariable(required = false) String currentPage, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.selectSearchWithPagination(currentPage,
                params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/main_page/main_page_after_login.jsp");
        return modelAndView;
    }

    @RequestMapping(value = { "/search_page/{currentPage}", "/search_page/" }, method = { RequestMethod.GET,
            RequestMethod.POST })
    public ModelAndView search_page(@PathVariable(required = false) String currentPage, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.selectSearchWithPagination(currentPage,
                params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/search_page/search_page.jsp");
        return modelAndView;
    }

    @PostMapping("/hospital_selectDetail/{UNIQUE_ID}/{currentPage}")
    public ModelAndView selectDetail(@PathVariable String UNIQUE_ID, @PathVariable String currentPage,
            @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.hospital_selectDetail(UNIQUE_ID, currentPage, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/detail/detail_hospital.jsp");
        return modelAndView;
    }

    @PostMapping("/main_page_after_login")
    public ModelAndView main_page_after_login(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/main_page/main_page_after_login.jsp");
        return modelAndView;
    }

    @PostMapping("/login_button")
    public ResponseEntity login_button(@RequestBody Map params, ModelAndView modelAndView) {
        Object result = project_TABService.login_button(params);

        return ResponseEntity.ok().body(result);
    }
}

