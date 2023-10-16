<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Search</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">
      <link rel="stylesheet" href="/CSSs/detail_hospital.css">
    </head>

    <%@ include file="../mainbar/header.jsp" %>


      <body>
        <% HashMap params=(HashMap)request.getAttribute("params"); String
          searchStr=(String)params.getOrDefault("search", "" ); HashMap result=(HashMap)request.getAttribute("result");
          %>
          <% Paginations paginations=(Paginations)result.get("paginations"); %>
            <div class="container">
              <h2 class="mt-5">🏥 치매시설정보</h2>
              <div class="container m-4">
                <div class="row justify-content-center">
                  <div class="">
                    <div class="input-group-append input_group">
                      <form action="">
                        <div class="input-group">
                          <select class="form-select" name="search">
                            <option>선택</option>
                            <option value="CENTER_NAME" <%=(searchStr.equals("CENTER_NAME")) ? "selected" : "" %>>시설명
                            </option>
                            <option value="CENTER_ADD" <%=(searchStr.equals("CENTER_ADD")) ? "selected" : "" %>
                              >주소</option>
                          </select>
                          <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                            class="form-control" placeholder="검색어를 입력하세요" id="keydownEnter" style="width : 200px;">
                          <button class="btn" type="submit" formaction='/TAB_PAGE/search_page/' formmethod="post"
                            style="background-color:#ff7f95;">검색</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>

              <table class="main_table">
                <thead>
                  <tr>
                    <th>시설명/주소</th>
                    <th>전화번호</th>
                  </tr>
                </thead>

                <% ArrayList resultList=(ArrayList)result.get("resultList"); for(int i=0; i < resultList.size(); i=i+1){
                  HashMap record=(HashMap)resultList.get(i); %>
                  <tbody>
                    <tr>
                      <td>
                        <%= record.get("CENTER_NAME") %>
                          <br>
                          <%= record.get("CENTER_ADD") %>

                      </td>
                      <td>
                        <%= record.get("CENTER_NUM") %>
                      </td>
                    </tr>
                  </tbody>
                  <% } %>
              </table>
              <form action='/TAB_PAGE/search_page/<%=params.getOrDefault("currentPage","")%>' method="post">
                <button class="btn" type="submit" style="background-color:#ff7f95; text-align: center;">뒤로가기</button>
              </form>
            </div>
      </body>

      <%@ include file="../mainbar/footer.jsp" %>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    </html>