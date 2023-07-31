package com.yojulab.study_springboot.controller;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomizeErrorController implements ErrorController {

    @RequestMapping("/error")
    public ModelAndView handleError(@RequestParam Map params
                    , ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/errors/error.jsp";

        // do something like logging
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}