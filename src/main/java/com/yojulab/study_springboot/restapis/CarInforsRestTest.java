package com.yojulab.study_springboot.restapis;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yojulab.study_springboot.service.CarInforsService;

@RestController
public class CarInforsRestTest {
    @Autowired
    CarInforsService carInforsService;

    @GetMapping("/selectAll_Com/{COMMON_CODE_ID}")
    public ResponseEntity selectAll_Com(@PathVariable String COMMON_CODE_ID) {
        Object result = carInforsService.selectAll_Com(COMMON_CODE_ID);
        return ResponseEntity.ok().body(result);
    }
}
