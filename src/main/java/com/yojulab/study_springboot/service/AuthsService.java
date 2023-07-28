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

@Service
@Transactional
public class AuthsService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    CommonUUID commonUtils;

    public Object insert(Map dataMap) {
        List authList = new ArrayList<>();
        String auth = (String) dataMap.get("auth");
        if (auth.equals("M_04")) {
            authList.add("ROLE_DOCTOR");
            authList.add("ROLE_GUEST");
            authList.add("ROLE_USER");
        } else if (auth.equals("M_02")) {
            authList.add("ROLE_GUEST");
        } else if (auth.equals("M_01")) {
            authList.add("ROLE_USER");
        } else if (auth.equals("M_03")) {
            authList.add("ROLE_PARTNER");
        }
        dataMap.put("authList", authList);

        String sqlMapId = "Auths.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Map selectWithUSERNAME(Map dataMap) {
        String sqlMapId = "Auths.selectWithUSERNAME";
        
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
}
