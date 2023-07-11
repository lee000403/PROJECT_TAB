package com.yojulab.study_springboot.restapis;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.yojulab.study_springboot.service.HelloWorldService;

@Controller
public class HelloWorldController {
    @Autowired
    HelloWorldService helloWorldService;

    @GetMapping("/helloWorld")
    public int helloWorld() {
        return 0;
    }

    // /helloWorldGetRequest?Name=yojulab&Id=U-01
    // /helloWorldGetRequest/yojulab/U-01
    @GetMapping("/helloWorldGetRequest/{name}/{Id}")
    public int helloWorldGetRequest(@PathVariable String name, @PathVariable String Id) {
        return 0;
    }

    // ?serviceKey=BoygPZjC27pxm92hSposjnSob2u36vziS1rzIzxkrL9QxmlhB0SMARwLfNlBE3wrE7nnw34zLmmv0a6amvW4xg%3D%3D
    // &currentPage=1
    // &perPage=10
    // &SN=1
    // /helloWorldResponse/1/10/1
    @GetMapping("/helloWorldResponse/{currentPage}/{perPage}/{SN}")
    public ResponseEntity<Object> helloWorldResponse(@PathVariable String currentPage, @PathVariable String perPage,
            @PathVariable String SN) {
        // "spm_row": 471, "SN": 1, "CMPNM": "로이유통", "RDNMADR": null
        HashMap resultMap = new HashMap<>();
        resultMap.put("spm_row", 471);
        resultMap.put("SN", 1);
        resultMap.put("CMPNM", "로이유통");
        resultMap.put("RDNMADR", null);

        return ResponseEntity.ok().body(resultMap);
    }

    // /helloWorldResponseList/1/10/1
    @GetMapping("/helloWorldResponseList/{currentPage}/{perPage}/{SN}")
    public ResponseEntity<Object> helloWorldResponseList(@PathVariable String currentPage, @PathVariable String perPage,
            @PathVariable String SN) {
        // "spm_row": 471, "SN": 1, "CMPNM": "로이유통", "RDNMADR": null
        // "spm_row": 571, "SN": 2, "CMPNM": "의료유통", "RDNMADR": 3
        ArrayList arrayList = new ArrayList<>();
        HashMap resultMap = new HashMap<>();
        resultMap.put("spm_row", 471);
        resultMap.put("SN", 1);
        resultMap.put("CMPNM", "로이유통");
        resultMap.put("RDNMADR", null);
        arrayList.add(resultMap);

        resultMap = new HashMap<>();
        resultMap.put("spm_row", 571);
        resultMap.put("SN", 2);
        resultMap.put("CMPNM", "의료유통");
        resultMap.put("RDNMADR", 3);
        arrayList.add(resultMap);

        return ResponseEntity.ok().body(arrayList);
    }

    // /helloWorldResponseWithService/1/10/1
    @GetMapping("/helloWorldResponseWithService/{currentPage}/{perPage}/{SN}")
    public ResponseEntity<Object> helloWorldResponseWithService(@PathVariable String currentPage,
            @PathVariable String perPage, @PathVariable String SN) {
        ArrayList arrayList = new ArrayList<>();
        arrayList = helloWorldService.fakeSelect(currentPage, perPage);
        return ResponseEntity.ok().body(arrayList);
    }

    // /helloWorldResponseFake/C001
    @GetMapping("/helloWorldResponseFake/{companyId}")
    public ResponseEntity<Object> helloWorldResponseFake(@PathVariable String companyId) {
        ArrayList arrayList = new ArrayList<>();
        helloWorldService.fakeSelect(companyId);
        return ResponseEntity.ok().body(arrayList);
    }

    // /helloWorldResponseFakeWithExcepation/C001
    @GetMapping("/helloWorldResponseFakeWithExcepation/{companyId}")
    public ResponseEntity<Object> helloWorldResponseFakeWithExcepation(@PathVariable String companyId) {
        ArrayList arrayList = new ArrayList<>();
        try {
            helloWorldService.fakeSelect(companyId);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return ResponseEntity.badRequest().body("Error: ");

        }
        return ResponseEntity.ok().body(arrayList);
    }
}
