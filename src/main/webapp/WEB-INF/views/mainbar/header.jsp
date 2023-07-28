<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page
    import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations, com.yojulab.study_springboot.utills.CommonUUID"
    %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>치매 One-click System</title>
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

<body>
  <header>
    <sec:authentication property="principal" var="userDetailsBean" />
    <nav>
      <div style="background-color: rgb(255, 255, 255);">
        <ul class="h-navbar flex-row">
          <li class="h-nav-item">
            치매파트너와의 연결 그리고 동행
          </li>
          <sec:authorize access="isAnonymous()">
              <form>
                <li class="nav-item">
                  <button type="submit" class="btn btn-link" formaction="/joinForm" formmethod="post">회원가입</button>
                </li>
                <li class="nav-item">
                  <button type="submit" class="btn btn-link" formaction="/loginForm" formmethod="get">로그인</button>
                </li>
              </form>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
              id : ${userDetailsBean.username}
              <form>
                <li class="nav-item">
                  <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/mypage/${userDetailsBean.username}" formmethod="post">마이 페이지</button>
                </li>
              </form>

              <form>
                <li class="nav-item">
                  <button type="submit" class="btn btn-link" formaction="/logout" formmethod="post">로그아웃</button>
                </li>
              </form>
            </sec:authorize>
        </ul>
      </div>
    </nav>

    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <sec:authorize access="isAnonymous()">
          <form>
            <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/home/" formmethod="post">
              <img src="/images/mainlogo.png" alt="Logo">
            </button>
          </form>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <form>
            <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/home_after/" formmethod="post">
              <img src="/images/mainlogo.png" alt="Logo">
            </button>
          </form>
        </sec:authorize>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
          <ul class="navbar-nav">
            <form>
              <li class="nav-item nav-button">
                <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/survey_a" formmethod="post">One-click</button>
              </li>
            </form>
            <form>
              <li class="nav-item nav-button">
                <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/search_page/" formmethod="post">센터검색</button>
              </li>
            </form>
            <form action="/TAB_PAGE/self_test" method="post">
              <sec:authorize access="isAnonymous()">
                <li class="nav-item nav-button">
                  <a class="nav-link" href="/loginForm">자가진단</a>
                </li>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
              <li class="nav-item nav-button">
                <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/self_test/${userDetailsBean.username}" formmethod="post">자가진단</button>
              </li>
            </sec:authorize>
            </form>
            <form action="">
              <li class="nav-item nav-button">
                <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/search_community/" formmethod="post">커뮤니티</button>
              </li>
            </form>
          </ul>
        </div>
      </div>
    </nav>

        </header>
      </body>

      </html>