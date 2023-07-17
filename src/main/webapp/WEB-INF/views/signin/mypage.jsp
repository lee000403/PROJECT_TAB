<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 마이페이지</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
      background-color: #fef0ea;
      padding-top: 130px
    }
    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background-color: white;
      border-radius: 10px;
      margin-top: 50px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      text-align: center;
      margin-bottom: 30px;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      font-weight: bold;
    }
    .profile-picture {
      text-align: center;
      margin-bottom: 20px;
    }
    .profile-picture img {
      width: 200px;
      height: 200px;
      object-fit: cover;
      border-radius: 50%;
    }
    .btn-primary {
      background-color: #ff92b3;
      border-color: #ff92b3;
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
  <div class="container">
    <h1>마이페이지</h1>
    <form>
      <div class="form-group">
        <label for="profile-image">회원 사진:</label>
        <br>
        <input type="file" id="profile-image">
        <br>
        <img id="preview-image" src="https://via.placeholder.com/200" alt="프로필 사진 미리보기">
      </div>
      <div class="form-group">
        <label for="user-type">회원 타입:</label>
        <br>
        <label><input type="radio" name="user-type" value="type1"> 환자</label>
        <label><input type="radio" name="user-type" value="type2" checked="checked"> 가족</label>
        <label><input type="radio" name="user-type" value="type3"> 파트너</label>
        <label><input type="radio" name="user-type" value="type4"> 전문의</label>
      </div>
      <div class="form-group">
        <label for="username">아이디:</label>
        <input type="text" class="form-control" id="username" value="example_user" readonly>
      </div>
      <div class="form-group">
        <label for="password">비밀번호:</label>
        <input type="password" class="form-control" id="password" value="123456789@">
      </div>
      <div class="form-group">
        <label for="name">이름:</label>
        <input type="text" class="form-control" id="name" value="홍길동">
      </div>
      <div class="form-group">
        <label for="gender">성별:</label>
        <br>
        <label><input type="radio" name="gender" value="male"> 남성</label>
        <label><input type="radio" name="gender" value="female" checked="checked"> 여성</label>
      </div>
      <div class="form-group">
        <label for="birthdate">생년월일:</label>
        <input type="date" class="form-control" id="birthdate" value="1990-01-01">
      </div>
      <div class="form-group">
        <label for="phone">전화번호:</label>
        <input type="tel" class="form-control" id="phone" value="010-1234-5678">
      </div>
      <div class="form-group">
        <label for="address">주소:</label>
        <input type="text" class="form-control" id="address" value="서울시 강남구">
      </div>
      <div class="form-group">
        <label for="email">이메일 주소:</label>
        <input type="email" class="form-control" id="email" value="example@example.com">
      </div>
      <div class="form-group">
        <label for="introduction">자기소개:</label>
        <textarea class="form-control" id="introduction">안녕하세요! 저는 예시 회원입니다.</textarea>
      </div>
      <button type="submit" class="btn btn-primary btn-block">수정하기</button>
    </form>
  </div>
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>
