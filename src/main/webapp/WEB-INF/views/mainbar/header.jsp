<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

  <header>
    <nav>
      <div style="background-color: rgb(255, 255, 255);">
        <ul class="h-navbar flex-row">
          <li class="h-nav-item">
            치매파트너와의 연결 그리고 동행
          </li>
          <form action="/TAB_PAGE/signin_select_page" method="">
            <li class="nav-item">
              <a class="nav-link" href="/TAB_PAGE/signin_select_page">회원가입</a>
            </li>
          </form>
          <form action="/TAB_PAGE/login_page" method="">
            <li class="nav-item">
              <a class="nav-link" href="/TAB_PAGE/login_page">로그인</a>
            </li>
          </form>
        </ul>
      </div>
    </nav>

    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <form action="/TAB_PAGE/home/" method="">
          <a href="/TAB_PAGE/home/">
            <img src="/images/mainlogo.png" alt="Logo">
          </a>
        </form>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
          <ul class="navbar-nav">
            <form action="/TAB_PAGE/survey_a" method="">
              <li class="nav-item nav-button">
                <a class="nav-link" href="/TAB_PAGE/survey_a">One-click</a>
              </li>
            </form>
            <form action="/TAB_PAGE/search_page" method="">
              <li class="nav-item nav-button">
                <a class="nav-link" href="/TAB_PAGE/search_page">센터검색</a>
              </li>
            </form>
            <form action="/TAB_PAGE/self_test" method="">
              <li class="nav-item nav-button">
                <a class="nav-link" href="/TAB_PAGE/self_test">자가진단</a>
              </li>
            </form>
            <form action="/TAB_PAGE/community" method="">
              <li class="nav-item nav-button">
                <a class="nav-link" href="/TAB_PAGE/community">커뮤니티</a>
              </li>
            </form>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  </body>