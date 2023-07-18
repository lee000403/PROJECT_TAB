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
      padding: 16rem;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .card {
      display: inline-block;
      width: 300px;
      justify-content: center;
      align-items: center;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .card img {
      width: 100%;
      height: auto;
      object-fit: cover;
      border-radius: 10px 10px 0 0;
      cursor: pointer;
    }

    .card-content {
      padding: 20px;
      background-color: #fff;
    }

    .card-title {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .card-description {
      font-size: 14px;
      color: #777;
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
  <form action="">
  <%@ include file="../mainbar/header.jsp" %>
    <h2>회원 가입 유형 선택</h2>
    <div style="margin-bottom: 5px;">목적에 맞는 유형을 선택해서 가입을 진행해주시기를 바랍니다.
    </div>
    <div style="margin-bottom: 8px;">
      유형에 따라 가입 절차 및 항목에 차이가 있을 수 있습니다.</div>
    <button formaction="/TAB_PAGE/signin_page_a" formmethod="">
      <div class="card">
        <img src="https://picsum.photos/250/250" alt="Patient">
        <div class="card-content">
          <h3 class="card-title">본인</h3>
          <p class="card-description">Description for patient</p>
        </div>
      </div>
    </button>
    <button formaction="/TAB_PAGE/signin_page_a" formmethod="">
      <div class="card">
        <img src="https://picsum.photos/250/250" alt="Family">

        <div class="card-content">
          <h3 class="card-title">가족</h3>
          <p class="card-description">Description for family</p>
        </div>
      </div>
    </button>
    <button formaction="/TAB_PAGE/signin_page_a" formmethod="">
      <div class="card">
        <img src="https://picsum.photos/250/250" alt="Partner">

        <div class="card-content">
          <h3 class="card-title">파트너</h3>
          <p class="card-description">Description for partner</p>
        </div>
      </div>
    </button>
    <button formaction="/TAB_PAGE/signin_page_b" formmethod="">
      <div class="card">
        <img src="https://picsum.photos/250/250" alt="Doctor">
        <div class="card-content">
          <h3 class="card-title">전문의</h3>
          <p class="card-description">Description for doctor</p>
        </div>
      </div>
    </button>
    </div>
  </form>
</body>
<%@ include file="../mainbar/footer.jsp" %>

</html>