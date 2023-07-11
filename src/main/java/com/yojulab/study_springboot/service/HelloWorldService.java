package com.yojulab.study_springboot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yojulab.study_springboot.dao.SharedDao;

@Service
public class HelloWorldService {
    @Autowired
    SharedDao sharedDao;
    public int fakeSelect(String companyId){
        HashMap dataMap = new HashMap<>();
        dataMap.put("companyId", companyId);
        sharedDao.getOne("fake.selectByUID", dataMap);
        return 0;
    }

    public ArrayList fakeSelect(String currentPage, String perPage){
        // "spm_row": 471, "SN": 1, "CMPNM": "로이유통", "RDNMADR": null
        // "spm_row": 571, "SN": 2, "CMPNM": "의료유통", "RDNMADR": 3
        ArrayList arrayList = new ArrayList<>();
        HashMap resultMap = new HashMap<>();
        resultMap.put("spm_row", 471);        resultMap.put("SN", 1);
        resultMap.put("CMPNM", "로이유통");    resultMap.put("RDNMADR", null);
        arrayList.add(resultMap);

        resultMap = new HashMap<>();
        resultMap.put("spm_row", 571);        resultMap.put("SN", 2);
        resultMap.put("CMPNM", "의료유통");    resultMap.put("RDNMADR", 3);
        arrayList.add(resultMap);

        return arrayList;
    }
}
