package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.CommunityService;
import com.yojulab.study_springboot.service.Project_TABService;

@Controller
@RequestMapping("/TAB_PAGE")
public class CommunityController {
    
    @Autowired
    Project_TABService project_TABService;

    @Autowired
    CommunityService communityService;

    @RequestMapping(value = { "/search_community/{currentPage}", "/search_community/" }, method = { RequestMethod.GET,
            RequestMethod.POST })
    public ModelAndView search_community(@PathVariable(required = false) String currentPage, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = communityService.selectSearchWithPagination_Community(currentPage,
                params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
        return modelAndView;
    }

    @PostMapping("/community")
    public ModelAndView community(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = communityService.select_community(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
        return modelAndView;
    }

    @PostMapping("/community_write")
    public ModelAndView community_write(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/community/community_write.jsp");
        return modelAndView;
    }

    //  동현: community answer 수정 및 추가
    @PostMapping("/community_answer/{UNIQUE_ID}")
    public ModelAndView community_answer(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = communityService.community_answer(UNIQUE_ID, params);
        Object result_comment = communityService.selectReply(UNIQUE_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.addObject("result_comment", result_comment);
        modelAndView.setViewName("/WEB-INF/views/community/community_answer.jsp");
        return modelAndView;
    }

    @PostMapping("/community_end/{username}")
    public ModelAndView community_end(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = communityService.community_end(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community_end.jsp");
        return modelAndView;
    }

    @PostMapping("/community_update/{POST_ID}")
    public ModelAndView community_update(@PathVariable String POST_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = communityService.community_answer(POST_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community_update.jsp");
        return modelAndView;
    }

    @PostMapping("/community_updateandSelect/{POST_ID}")
    public ModelAndView community_updateandSelect(@PathVariable String POST_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = communityService.community_updateandSelect(POST_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community_end.jsp");
        return modelAndView;
    }

    @PostMapping("/community_deleteandSelect/{POST_ID}")
    public ModelAndView community_deleteandSelect(@PathVariable String POST_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = communityService.community_deleteandSelect(POST_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
        return modelAndView;
    }

}
