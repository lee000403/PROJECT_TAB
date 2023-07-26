<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    .result_box {
      width: 40rem;
      margin : auto;
      border-radius: 10px; 
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.6); 
      padding: 20px;
      margin-top: 5rem;
    }

    .button-group{
      margin-top: 30px;
      text-align: center;
    }

    .retest-button {
      
      background-color: #ff7f95;
      margin-right: 20px; 
      color: #fff;
    }

    .ask-question-button {
      background-color: #fef0ea;
      color: #000;
    }
  </style>
</head>
<%@ include file="../mainbar/header.jsp" %>
<sec:authentication property="principal" var="userDetailsBean" />
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <div class="result_box" >
            <div style="font-size: 24px; font-weight: bold; margin-bottom: 20px;">
              진단 결과 당신의 점수는: _0~6_점 입니다.
            </div>
            <div>
              <img src="/images/self_test_result_a_a.jpg" alt="Image" class="img-fluid" width="600" height="400">
            </div>
            <div style="font-size: 20px; font-weight: bold; margin: 20px 0;">
              치매가 아닌 것으로 보입니다.
            </div>
            <div style="font-size: 16px; margin-bottom: 20px; text-align: justify;">
              그러나 이후 기억력이나 기타 지적 능력(언어 표현 및 이해력, 판단력, 시간이나 공간 파악력, 계산능력 등)이 지금보다 나빠지는 느낌이 있다면 미루지 마시고 전문의사(치매 클리닉)의 진찰을 받아 보도록 하십시오.
            </div>
          </div>
        </div>
      </div>
      <div class="button-group">
        <form action="" method="">
          <button formaction="/TAB_PAGE/self_test_delete/${userDetailsBean.username}" formmethod="">재검사 &gt;</button>
          <button formaction="/TAB_PAGE/community" formmethod="">궁금한점 물어보기 &gt;</button>
        </form>
      </div>
    </div>

    <%@ include file="../mainbar/footer.jsp" %>
  </body>

</html>
