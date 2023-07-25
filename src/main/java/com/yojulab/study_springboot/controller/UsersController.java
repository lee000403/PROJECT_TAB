package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.UsersService;

@Controller
public class UsersController {

    @Autowired
    UsersService usersService;

    @RequestMapping(value = "/TAB_PAGE/signin_page_a", method = RequestMethod.GET)
    public ModelAndView joinForm(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/signin/signin_page_a.jsp";

        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping(value = "/TAB_PAGE/loginenter", method = RequestMethod.POST)
    public ModelAndView joinProc(@RequestParam Map params, ModelAndView modelAndView){
        Object result = usersService.insertWithAuths(params);
        String viewName = "/WEB-INF/views/main_page/main_page.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
