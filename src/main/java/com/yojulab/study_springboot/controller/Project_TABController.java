package com.yojulab.study_springboot.controller;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

    @RequestMapping(value = { "/search_community/{currentPage}", "/search_community/" }, method = { RequestMethod.GET,
            RequestMethod.POST })
    public ModelAndView search_community(@PathVariable(required = false) String currentPage, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.selectSearchWithPagination_Community(currentPage,
                params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
        return modelAndView;
    }

    @GetMapping("/hospital_selectDetail/{UNIQUE_ID}/{currentPage}")
    public ModelAndView selectDetail(@PathVariable String UNIQUE_ID, @PathVariable String currentPage,
            @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.hospital_selectDetail(UNIQUE_ID, currentPage, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/detail/detail_hospital.jsp");
        return modelAndView;
    }

    // 삭제 및 전체 조회(회원정보 삭제)
    @PostMapping("/deleteAndSelectSearch/{UNIQUE_ID}")
    public ModelAndView deleteAndSelectSearch(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.deleteAndSelectSearch(UNIQUE_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_test.jsp");
        return modelAndView;
    }

    // 삽입(회원가입 부분)
    @PostMapping("/insert")
    public ModelAndView insert(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_insert.jsp");
        return modelAndView;
    }

    // 삽입 및 전체 조회
    @PostMapping("/insertAndSelectSearch")
    public ModelAndView insertAndSelectSearch_Com(@RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.insertAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_test.jsp");
        return modelAndView;
    }

    // 업데이트
    @PostMapping("/update/{UNIQUE_ID}")
    public ModelAndView update_Com(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.update(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_update.jsp");
        return modelAndView;
    }

    // 업데이트 및 전체 조회
    @PostMapping("/updateAndSelectsearch/{UNIQUE_ID}")
    public ModelAndView updateAndSelectsearch_Com(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.updateAndSelectSearch(UNIQUE_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_test.jsp");
        return modelAndView;
    }

    @GetMapping("/self_test_delete/{username}")
    public ModelAndView self_test_delete(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.self_test_delete(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test.jsp");
        return modelAndView;
    }

    // self_test (경로 설정)
    @GetMapping("/self_test/{username}")
    public ModelAndView self_test(@PathVariable String username, @RequestParam Map params, ModelAndView modelAndView) {
        Object result = project_TABService.self_test_delete(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test.jsp");
        return modelAndView;
    }

    // self_test (경로 설정)
    @GetMapping("/self_test_road/{username}")
    public ModelAndView self_test_road(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.self_testInsert(username, params);
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

    @GetMapping("/community")
    public ModelAndView community(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = project_TABService.select_community(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
        return modelAndView;
    }

    @GetMapping("/community_write")
    public ModelAndView community_write(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/community/community_write.jsp");
        return modelAndView;
    }

    @GetMapping("/community_answer/{UNIQUE_ID}")
    public ModelAndView community_answer(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.community_answer(UNIQUE_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community_answer.jsp");
        return modelAndView;
    }

    @GetMapping("/community_end/{username}")
    public ModelAndView community_end(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.community_end(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community_end.jsp");
        return modelAndView;
    }

    @GetMapping("/community_update/{POST_ID}")
    public ModelAndView community_update(@PathVariable String POST_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.community_answer(POST_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community_update.jsp");
        return modelAndView;
    }

    @GetMapping("/community_updateandSelect/{POST_ID}")
    public ModelAndView community_updateandSelect(@PathVariable String POST_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.community_updateandSelect(POST_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community_end.jsp");
        return modelAndView;
    }

    @GetMapping("/community_deleteandSelect/{POST_ID}")
    public ModelAndView community_deleteandSelect(@PathVariable String POST_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.community_deleteandSelect(POST_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
        return modelAndView;
    }

    @GetMapping("/survey_a")
    public ModelAndView survey_a(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/survey/survey_a.jsp");
        return modelAndView;
    }

    @GetMapping("/survey_result_a")
    public ModelAndView survey_result_a(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/survey/survey_result_a.jsp");
        return modelAndView;
    }

    @GetMapping("/survey_b")
    public ModelAndView survey_b(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/survey/survey_b.jsp");
        return modelAndView;
    }

    @GetMapping("/survey_result_b")
    public ModelAndView survey_result_b(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/survey/survey_result_b.jsp");
        return modelAndView;
    }

    @GetMapping("/mypage/{username}")
    public ModelAndView mypage(@PathVariable String username, @RequestParam Map params, ModelAndView modelAndView) {
        Object result = project_TABService.mypage_detail(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/signin/mypage.jsp");
        return modelAndView;
    }

    @GetMapping("/mypage_update/{username}")
    public ModelAndView mypage_update(@PathVariable String username, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.mypage_updateAndSelectSearch(username, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/signin/mypage.jsp");
        return modelAndView;
    }

    @GetMapping("/signin_page_a/{MEMBER_ID}")
    public ModelAndView signin_page_a(@PathVariable String member_id, @RequestParam Map params,
            ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_page_a.jsp");
        return modelAndView;
    }

    @GetMapping("/signin_page_b/{MEMBER_ID}")
    public ModelAndView signin_page_b(@PathVariable String member_id, @RequestParam Map params,
            ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_page_b.jsp");
        return modelAndView;
    }

    @GetMapping("/signin_select_page")
    public ModelAndView signin_select_page(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_select_page.jsp");
        return modelAndView;
    }

    @GetMapping("/detail_partners")
    public ModelAndView detail_partners(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/detail/detail_partners.jsp");
        return modelAndView;
    }

    @GetMapping("/detail_patients")
    public ModelAndView detail_patients(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/detail/detail_patients.jsp");
        return modelAndView;
    }

    // @GetMapping("/login_page")
    // public ModelAndView login_page(@RequestParam Map params, ModelAndView
    // modelAndView) {

    // modelAndView.setViewName("/WEB-INF/views/login/login_page.jsp");
    // return modelAndView;
    // }

    @GetMapping("/main_page_after_login")
    public ModelAndView main_page_after_login(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/main_page/main_page_after_login.jsp");
        return modelAndView;
    }
}

