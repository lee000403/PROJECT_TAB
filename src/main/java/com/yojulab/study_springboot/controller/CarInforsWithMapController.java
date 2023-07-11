package com.yojulab.study_springboot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.CarInforsService;

@Controller
@RequestMapping("/carInfor/map")
public class CarInforsWithMapController {
    @Autowired
    CarInforsService carInforsService;

    // /selectSearch?search=YEAR&words=2020
    // /selectSearch/CAR_NAME/소
    @GetMapping("/selectSearch")
    public ModelAndView selectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = carInforsService.selectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }

    @GetMapping("/commonSearch")
    public ModelAndView commonSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = carInforsService.common(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_test.jsp");
        return modelAndView;
    }

    @PostMapping("/deleteAndSelectSearch_Com/{UNIQUE_ID}")
    public ModelAndView deleteAndSelectSearch_Com(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = carInforsService.deleteAndSelectSearch(UNIQUE_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_test.jsp");
        return modelAndView;
    }

    @PutMapping("/updateAndSelectsearch_Com/{UNIQUE_ID}")
    public ModelAndView updateAndSelectsearch_Com(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = carInforsService.update_Com(UNIQUE_ID);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_test.jsp");
        return modelAndView;
    }

    // delete with MVC
    @PostMapping("/deleteAndSelectSearch/{UNIQUE_ID}")
    public ModelAndView deleteAndSelectSearch(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = carInforsService.deleteAndSelectSearch_Com(UNIQUE_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_test.jsp");
        return modelAndView;
    }

    // /selectDetail/CI002
    @GetMapping("/selectDetail/{UNIQUE_ID}")
    public ModelAndView selectDetail(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = carInforsService.selectDetail(UNIQUE_ID, params);
        modelAndView.addObject("params", params);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }
}
