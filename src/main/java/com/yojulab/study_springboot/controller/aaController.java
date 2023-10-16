package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.CommunityService;
import com.yojulab.study_springboot.service.Project_TABService;

@Controller
public class aaController {

    @Value("${remote.server.url}")
    private String remoteServerUrl;

    @Value("${root.file.folder}")
    private String rootFileFolder;

    @RequestMapping(value = { "/aa" }, method = RequestMethod.GET)
    public ModelAndView formMulti(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/community/aa.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
