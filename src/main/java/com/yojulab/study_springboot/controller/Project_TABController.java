package com.yojulab.study_springboot.controller;

import java.util.Map;

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
    @RequestMapping(value = { "/home/{currentPage}", "/home/" }, method = { RequestMethod.GET,
            RequestMethod.POST })
    public ModelAndView commonSearch(@PathVariable(required = false) String currentPage, @RequestParam Map params,
            ModelAndView modelAndView) {
        // Object result = project_TABService.selectSearchWithPagination(currentPage,
        // params);
        // modelAndView.addObject("params", params);
        // modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/main_page/main_page.jsp");
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

    // 상세
    @PostMapping("/Search_pageDetail/{UNIQUE_ID}")
    public ModelAndView Search_pageDetail(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = project_TABService.selectDetail(UNIQUE_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/상세 페이지.jsp");
        return modelAndView;
    }

    @GetMapping("/self_test_result_a")
    public ModelAndView self_test_result_a(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_a.jsp");
        return modelAndView;
    }

    @GetMapping("/self_test_result_b")
    public ModelAndView self_test_result_b(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_b.jsp");
        return modelAndView;
    }

    @GetMapping("/self_test_result_c")
    public ModelAndView self_test_result_c(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test_result_c.jsp");
        return modelAndView;
    }

    // self_test (경로 설정)
    @GetMapping("/self_test")
    public ModelAndView self_test(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/self_test/self_test.jsp");
        return modelAndView;
    }

    @GetMapping("/community")
    public ModelAndView community(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
        return modelAndView;
    }

    @GetMapping("/community_write")
    public ModelAndView community_write(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/community/community_write.jsp");
        return modelAndView;
    }

    @GetMapping("/community_answer")
    public ModelAndView community_answer(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/community/community_answer.jsp");
        return modelAndView;
    }

    @GetMapping("/community_end")
    public ModelAndView community_end(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/community/community_end.jsp");
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

    @GetMapping("/mypage")
    public ModelAndView mypage(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/mypage.jsp");
        return modelAndView;
    }

    @GetMapping("/signin_page_a")
    public ModelAndView signin_page_a(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_page_a.jsp");
        return modelAndView;
    }

    @GetMapping("/signin_page_b")
    public ModelAndView signin_page_b(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_page_b.jsp");
        return modelAndView;
    }

    @GetMapping("/signin_select_page")
    public ModelAndView signin_select_page(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/signin/signin_select_page.jsp");
        return modelAndView;
    }

    @GetMapping("/search_page")
    public ModelAndView selectSearch(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/search_page/search_page.jsp");
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

    @GetMapping("/login_page")
    public ModelAndView login_page(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/login/login_page.jsp");
        return modelAndView;
    }

    @GetMapping("/main_page_after_login")
    public ModelAndView main_page_after_login(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/main_page/main_page_after_login.jsp");
        return modelAndView;
    }
}
