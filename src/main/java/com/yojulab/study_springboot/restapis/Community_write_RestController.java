package com.yojulab.study_springboot.restapis;

import java.util.List;
import java.util.Map;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yojulab.study_springboot.service.CommunityService;

@RestController
public class Community_write_RestController {
    
    @Autowired
    CommunityService communityService;

    @PostMapping("/insertComment")
    public ResponseEntity insert(@RequestBody Map paramMap){
        Object result = communityService.insertComment(paramMap);
        return ResponseEntity.ok().body(result);
    }

    @DeleteMapping("/deleteComment")
    public ResponseEntity delete (@RequestBody Map paramMap) {
        Object result = communityService.deleteComment(paramMap);
        return ResponseEntity.ok().body(result);
    }

}
