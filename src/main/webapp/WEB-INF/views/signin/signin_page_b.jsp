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
<%@ include file="../mainbar/header.jsp" %>
<body>

  <div class="container">
    <h1 class="mt-5 mb-4 text-center">회원가입(전문의)</h1>

    <form action="/TAB_PAGE/login_page">
      <div class="form-group">
        <label for="username">아이디:</label>
        <input type="text" class="form-control" id="username" name="username" required>
      </div>

      <div class="form-group">
        <label for="password">비밀번호:</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>

      <div class="form-group">
        <label for="name">이름:</label>
        <input type="text" class="form-control" id="name" name="name" required>
      </div>

      <div class="form-group">
        <label for="gender">성별:</label>
        <select class="form-control" id="gender" name="gender" required>
          <option value="">성별 선택</option>
          <option value="male">남성</option>
          <option value="female">여성</option>
        </select>
      </div>

      <div class="form-group">
        <label for="birthdate">생년월일:</label>
        <input type="date" class="form-control" id="birthdate" name="birthdate" required>
      </div>

      <div class="form-group">
        <label for="phone">전화번호:</label>
        <input type="tel" class="form-control" id="phone" name="phone" required>
      </div>

      <div class="form-group">
        <label for="address">주소:</label>
        <input type="text" class="form-control" id="address" name="address" required>
      </div>

      <div class="form-group">
        <label for="email">이메일 주소:</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>

      <div class="form-group">
        <label for="specialty">과:</label>
        <select class="form-control" id="specialty" name="specialty" required>
          <option value="">전공 과목</option>
          <option value="내과">내과</option>
          <option value="외과">외과</option>
          <option value="정신과">정신과</option>
          <option value="정형외과">정형외과</option>
          <option value="이비인후과">이비인후과</option>
          <option value="피부과">피부과</option>
          <option value="소아과">소아과</option>
          <option value="치과">치과</option>
          <option value="안과">안과</option>
          <option value="신경과">신경과</option>
        </select>
      </div>

      <div class="form-group">
        <label for="hospital">병원 이름:</label>
        <input type="text" class="form-control" id="hospital" name="hospital" required>
      </div>
      
      <div class="float-right">
        <button type="submit" class="btn btn-danger ">회원가입</button>
      </div>
    </form>
  </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>
