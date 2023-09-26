<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
  <title>Login</title>
  <style>
  body, html {
    height: 100%;
    margin: 0;
  }

  .container {
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .card {
    width: 500px;
    max-width: 90%;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 30px;
    margin: auto; /* Add margin:auto to center horizontally */
  }

  .text-center {
    text-align: center;
  }
  </style>
</head>

<body>
  <%@ include file="../mainbar/header.jsp" %>
  <%  HashMap result=(HashMap)request.getAttribute("result");
      HashMap params=(HashMap)request.getAttribute("params"); 
  %>

  <div class="container">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-center">회원 로그인</h5>
        <form action="/login" method="post">
          <%
            String username = request.getParameter("username");
          %>
          <div class="mb-3">
            <label for="username" class="form-label">아이디</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요">
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">패스워드</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="패스워드를 입력하세요">
          </div>
          <div class="d-grid gap-2" id="">
            <button type="submit" class="btn" style="background-color:  #ff7f95; font-weight: 530;" >Log in</button>
            <%
            if (params != null) {
            if (params.size() != 0) {
              String str_fail = (String)params.get("fail");
              if (str_fail.equals("true")) { %>
                <div style="font-size: 15px; text-align: center;" class="text-danger">아이디, 비밀번호를 확인해 주세요.</div>
            <%
              }
            }
          }
            %>
          </div>
        </form>
        <form action="/joinForm" method="post">
          <div class="text-center mt-3">
            <p>회원이 아니신가요 ? <button type="submit" class="btn btn-link text-decoration-none" style="color: #ff7f95;">회원가입</button></p>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
