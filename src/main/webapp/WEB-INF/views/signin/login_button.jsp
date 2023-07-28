<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #fff;
      padding-top: 160px;
      @import margin: 0 auto;
      @import width : 35rem;
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
  <%@ include file="../mainbar/header.jsp" %>
  <% HashMap params=(HashMap)request.getAttribute("params");
  HashMap result=(HashMap)request.getAttribute("result"); %>
  <div class="container">
    <h1 class="mt-5 mb-4 text-center">회원가입</h1>

    
      <div class="form-group">
        <form>
          <label for="username">아이디:</label>
          <% String name = (String)params.get("username");%>
          <%if (result != null) { %>
            <input type="text" class="form-control" id="username" name="username" required>
            <button type="submit" action="/TAB_PAGE/login_button" method="post" formnovalidate>중복 확인</button>
            <div>중복입니다. 다시 입력해주세요.</div>
          <%} else {%>
            <input type="text" class="form-control" id="username" name="username" value='<%=name%>' required>
            <button type="submit" action="/TAB_PAGE/login_button" method="post" formnovalidate>중복 확인</button>
            <div>ID 사용 가능합니다.</div>
          <%}%>
      </div>
      <div class="form-group">
        <label for="password">비밀번호:</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>

      <div class="form-group">
        <label for="name">이름:</label>
        <input type="text" class="form-control" id="MEMBERNAME" name="MEMBERNAME" required>
      </div>

      <div class="form-group">
        <label for="gender">성별:</label>
        <select class="form-control" id="GENDER_ID" name="GENDER_ID" required>
          <option value="">성별 선택</option>
          <option value="G_01">남성</option>
          <option value="G_02">여성</option>
        </select>
      </div>

      <div class="form-group">
        <label for="birthdate">생년월일:</label>
        <input type="date" class="form-control" id="BIRTHDATE" name="BIRTHDATE" required>
      </div>

      <div class="form-group">
        <label for="phone">전화번호:</label>
        <input type="tel" class="form-control" id="PHONENUMBER" name="PHONENUMBER" required>
      </div>

      <div class="form-group">
        <label for="address">주소:</label>
        <input type="text" class="form-control" id="MEMBERADDRESS" name="MEMBERADDRESS" required>
      </div>

      <div class="form-group">
        <label for="email">이메일 주소:</label>
        <input type="email" class="form-control" id="EMAIL" name="EMAIL" required>
      </div>
      <label for="auth" class="sr-only">Auth</label>
      <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="auth" id="PATNER" value="ROLE_PATNER">
          <label class="form-check-label" for="PATNER">파트너</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="auth" id="DOCTOR" value="ROLE_DOCTOR">
          <label class="form-check-label" for="DOCTOR">전문의</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="auth" id="USER" value="ROLE_USER">
          <label class="form-check-label" for="USER">본인</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="auth" id="FAMILY" value="ROLE_FAMILY">
          <label class="form-check-label" for="FAMILY">가족</label>
        </div>
<div class="float-right">
      <button type="submit" class="btn btn-danger " formaction="/joinProc" formmethod="post">회원가입</button>
    </div>
    </form>
  </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>