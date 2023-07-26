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
              진단 결과 당신의 점수는: _10~30_점 입니다.
            </div>
            <div>
              <img src="/images/self_test_result_c.jpg" alt="Image" class="img-fluid" width="400" height="300">
            </div>
            <div style="font-size: 20px; font-weight: bold; margin: 20px 0;">
              현재 <span style="color:red">치매일 가능성</span>이 높습니다.
            </div>
            <div style="font-size: 16px; margin-bottom: 20px; text-align: justify;">치매클리닉을 방문하시면 전문의사의 진찰과 아울러 뇌 촬영(MRI, CT, PET 등), 혈액검사, 신경심리검사 등의 검사를 받게 됩니다. 이러한 진찰과 검사는 치매 여부, 원인 및 진행 정도를 밝히기 위해 꼭 필요한 것들입니다.</div>
              <div style="font-size: 16px; margin-bottom: 20px; text-align: justify;">
              또한, 각 지역에 마력되어 있는 치매지원센터(지역에 상관없이 3431-7200)로 연락하시면 치매에 대한 전문적인 교육을 받은 간호사가 치매가 의심될 때 어떻게 해야 하는지 친절히 상담해드리고, 치매와 관련된 다양하고 유용한 정보를 제공해드립니다.
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="button-group">
      <a class="retest-button" href="/TAB_PAGE/self_test_delete/${userDetailsBean.username}">재검사 &gt;</a>
      <a class="ask-question-button" href="/TAB_PAGE/community">궁금한점 물어보기 &gt;</a>
    </div>


  </div>

  </body>
  <%@ include file="../mainbar/footer.jsp" %>
</html>
