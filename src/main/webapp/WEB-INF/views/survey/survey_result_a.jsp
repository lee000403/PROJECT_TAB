<%@ page import="java.util.HashMap, java.util.Map, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html>
  <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
      ul {
        list-style-type: none;
      }

      .lis {
        display: grid;
        grid-template-columns: 2fr 2fr 3fr;
        /* Adjusted column widths */
        align-items: flex-start;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        padding: 20px;
        cursor: pointer;
      }

      .partner-image {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        margin-right: 20px;
      }


      
  .main-title {
    text-align: center;
    margin: 100px 0; /* Adjusted margin to give space */
    font-size: 2rem; /* Responsive font size */
    font-weight: bold;
  }

      .partner-name {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
      }

      .partner-info {
        display: flex;
        flex-direction: column;
        font-size: 16px;
        line-height: 2;
      }
    </style>
  </head>
    <body>
      <%@ include file="../mainbar/header.jsp" %>
      <% HashMap params=(HashMap)request.getAttribute("params");
      HashMap result=(HashMap)request.getAttribute("result");
      %>
      <div class="container">
        <div class="main-title">작성하신 요청 사항에 가장 가까운 파트너를 찾았어요</div>
        <ul>
          <% ArrayList<HashMap<String, Object>> result_arr = (ArrayList<HashMap<String, Object>>) result.get("survey_member");
            for (HashMap<String, Object> arr_map : result_arr) {
            String arr_result = (String)arr_map.get("MEMBERTYPE_ID");
            if ("M_01".equals(arr_result)) {
                continue;
            }
        %>
          <li class="lis">
            <div>
              <button class="partner-button" formaction="/TAB_PAGE/home/" formmethod="post">
                <%String gender = (String) arr_map.get("GENDER_ID");
                      if (gender.equals("G_01")) { %>
                        <img class="partner-image" src="/images/partner_1.JPG" alt="partner 1">
                      <%} else { %>
                        <img class="partner-image" src="/images/partner_2.JPG" alt="partner 2">
                      <% } %>
                
              </button>
            </div>
            <div class="partner-info">
              <div class="partner-name"><%= arr_map.get("MEMBERNAME") %></div>
              <div>
                <div><%
                      if (gender.equals("G_01")) { %>
                        남성
                      <%} else { %>
                        여성
                      <% } %></div>
                <div>주소: <%= arr_map.get("MEMBERADDRESS") %></div>
              </div>
            </div>
            <div class="partner-info">
              <% String member_id = (String) arr_map.get("MEMBERID"); %>
              <% ArrayList<HashMap<String, Object>> partner_arr = (ArrayList<HashMap<String, Object>>) result.get("survey_partner");
              for (HashMap<String, Object> partner_map : partner_arr) {
                
                if (partner_map.get("MEMBERID").equals(member_id)) {
                  if (partner_map.get("SURVEY_Q_ID").equals("SURQ08")) { %>
                    <div>원하는 성별: 
                    <%= partner_map.get("SURVEY_ANS") %>
                    </div>
                  <% } else if (partner_map.get("SURVEY_Q_ID").equals("SURQ09")) { %>
                    <div>근무 유형: <%= partner_map.get("SURVEY_ANS") %></div> 
                  <% } else if (partner_map.get("SURVEY_Q_ID").equals("SURQ10")) { %>
                    <div>고용 형태: <%= partner_map.get("SURVEY_ANS") %></div>
                  <% } else if (partner_map.get("SURVEY_Q_ID").equals("SURQ11")) { %>
                    <div>동행 가능한 환자의 치매 단계: <%= partner_map.get("SURVEY_ANS") %></div>
                  <% } else if (partner_map.get("SURVEY_Q_ID").equals("SURQ12")) { %>
                    <div>선호하는 지역: <%= partner_map.get("SURVEY_ANS") %></div>
                  <% } else if (partner_map.get("SURVEY_Q_ID").equals("SURQ14")) { %>
                    <div>차량 또는 면허: <%= partner_map.get("SURVEY_ANS") %></div>
                  <% } else if (partner_map.get("SURVEY_Q_ID").equals("SURQ15")) { %>
                    <div>자격증: <%= partner_map.get("SURVEY_ANS") %></div>
                  <%
                  }
                }
              }
              %>
            </div>
          </li>
          <% } %>
        </ul>
        
      </div>
      <form action="">
        <div style="text-align: center;">
          <button style="background-color: #ff7f95; color: white; font-size: 1.2rem; padding: 10px 20px; border: none; border-radius: 5px;" formaction="/TAB_PAGE/survey_a" formmethod="">다시찾기</button>
        </div>
      </form>
         
    </body>
    <%@ include file="../mainbar/footer.jsp" %>

  </html>