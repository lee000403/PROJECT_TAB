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
        <link rel="stylesheet" href="/CSSs/header.css">
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
                      <button type="submit" class="btn btn-none" formaction="/joinForm" formmethod="post">회원가입</button>
                    </li>
                  </form>
                  <form>
                    <li class="nav-item">
                      <button type="submit" class="btn btn-none" formaction="/loginForm" formmethod="get">로그인</button>
                    </li>
                  </form>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                  id : ${userDetailsBean.username}
                  <form>
                    <li class="nav-item">
                      <button type="submit" class="btn btn-none"
                        formaction="/TAB_PAGE/mypage/${userDetailsBean.username}" formmethod="post">마이페이지</button>
                    </li>
                  </form>

                  <form>
                    <li class="nav-item">
                      <button type="submit" class="btn btn-none" formaction="/logout" formmethod="post">로그아웃</button>
                    </li>
                  </form>
                </sec:authorize>
              </ul>
            </div>
          </nav>

          <nav class="navbar navbar-expand-lg items">
            <div class="container headline">
              <sec:authorize access="isAnonymous()">
                <form>
                  <div class="logo_btn">
                  <button type="submit" class="btn btn-none justify-content-center" formaction="/TAB_PAGE/home/" formmethod="post">
                    <img src="/images/mainlogo.png" alt="Logo" class="logo-image">
                  </button>
                </div>
                </form>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
                <form>
                  <button type="submit" class="btn btn-none" formaction="/TAB_PAGE/home_after/" formmethod="post">
                    <img src="/images/mainlogo.png" alt="Logo" class="logo-image">
                  </button>
                </form>
              </sec:authorize>
              <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                  <form>
                    <sec:authorize access="isAnonymous()">
                      <li class="nav-item nav-button">
                        <button type="submit" class="btn btn-none" formaction="/loginForm"
                          formmethod="get">One-click</button>
                      </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_GEUST')">
                      <li class="nav-item nav-button">
                        <button type="submit" class="btn btn-none" formaction="/TAB_PAGE/survey_a/${userDetailsBean.username}"
                          formmethod="post">One-click</button>
                      </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_PARTNER')">
                      <li class="nav-item nav-button">
                        <button type="submit" class="btn btn-none" formaction="/TAB_PAGE/survey_b/${userDetailsBean.username}"
                          formmethod="post">One-click</button>
                      </li>
                    </sec:authorize>
                  </form>
                  <form>
                    <li class="nav-item nav-button">
                      <button type="submit" class="btn btn-none" formaction="/TAB_PAGE/statistics"
                        formmethod="post">사이트소개</button>
                    </li>
                    <li class="nav-item nav-button">
                      <button type="submit" class="btn btn-none" formaction="/TAB_PAGE/search_page/"
                        formmethod="post">센터검색</button>
                    </li>
                  </form>
                  <form action="/TAB_PAGE/self_test" method="post">
                    <sec:authorize access="isAnonymous()">
                      <li class="nav-item nav-button">
                        <button type="submit" class="btn btn-none" formaction="/loginForm"
                          formmethod="get">자가진단</button>
                      </li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                      <li class="nav-item nav-button">
                        <button type="submit" class="btn btn-none"
                          formaction="/TAB_PAGE/self_test/${userDetailsBean.username}" formmethod="post">자가진단</button>
                      </li>
                    </sec:authorize>
                  </form>
                  <form action="">
                    <li class="nav-item nav-button">
                      <button type="submit" class="btn btn-none" formaction="/TAB_PAGE/search_community/"
                        formmethod="post">커뮤니티</button>
                    </li>
                  </form>
                </ul>
              </div>
            </div>
          </nav>

        </header>
      </body>

      </html>