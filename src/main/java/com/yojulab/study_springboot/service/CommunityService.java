package com.yojulab.study_springboot.service;

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
public class CommunityService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    CommonUUID commonUUID;

    // select community
    public Object select_community(Map dataMap) {
        String sqlMapId = "Project_TAB.select_community";

        String userId = commonUUID.getUserID();
        HashMap result = new HashMap<>();
        result.put("userId", userId);
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // community answer
    public Object community_answer(String POST_ID, Map dataMap) {
        String sqlMapId = "Project_TAB.community_answer";
        dataMap.put("POST_ID", POST_ID);
        Map map = (Map) this.select_community(dataMap);
        dataMap.put("userId", map.get("userId"));

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // community end
    public Object community_end(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.community_end";
        dataMap.put("MEMBERID", username);
        String UUID = commonUUID.Commons();
        dataMap.put("POST_ID", UUID);

        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    // community update
    public Object community_update(Map dataMap) {
        String sqlMapId = "Project_TAB.community_update";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    // community update and select
    public Object community_updateandSelect(String POST_ID, Map dataMap) {
        dataMap.put("POST_ID", POST_ID);

        HashMap result = new HashMap<>();
        result.put("updateCount", this.community_update(dataMap));

        result.putAll((Map) this.community_answer(POST_ID, dataMap));
        return result;
    }

    // community_delete
    public Object community_delete(String POST_ID, Map dataMap) {
        String sqlMapId = "Project_TAB.community_delete";
        dataMap.put("POST_ID", POST_ID);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }


    // select total community
    public Object selectTotal_Community(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectTotal_Community";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }


    // selectsearchwithpagination
    public Object selectSearchWithPagination_Community(String page, Map dataMap) {
        int totalCount = 0;
        totalCount = (int) this.selectTotal_Community(dataMap);
        page = (String) dataMap.get("currentPage");
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt((String) page); // from client in param
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보
        String sqlMapId = "Project_TAB.selectSearchWithPagination_Community";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        if (dataMap.get("words") == null) {
            dataMap.put("words", "");
        }

        result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }
    // community delete and select
    public Object community_deleteandSelect(String POST_ID, Map dataMap) {
        dataMap.put("POST_ID", POST_ID);
        String page = null;
        HashMap result = new HashMap<>();
        result.put("deleteCount", this.community_delete(POST_ID, dataMap));
        result.putAll((Map) this.selectSearchWithPagination_Community(page, dataMap));
        return result;
    }

}
