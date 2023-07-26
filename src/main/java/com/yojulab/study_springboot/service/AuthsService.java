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
        if (dataMap.get("auth").equals("ROLE_DOCTOR")) {
            authList.add("ROLE_GUEST");
            authList.add("ROLE_PARTNER");
            authList.add("ROLE_USER");
        } else if (dataMap.get("auth").equals("ROLE_GUEST")) {
            authList.add("ROLE_USER");
        }
        authList.add(dataMap.get("auth"));  // choosed auth
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
