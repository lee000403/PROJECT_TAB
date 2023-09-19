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
import com.yojulab.study_springboot.service.Self_testService;

@Controller
@RequestMapping("/TAB_PAGE")
public class Self_testController {
    @Autowired
    Project_TABService project_TABService;

    @Autowired
    Self_testService self_testService;

    @PostMapping("/self_test_delete/{username}")
    public ModelAndView self_test_delete(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = self_testService.self_test_delete(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test.jsp");
        return modelAndView;
    }

    @PostMapping("/self_test/{username}")
    public ModelAndView self_test(@PathVariable String username, @RequestParam Map params, ModelAndView modelAndView) {
        Object result = self_testService.self_test_delete(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test.jsp");
        return modelAndView;
    }

    @PostMapping("/self_test_no_insert")
    public ModelAndView self_test_no_insert(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = self_testService.self_test_no_insert(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        Map map = (Map) result;
        Double a = (Double) map.get("sum");
        if (a < 7.0) {
            modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_a.jsp");
        } else if (7.0 <= a & a <= 9.0) {
            modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_b.jsp");
        } else {
            modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_c.jsp");
        }
        return modelAndView;
    }
    
    @PostMapping("/self_test_road/{username}")
    public ModelAndView self_test_road(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = self_testService.self_testInsert(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        Map map = (Map) result;
        int a = Integer.parseInt(String.valueOf(((Map) result).get("sum")));
        if (a < 7) {
            modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_a.jsp");
        } else if (7 <= a & a <= 9) {
            modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_b.jsp");
        } else {
            modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_c.jsp");
        }
        return modelAndView;
    }
}
