package com.yojulab.study_springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yojulab.study_springboot.commons.CommonUUID;
import com.yojulab.study_springboot.dao.SharedDao;

@Service
@Transactional
public class CarInforsService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    CommonUUID commonUUID;

    public Object selectInUID(Map dataMap) {
        String sqlMapId = "CarInfors.selectInUID";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    // 검색(조건-search : YEAR, CAR_NAME)
    public Map selectSearch(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectSearch";

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 검색(조건-search : YEAR, CAR_NAME)
    public Object selectSearch(String search, String words) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectSearch";
        HashMap dataMap = new HashMap<>();
        dataMap.put("search", search);
        dataMap.put("words", words);

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Map selectSearch_Com(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectSearch_Com";

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getOne(sqlMapId, dataMap));
        return result;
    }

    public Object selectSearch_Com(String search, String words) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectSearch_Com";
        HashMap dataMap = new HashMap<>();
        dataMap.put("search", search);
        dataMap.put("words", words);

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object selectAll(String CAR_INFOR_ID) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectAll";
        HashMap dataMap = new HashMap<>();
        dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object selectDetail(String CAR_INFOR_ID) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectByUID";
        HashMap dataMap = new HashMap<>();
        dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object selectDetail(String CAR_INFOR_ID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectByUID";
        dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object insert(Map dataMap) {
        String sqlMapId = "CarInfors.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object update(Map dataMap) {
        String sqlMapId = "CarInfors.update";
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    // MVC view
    public Object delete(Map dataMap) {
        String sqlMapId = "CarInfors.delete";

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    public Object selectAll_Com(String COMMON_CODE_ID) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectAll_Com";
        HashMap<String, String> dataMap = new HashMap<String, String>();
        dataMap.put("COMMON_CODE_ID", COMMON_CODE_ID);
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object delete_Com(Map dataMap) {
        String sqlMapId = "CarInfors.delete_com";

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    // MVC view
    public Object deleteAndSelectSearch(String UNIQUE_ID, Map dataMap) {
        dataMap.put("CAR_INFOR_ID", UNIQUE_ID);

        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete(dataMap));

        result.putAll(this.selectSearch(dataMap));
        return result;
    }

    public Map common(Map dataMap) {
        String sqlMapId = "CarInfors.common_list";

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    public Object deleteAndSelectSearch_Com(String UNIQUE_ID, Map dataMap) {
        dataMap.put("COMMON_CODE_ID", UNIQUE_ID);

        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete_Com(dataMap));

        result.putAll(this.common(dataMap));
        return result;
    }

    public Object insert_Com(Map dataMap) {
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

    public Object insertAndSelectSearch_Com(Map dataMap) {

        HashMap result = new HashMap<>();
        result.put("insertCount", this.insert_Com(dataMap));

        result.putAll(this.common(dataMap));
        return result;
    }

    public Object update_Com(Map dataMap) {
        String sqlMapId = "CarInfors.update_com";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object updateAndSelectSearch_Com(String UNIQUE_ID, Map dataMap) {
        dataMap.put("COMMON_CODE_ID", UNIQUE_ID);

        HashMap result = new HashMap<>();
        result.put("updateCount", this.update_Com(dataMap));

        result.putAll(this.common(dataMap));
        return result;
    }

    public Object selectDetail_Com(String COMMON_CODE_ID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectByInUID_Com";
        dataMap.put("COMMON_CODE_ID", COMMON_CODE_ID);

        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
    
    // rest api
    public Object delete(String CAR_INFOR_ID) {
        String sqlMapId = "CarInfors.delete";
        HashMap dataMap = new HashMap<>();
        dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    // 2PC
    public Object insertDouble(Map dataMap) {
        String sqlMapId = "CarInfors.insert";
        // sucess
        Object result = sharedDao.insert(sqlMapId, dataMap);
        // error
        result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

}
