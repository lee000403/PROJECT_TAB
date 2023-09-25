package com.yojulab.study_springboot.restapis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.yojulab.study_springboot.service.CommunityService;

@RestController
public class Community_write_RestController {
    
    @Autowired
    CommunityService communityService;
}
