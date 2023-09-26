package com.yojulab.study_springboot.service;

import java.util.ArrayList;
import java.util.HashMap;
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

}
