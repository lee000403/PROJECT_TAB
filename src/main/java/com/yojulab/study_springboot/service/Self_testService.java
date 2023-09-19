package com.yojulab.study_springboot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yojulab.study_springboot.dao.SharedDao;
import com.yojulab.study_springboot.utills.CommonUUID;

@Service
@Transactional
public class Self_testService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    CommonUUID commonUUID;

    // self_test insert 부분
    public Object self_testInsert(String useraname, Map dataMap) {
        String sqlMapId = "Project_TAB.insert_selfTest";
        dataMap.put("MEMBERID", useraname);
        ArrayList arr = new ArrayList<>();
        arr = (ArrayList) this.select_selfTest(dataMap);
         HashMap result = new HashMap<>();
        HashMap record = new HashMap<>();
        for (int i = 0; i < arr.size(); i++) {
            record = (HashMap) arr.get(i);
            dataMap.put("ST_QNA_CODE", record.get("ST_QNA_CODE"));
            result.put("insertCount", sharedDao.insert(sqlMapId, dataMap));
        }

        int a = (int) result.get("insertCount");

        if (a < 7) {
            this.self_testUpdateA(dataMap);
        } else if (7 <= a & a <= 9) {
            this.self_testUpdateB(dataMap);
        } else {
            this.self_testUpdateC(dataMap);
        }

        result.putAll((Map) this.select_selfTest_sum(useraname, dataMap));
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

    public Object self_test_delete(String username, Map dataMap) {
        String sqlMapId = "Project_TAB.self_test_delete";
        dataMap.put("MEMBERID", username);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }
}
