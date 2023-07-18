package com.yojulab.study_springboot.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yojulab.study_springboot.commons.CommonUUID;
import com.yojulab.study_springboot.dao.SharedDao;
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

    public Object selectDetail(String COMMON_CODE_ID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectByInUID";
        dataMap.put("COMMON_CODE_ID", COMMON_CODE_ID);

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    public Object selectSearchWithPagination(String page, Map dataMap) {
        int totalCount = (int) this.selectTotal(dataMap);

        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt((String) page); // from client in param
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보
        String sqlMapId = "CarInfors.selectSearchWithPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }

    public Object selectTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectTotal";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Map selectSearch(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Project_TAB.selectSearch";

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
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

        result.putAll(this.selectSearch(dataMap));
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
