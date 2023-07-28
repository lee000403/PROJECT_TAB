package com.yojulab.study_springboot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yojulab.study_springboot.dao.SharedDao;
import com.yojulab.study_springboot.security.PrincipalUser;
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

    // self_test insert 부분
    public Object self_testInsert(String useraname, Map dataMap) {
        String sqlMapId = "Project_TAB.insert_selfTest";
        dataMap.put("MEMBERID", useraname);
        ArrayList arr = new ArrayList<>();
        arr = (ArrayList) this.select_selfTest(dataMap);
        Object result = null;
        HashMap record = new HashMap<>();
        for (int i = 0; i < arr.size(); i++) {
            record = (HashMap) arr.get(i);
            dataMap.put("ST_QNA_CODE", record.get("ST_QNA_CODE"));
            result = sharedDao.insert(sqlMapId, dataMap);
        }

        int a = (int) result;

        if (a < 7) {
            this.self_testUpdateA(dataMap);
        } else if (7 <= a & a <= 9) {
            this.self_testUpdateB(dataMap);
        } else {
            this.self_testUpdateC(dataMap);
        }

        result = this.select_selfTest_sum(useraname, dataMap);
        return result;
    }

    public Object self_test_no_insert(Map dataMap) {
        String sqlMapId = "Project_TAB.insert_selfTest";
        String UUID = commonUUID.Commons();
        dataMap.put("MEMBERID", UUID);
        ArrayList arr = new ArrayList<>();
        arr = (ArrayList) this.select_selfTest(dataMap);
        Object result = null;
        HashMap record = new HashMap<>();
        for (int i = 0; i < arr.size(); i++) {
            record = (HashMap) arr.get(i);
            dataMap.put("ST_QNA_CODE", record.get("ST_QNA_CODE"));
            result = sharedDao.insert(sqlMapId, dataMap);
        }

        int a = (int) result;

        if (a < 7) {
            this.self_testUpdateA(dataMap);
        } else if (7 <= a & a <= 9) {
            this.self_testUpdateB(dataMap);
        } else {
            this.self_testUpdateC(dataMap);
        }

        result = this.select_selfTest_sum(UUID, dataMap);
        return result;
    }

    public Object self_testUpdateA(Map dataMap) {
        String sqlMapId = "Project_TAB.self_testUpdateA";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object self_testUpdateB(Map dataMap) {
        String sqlMapId = "Project_TAB.self_testUpdateB";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object self_testUpdateC(Map dataMap) {
        String sqlMapId = "Project_TAB.self_testUpdateC";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object select_selfTest_sum(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.select_selfTest_sum";
        dataMap.put("MEMBERID", username);

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object select_selfTest(Map dataMap) {
        Object result = null;
        ArrayList arr = new ArrayList();
        String sqlMapId = "Project_TAB.select_selfTest";
        for (int i = 1; i <= 15; i++) {
            if (i <= 9) {
                dataMap.put("ST_Q_CODE", "ST-0" + String.valueOf(i));
                dataMap.put("ST_ANS_SCORE", dataMap.get("ST-0" + String.valueOf(i)));
                arr.add(sharedDao.getOne(sqlMapId, dataMap));
            } else {
                dataMap.put("ST_Q_CODE", "ST-" + String.valueOf(i));
                dataMap.put("ST_ANS_SCORE", dataMap.get("ST-" + String.valueOf(i)));
                arr.add(sharedDao.getOne(sqlMapId, dataMap));
            }
        }
        result = arr;
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

    public Object self_test_delete(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.self_test_delete";
        dataMap.put("MEMBERID", username);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    public Object select_community(Map dataMap) {
        String sqlMapId = "Project_TAB.select_community";

        String userId = commonUUID.getUserID();
        HashMap result = new HashMap<>();
        result.put("userId", userId);
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    public Object community_answer(String POST_ID, Map dataMap) {
        String sqlMapId = "Project_TAB.community_answer";
        dataMap.put("POST_ID", POST_ID);
        Map map = (Map) this.select_community(dataMap);
        dataMap.put("userId", map.get("userId"));

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object community_update(Map dataMap) {
        String sqlMapId = "Project_TAB.community_update";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object community_updateandSelect(String POST_ID, Map dataMap) {
        dataMap.put("POST_ID", POST_ID);

        HashMap result = new HashMap<>();
        result.put("updateCount", this.community_update(dataMap));

        result.putAll((Map) this.community_answer(POST_ID, dataMap));
        return result;
    }

    public Object community_delete(String POST_ID, Map dataMap) {
        String sqlMapId = "Project_TAB.community_delete";
        dataMap.put("POST_ID", POST_ID);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    public Object community_deleteandSelect(String POST_ID, Map dataMap) {
        dataMap.put("POST_ID", POST_ID);

        HashMap result = new HashMap<>();
        result.put("deleteCount", this.community_delete(POST_ID, dataMap));

        result.putAll((Map) this.select_community(dataMap));
        return result;
    }

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

    public Object selectTotal_Community(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectTotal_Community";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object community_end(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.community_end";
        dataMap.put("MEMBERID", username);
        String UUID = commonUUID.Commons();
        dataMap.put("POST_ID", UUID);

        Object result = sharedDao.insert(sqlMapId, dataMap);
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

    public Object login_button(Map dataMap) {
        String sqlMapId = "Project_TAB.login_button";

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

    public Object deleteAndSelectSearch(String UNIQUE_ID, Map dataMap) {
        dataMap.put("CAR_INFOR_ID", UNIQUE_ID);

        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete(dataMap));

        result.putAll((Map) this.selectSearch(UNIQUE_ID, UNIQUE_ID));
        return result;
    }

    // 삽입 부분
    public Object insert(Map dataMap) {
        Object result = null;
        String sqlMapId = "CarInfors.insert_com";
        if (!dataMap.get("COMMON_CODE_ID").equals("")) {
            result = sharedDao.insert(sqlMapId, dataMap);
        } else if (dataMap.get("COMMON_CODE_ID").equals("")) {
            String uuid = commonUUID.Commons();
            dataMap.put("COMMON_CODE_ID", uuid);
            result = sharedDao.insert(sqlMapId, dataMap);
        }
        return result;
    }

    public Object insertAndSelectSearch(Map dataMap) {

        HashMap result = new HashMap<>();
        result.put("insertCount", this.insert(dataMap));

        result.putAll((Map) this.selectSearchWithPagination(null, dataMap));
        return result;
    }

    public Object update(Map dataMap) {
        String sqlMapId = "CarInfors.update";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object updateAndSelectSearch(String UNIQUE_ID, Map dataMap) {
        dataMap.put("COMMON_CODE_ID", UNIQUE_ID);

        HashMap result = new HashMap<>();
        result.put("updateCount", this.update(dataMap));

        result.putAll((Map) this.selectSearchWithPagination(null, dataMap));
        return result;
    }
}