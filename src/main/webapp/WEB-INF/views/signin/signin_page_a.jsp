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
        @import width: 35rem;
      }
    </style>
    
  </head>

  <body>
    <%@ include file="../mainbar/header.jsp" %>
    <% HashMap params=(HashMap)request.getAttribute("params");
    HashMap result=(HashMap)request.getAttribute("result"); %>
      <div class="container">
        <h1 class="mt-5 mb-4 text-center">회원가입</h1>

        <form>
          <div class="form-group">
            <label for="username">아이디:</label>
            <input type="text" class="form-control" id="username" name="username" required>
            <button onclick="fetchloginbutton()" style="background-color:#ff7f95;">중복 확인</button>
            <div id="updateDiv"></div>
          </div>
        </form>
        <form>
          <div class="form-group">
            <label for="password">비밀번호:</label>
            <input type="password" class="form-control" id="password" name="password">
          </div>

          <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" class="form-control" id="MEMBERNAME" name="MEMBERNAME">
          </div>

          <div class="form-group">
            <label for="gender">성별:</label>
            <select class="form-control" id="GENDER_ID" name="GENDER_ID">
              <option value="">성별 선택</option>
              <option value="G_01">남성</option>
              <option value="G_02">여성</option>
            </select>
          </div>

          <div class="form-group">
            <label for="birthdate">생년월일:</label>
            <input type="date" class="form-control" id="BIRTHDATE" name="BIRTHDATE">
          </div>

          <div class="form-group">
            <label for="phone">전화번호:</label>
            <input type="tel" class="form-control" id="PHONENUMBER" name="PHONENUMBER">
          </div>

          <div class="form-group">
            <label for="address">주소:</label>
            <input type="text" class="form-control" id="MEMBERADDRESS" name="MEMBERADDRESS">
          </div>

          <div class="form-group">
            <label for="email">이메일 주소:</label>
            <input type="email" class="form-control" id="EMAIL" name="EMAIL">
          </div>

          <div class="form-group">
            <label for="auth" class="sr-only">Auth</label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="auth" id="PATNER" value="M_03">
              <label class="form-check-label" for="PATNER">파트너</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="auth" id="DOCTOR" value="M_04">
              <label class="form-check-label" for="DOCTOR">전문의</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="auth" id="USER" value="M_01">
              <label class="form-check-label" for="USER">본인</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="auth" id="FAMILY" value="M_02">
              <label class="form-check-label" for="FAMILY">가족</label>
            </div>
          </div>

          <div class="float-right">
            <button type="submit" class="btn" formaction="/joinProc" formmethod="post"
              style="background-color: #ff7f95;">회원가입</button>
          </div>
        </form>
      </div>

      <script src="/js/login_button.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>

  </html>