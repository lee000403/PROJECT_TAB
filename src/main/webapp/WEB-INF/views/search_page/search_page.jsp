<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Search</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">


      <style>
        body {
          background-color: #fff;
          padding-top: 160px;
        }

        .navbar {
          justify-content: flex-end;
        }

        .navbar-nav {
          display: flex;
          align-items: center;
        }

        .navbar-nav .nav-item {
          margin-right: 10px;
        }

        .h-navbar {
          display: flex;
          justify-content: space-between;
          align-items: center;
          list-style: none;
        }

        .h-navbar .h-nav-item:first-child {
          margin-right: auto;
          font-size: 16px;
          line-height: 8px;
          list-style: none;
        }


        .navbar .nav-link {
          padding: 0;
          margin: 0;
          font-size: 16px;
          line-height: 8px;
          color: #000000ab;
        }

        .navbar .nav-link:hover {
          background-color: transparent;
          font-size: 16px;
          line-height: 8px;
        }

        .navbar-brand img {
          height: 80px;
        }

        .nav-button {
          display: inline-block;
          padding: 20px 20px;
          background-color: transparent;
          color: #000;
          border-radius: 5px;
          text-decoration: none;
          font-weight: bold;
          border: 1px solid #00000098;
        }

        header {
          position: fixed;
          background-color: #fef0ea;
          top: 0;
          left: 0;
          width: 100%;
          z-index: 100;
        }
      </style>

    </head>

    <%@ include file="../mainbar/header.jsp" %>

      <body>

        <!DOCTYPE html>
        <html>

        <head>
          <title>치매시설정보</title>
          <style>
            body {
              font-family: Arial, sans-serif;
              text-align: center;
            }

            .container {
              margin-top: 40px;
            }

            .input-group {
              margin-bottom: 20px;
            }

            .form-control {
              width: 60%;
            }

            .btn-search {
              background-color: rgba(221, 43, 43, 0.897);
              color: #fff;
            }

            table {
              width: 100%;
              border-collapse: collapse;
            }

            th,
            td {
              padding: 10px;
              border: 1px solid #ccc;
            }

            th {
              background-color: #f2f2f2;
              font-weight: bold;
            }

            tr:nth-child(even) {
              background-color: #f9f9f9;
            }

            tr:hover {
              background-color: #ebebeb;
            }

            .textname {
              font-weight: bold;
              font-size: large;
              text-align: left;

            }

            .textnayong {
              text-align: left;

            }
          </style>
        </head>

        <body>
          <% HashMap params=(HashMap)request.getAttribute("params"); String
            searchStr=(String)params.getOrDefault("search", "" ); HashMap
            result=(HashMap)request.getAttribute("result"); %>
            <div class="container">
              <div>
                <h2>🏥 치매시설정보</h2>
              </div>
              <br>
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-8 col-md-6 col-lg-4">
                    <div class="input-group-append">
                      <form action="">
                        <select class="form-select" name="search">
                          <option>Select an option...</option>
                          <option value="CENTER_NAME" <%=(searchStr.equals("CENTER_NAME")) ? "selected" : "" %>>시설명
                          </option>
                          <option value="CENTER_ADD" <%=(searchStr.equals("CENTER_ADD")) ? "selected" : "" %>
                            >주소</option>
                        </select>
                        <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                          class="form-control" placeholder="Search..." id="keydownEnter">
                        <button class="btn btn-primary" type="submit" formaction='/TAB_PAGE/search_page/'
                          formmethod="post">검색</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <br>
            <table>
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
                        <div>
                          <%= record.get("CENTER_NAME") %>
                        </div>
                        <div>
                          <%= record.get("CENTER_ADD") %>
                        </div>
                      </td>
                      <td>
                        <%= record.get("CENTER_NUM") %>
                      </td>
                      <td>
                        <form action="">
                          <button type="submit"
                            formaction='/TAB_PAGE/hospital_selectDetail/<%= record.get("CENTER_TYPE_ID")%>/<%=paginations.getCurrentPage()%>'
                            formmethod="post">상세</button>
                        </form>
                      </td>
                      </td>
                    </tr>
                  </tbody>
                  <% } %>
            </table>

            <div style="display: flex; justify-content: center; margin-top: 20px;">
              <nav aria-label="Page navigation">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link"
                      href='/TAB_PAGE/search_page/?currentPage=<%=paginations.getPreviousPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'>
                      Previous
                    </a>
                  </li>
                  <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
                    <li class="page-item">
                      <a class="page-link"
                        href='/TAB_PAGE/search_page/?currentPage=<%=i%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'>
                        <%= i %>
                      </a>
                    </li>
                    <% } %>
                      <li class="page-item">
                        <a class="page-link"
                          href='/TAB_PAGE/search_page/?currentPage=<%=paginations.getNextPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'>
                          Next
                        </a>
                      </li>
                </ul>
              </nav>
            </div>
        </body>

        <%@ include file="../mainbar/footer.jsp" %>

        </html>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      </body>

    </html>

    <!-- https://www.nid.or.kr/info/facility_list.aspx# -->