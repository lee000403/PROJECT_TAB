package com.yojulab.study_springboot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yojulab.study_springboot.dao.SharedDao;
import com.yojulab.study_springboot.utills.CommonUUID;
import com.yojulab.study_springboot.utills.Paginations;

@Service
@Transactional
public class Project_TABService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    CommonUUID commonUUID;

    public Object selectInUID(Map dataMap) {
        String sqlMapId = "Project_TAB.selectInUID";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object hospital_selectDetail(String CENTER_TYPE_ID, String currentPage, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectByInUID";
        dataMap.put("CENTER_TYPE_ID", CENTER_TYPE_ID);
        dataMap.put("currentPage", currentPage);

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    public Object selectSearchWithPagination(String page, Map dataMap) {
        int totalCount = 0;
        totalCount = (int) this.selectTotal(dataMap);
        page = (String) dataMap.get("currentPage");
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt((String) page); // from client in param
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보
        String sqlMapId = "Project_TAB.selectSearchWithPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        if (dataMap.get("words") == null) {
            dataMap.put("words", "");
        }

        result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }

    public Object selectTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectTotal";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object selectSearch(String search, String words) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectSearch";
        HashMap dataMap = new HashMap<>();
        dataMap.put("search", search);
        dataMap.put("words", words);

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object mypage_detail(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.mypage_detail";
        dataMap.put("username", username);

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object mypage_update(Map dataMap) {
        String sqlMapId = "Project_TAB.mypage_update";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object mypage_updateAndSelectSearch(String username, Map dataMap) {
        dataMap.put("MEMBERID", username);

        HashMap result = new HashMap<>();
        result.put("updateCount", this.mypage_update(dataMap));

        result.putAll((Map) this.mypage_detail(username, dataMap));
        return result;
    }

    public Object mypage_ID_del(String MEMBERID, Map dataMap) {
        String sqlMapId = "Project_TAB.mypage_ID_del";
        dataMap.put("MEMBERID", MEMBERID);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    public Object login_button(Map dataMap) {
        String sqlMapId = "Project_TAB.login_button";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        if (result == null) {
            HashMap<String, Character> null_code = new HashMap<String, Character>();
            null_code.put("username", ' ');
            result = null_code;
        }
        return result;
    }

    public Object survey_result_a(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.survey_result_a";
        dataMap.put("username", username);
        dataMap.putAll((Map) this.mypage_detail(username, dataMap));

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }    

    public Object selectAll_Com(String COMMON_CODE_ID) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectAll_Com";
        HashMap<String, String> dataMap = new HashMap<String, String>();
        dataMap.put("COMMON_CODE_ID", COMMON_CODE_ID);
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    // 삭제 부분
    public Object delete(Map dataMap) {
        String sqlMapId = "Project_TAB.delete";

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    public Object selectID(Map dataMap) {
        String sqlMapId = "Project_TAB.mypage_detail";

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    public Object survey_a_ID(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.survey_result_a";

        dataMap.put("id", this.mypage_detail(username, dataMap));
        dataMap.put("username", username);
        ArrayList result_list = (ArrayList)this.survey_id(dataMap);
        dataMap.put("result_list", result_list);
        ArrayList value_list = new ArrayList<>();
        for (int i = 1; i <= result_list.size(); i++) {
            String key = (String) "SURQ0" + i;
            Object value = dataMap.get(key);
            value_list.add(value);
        }
        dataMap.put("index_value", "SURQ0");
        dataMap.put("Value_list", value_list);
        Object result_insert = sharedDao.insert(sqlMapId, dataMap);

        HashMap result = new HashMap<>();
        result.put("survey_member", this.survey_match_search_a(username, dataMap));
        result.put("survey_partner", this.survey_partner_all(username, dataMap));

        return result;
    }

    public Object survey_member_pa(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.survey_member_pa";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object survey_partner_all(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.survey_partner_all";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object survey_match_search_a(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.survey_match_search_a";

        ArrayList<Map<String, String>> survey_result = new ArrayList<>();
        survey_result = (ArrayList<Map<String, String>>) this.survey_member_pa(username, dataMap);
        ArrayList<Map<String, String>> survey_list = new ArrayList<>();
        HashMap a = new HashMap<>();
        int i = 0;
        for (Map<String, String> survey : survey_result) {
            if (survey.get("SURVEY_Q_ID").equals("SURQ08")) {

                a.put("gender_num", survey.get("SURVEY_ANS_ID"));
            } else if (survey.get("SURVEY_Q_ID").equals("SURQ09")) {
                a.put("work_num", survey.get("SURVEY_ANS_ID"));
            } else if (survey.get("SURVEY_Q_ID").equals("SURQ12")) {
                a.put("area_num", survey.get("SURVEY_ANS_ID"));
                survey_list.add(i, a);
                i++;
                
            }
        }
        dataMap.put("survey_list", survey_list);
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object survey_b_ID(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.survey_result_b";

        dataMap.put("id", this.mypage_detail(username, dataMap));
        dataMap.put("username", username);
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object survey_id(Map dataMap) {
        String sqlMapId = "Project_TAB.select_Q_ID";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

}
