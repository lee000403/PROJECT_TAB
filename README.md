# 📃TEAM PROJECT (팀명: TAB) 
##  주제
- 📒 치매 환자를 위한 매칭 시스템
- 📓 병원 검색 및 커뮤니티

## TAB 프로젝트 기간 

✔️ 프로젝트 진행기간 : 2023.07.07 ~ 2023.07.31

## 개발 환경
<details>
<summary>🔧 백엔드 개발 </summary>

- JAVA 17
- SPRING BOOT
- MYBATIS
- MYSQL

</details>

<details>
<summary>🔧 프론트 개발 </summary>

 - HTML
 - CSS
 - JAVASCRIPT
 - BOOTSTRAP

</details>

## 주요 기능

😃 [로그인 기능](https://github.com/lee000403/study_springboots_gradle/blob/main/src/main/java/com/yojulab/study_springboot/security/PrincipalUserService.java)

😍 설문 및 통계 작성 코드 
        <pre>
        <code>
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
</code>
</pre>

😊 검색 기능 코드
    <pre>
    <code>
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
</code>
</pre>

## 1차 프로젝트

💛 성진아: HTML 작성 및 프로그램 리스트 작성, 검색 기능 코드 작성
* [프로그램 리스트](https://docs.google.com/spreadsheets/d/1xxuT0KH9dNd7kJxffIC4Bcai3GewpnPB1UQJuZOD4wk/edit#gid=0)

💙 최정문: HTML, ERD 작성, DB 유지 관리, 구름 서버 관리, 설문 및 통계 코드 작성
* [DB DDL](https://github.com/lee000403/study_springboots_gradle/blob/main/Docs/Databases/sqls/TOTAL_DDL.sql)

❤️ 한희수 : JS 관리 및 에러사항 수정, main 페이지 코드 작성
* [메인 페이지](https://github.com/lee000403/study_springboots_gradle/blob/main/src/main/webapp/WEB-INF/views/main_page/main_page.jsp)

💚 이동환 : 스프링 SAMPLE CODE 작성, 로그인 코드 작성, PM
* [자바 스프링](https://github.com/lee000403/study_springboots_gradle/blob/main/src/main/java/com/yojulab/study_springboot/controller/Project_TABController.java)

## 2차 프로젝트

💛 성진아: 데이터 수집, 데이터 레포트 작성


💙 최정문: DB 유지 관리, 구름 서버 관리, 빅데이터 처리


❤️ 김동현(PM) : Java, JS 코드 작성(사이트 소개, 커뮤니티 댓글 구현), 웹사이트 디자인 리뉴얼, CONTROLLER/SERVICE 개편

|Function|JSP|CSS|MAPPER|CONTROLLER|SERVICE|JS|
|---|---|---|---|---|---|---|
|Comment|[JSP](/src/main/webapp/WEB-INF/views/community/community_answer.jsp)|[CSS](/src/main/resources/static/CSSs/community_answer.css)|[MAPPER](/src/main/resources/sqlmapper/mysql/CommunityMapper.xml)|[RESTCONTROLLER](/src/main/java/com/yojulab/study_springboot/restapis/Community_write_RestController.java)|[SERVICE: answer 추가](/src/main/java/com/yojulab/study_springboot/service/CommunityService.java)|[JS](/src/main/resources/static/js/community_comment.js)|
|Intro|[JSP](/src/main/webapp/WEB-INF/views/statistics/statistics.jsp)|[CSS](/src/main/resources/static/CSSs/statistics.css)||[Controller](/src/main/java/com/yojulab/study_springboot/controller/StatisticsController.java)||[JS](/src/main/resources/static/js/statistics.js)|


💚 이동환 : Java 코드 작성(매칭 기능 구현), CONTROLLER/SERVICE 개편


## Refer

- 🔓 [Naming Rule](https://docs.google.com/spreadsheets/d/1_G0fnScj4lSqw9ThLMKuQ8byJUeYFYzNGx42o5CeTqw/edit#gid=0)
- 🎲 [ERD](https://github.com/lee000403/study_springboots_gradle/blob/main/Docs/Databases/total_erd.vuerd)


## RUN

💻 [YOUTUBE](https://www.youtube.com/watch?v=JuikXN1-NT4)

## 웹페이지 주소

🐳 [TAB의 페이지](https://project-tab-pcddi.run.goorm.site/)

## 1차 프로젝트 소감 

- 성진아 : 제가 맞은 부분을 잘  수행 하지 못하여 팀원들을. 힘들게 해 죄송한 마음 입니다.  더욱 노력 해야 겠다고 생각 했어요 
- 한희수 : 한 것도 별로 없지만, 긴 시간 프로젝트 하는 게 부담이었습니다. 맡은 부분에 대한 책임이 있다는 게 마음이 무거웠지만 , 전체적인 흐름을 볼 수 있는 시간이었습니다. 개발은 저에게 안맞는 것 같습니다.
- 최정문 : 진도를 따라가지 못한 상황에서 프로젝트를 진행하려다 보니 할 수 있는 파트가 거의 없었습니다. 테스트 코드 환경설정 및 대부분의 코드를 작성해준 PM과 챗GPT에게 감사를 돌립니다. 팀 이름처럼 정말 세 명이 버스를 탄 상황인데, 너무 미안하고 다음 프로젝트때까지도 스프링부트를 이해 못 하면 어떡하지하고 걱정이 큽니다. 그래도 좋은 주제로 프로젝트를 진행하게 된 만큼 최대한 메인 기능인 매칭 시스템만큼은 제대로 구현해내보고 싶은 마음입니다. 
- 이동환 : 이번 프로젝트를 통해 스프링에 대해 조금이나마 자세히 배울 수 있게 되었고, 첫 프로젝트인데 팀원들과 협력을 통한 좋은 결과물을 함께 만들 수 있는 좋은 시간이었던 것 같습니다.

## 2차 프로젝트 소감 