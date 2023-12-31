<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">
      <link rel="stylesheet" href="/CSSs/search_page.css">
      <title>Search</title>
    </head>

    <body>
      <%@ include file="../mainbar/header.jsp" %>
        <% HashMap params=(HashMap)request.getAttribute("params"); String
          searchStr=(String)params.getOrDefault("search", "" ); HashMap result=(HashMap)request.getAttribute("result");
          %>
          <div class="container">
            <br>
            <div>
              <h2 class="mt-5">🏥 치매시설정보</h2>
            </div>
            <br>
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-8 col-md-6 col-lg-4">
                  <form action="">
                    <div class="input-group">
                      <select class="form-select" name="search">
                        <option class="select_button">선택</option>
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

          <div class="container mt-4 mb-4">
            <table class="table">
              <thead>
                <tr>
                  <th>시설명/주소</th>
                  <th>전화번호</th>
                  <th>상세보기</th>
                </tr>
              </thead>
              <% Paginations paginations=(Paginations)result.get("paginations"); %>
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
                      <td>
                        <form action="">
                          <button class="btn" type="submit"
                            formaction='/TAB_PAGE/hospital_selectDetail/<%= record.get("CENTER_TYPE_ID")%>/<%=paginations.getCurrentPage()%>'
                            formmethod="post" style="background-color:#ff7f95;">상세</button>
                        </form>
                      </td>
                      </td>
                    </tr>
                  </tbody>
                  <% } %>
            </table>
          </div>

          <div style="display: flex; justify-content: center; margin-top: 40px;">
            <nav aria-label="Page navigation">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link"
                    href='/TAB_PAGE/search_page/?currentPage=<%=paginations.getPreviousPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'
                    style="color: #ff7f95;">
                    이전
                  </a>
                </li>
                <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
                  <li class="page-item">
                    <a class="page-link"
                      href='/TAB_PAGE/search_page/?currentPage=<%=i%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'
                      style="color: #ff7f95;">
                      <%= i %>
                    </a>
                  </li>
                  <% } %>
                    <li class="page-item">
                      <a class="page-link"
                        href='/TAB_PAGE/search_page/?currentPage=<%=paginations.getNextPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'
                        style="color: #ff7f95;">
                        다음
                      </a>
                    </li>
              </ul>
            </nav>
          </div>

          <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
          <!-- <script src="../../../../resources/static/js/retrieve_mongo.js"></script> -->
    </body>
    <%@ include file="../mainbar/footer.jsp" %>

    </html>

    <!-- https://www.nid.or.kr/info/facility_list.aspx# -->