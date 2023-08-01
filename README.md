# 📃TEAM PROJECT (팀명: TAB) 
##  주제
- 📒 치매 환자를 위한 매칭 시스템
- 📓 병원 검색 및 커뮤니티

## TAB 프로젝트 기간 

✔️ 프로젝트 진행기간 : 2023.07.07 ~ 2023.07.31

## 개발 환경
<details>
<summary>🔧 백엔드 개발 </summary>
+JAVA 17
+SPRING BOOT
+MYBATIS
+MYSQL
</details>

<details>
<summary>🔧 프론트 개발 </summary>
+HTML
+CSS
+JAVASCRIPT
+BOOTSTRAP
</details>

## 주요 기능

😃 [로그인 기능](https://github.com/lee000403/study_springboots_gradle/blob/main/src/main/java/com/yojulab/study_springboot/security/PrincipalUserService.java)
😍 설문 및 통계 작성 코드 
        ```
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
        ```
😊 검색 기능 코드
        ```
        public Object selectSearchWithPagination(String page, Map dataMap) {
            int totalCount = 0;
            totalCount = (int) this.selectTotal(dataMap);
            page = (String) dataMap.get("currentPage");
            int currentPage = 1;
            if (page != null) {
                currentPage = Integer.parseInt((String) page); // from client in param
            }

            Paginations paginations = new Paginations(totalCount, currentPage);
            HashMap result = new HashMap<>();
            result.put("paginations", paginations); // 페이지에 대한 정보
            String sqlMapId = "Project_TAB.selectSearchWithPagination";
            dataMap.put("pageScale", paginations.getPageScale());
            dataMap.put("pageBegin", paginations.getPageBegin());

            if (dataMap.get("words") == null) {
                dataMap.put("words", "");
            }

            result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
            return result;
        }

            public Object selectTotal(Map dataMap) {
            // Object getOne(String sqlMapId, Object dataMap)
            String sqlMapId = "Project_TAB.selectTotal";

            Object result = sharedDao.getOne(sqlMapId, dataMap);
            return result;
        }
        ```

## 멤버 구성 및 역할

💛 성진아: HTML 작성 및 프로그램 리스트 작성, 검색 기능 코드 작성
* [프로그램 리스트](https://docs.google.com/spreadsheets/d/1xxuT0KH9dNd7kJxffIC4Bcai3GewpnPB1UQJuZOD4wk/edit#gid=0)

💙 최정문: HTML, ERD 작성, DB 유지 관리, 구름 서버 관리, 설문 및 통계 코드 작성
* [DB DDL](https://github.com/lee000403/study_springboots_gradle/blob/main/Docs/Databases/sqls/TOTAL_DDL.sql)

❤️ 한희수 : JS 관리 및 에러사항 수정, main 페이지 코드 작성
* [메인 페이지](https://github.com/lee000403/study_springboots_gradle/blob/main/src/main/webapp/WEB-INF/views/main_page/main_page.jsp)

💚 이동환 : 스프링 SAMPLE CODE 작성, 로그인 코드 작성, PM
* [자바 스프링](https://github.com/lee000403/study_springboots_gradle/blob/main/src/main/java/com/yojulab/study_springboot/controller/Project_TABController.java)

## Refer

- 🔓 [Naming Rule](https://docs.google.com/spreadsheets/d/1_G0fnScj4lSqw9ThLMKuQ8byJUeYFYzNGx42o5CeTqw/edit#gid=0)
- 🎲 [ERD](https://github.com/lee000403/study_springboots_gradle/blob/main/Docs/Databases/total_erd.vuerd)


## RUN

💻 [YOUTUBE](https://www.youtube.com/watch?v=JuikXN1-NT4)

## 웹페이지 주소

🐳 [TAB의 페이지](https://project-tab-pcddi.run.goorm.site/)

## 프로젝트 소감 

- 성진아 : 
- 이동환 : PM이였지만 코드 짜는 것에 너무 집중을 해서 PM 역할을 못해서 팀원들한테 죄송하고 PM의 역할이 얼마나 힘든지 프로젝트를 하면서 느끼게 되었습니다.