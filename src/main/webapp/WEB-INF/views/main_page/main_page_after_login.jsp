<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
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
      background-color: #fef0ea;
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

    .image-container {
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
    }

    .image-container img {
      max-height: 80%;
      /* Set the maximum height of the image */
    }

    .main-title {
      font-size: 30px;
      font-weight: bold;
    }

    .image-text {
      position: absolute;
      top: 22%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #2e1a27;
      padding: 10px;
      text-align: center;
      font-family: Georgia, 'Times New Roman', Times, serif;
    }

    .image-text-second {
      position: absolute;
      top: calc(22% + 15px);
      /* Adjust the top value to control the spacing */
      left: 50%;
      transform: translateX(-50%);
      color: #555742;
      padding: 10px;
      text-align: center;
      font-family: Georgia, 'Times New Roman', Times, serif;
    }

    .round-image {
      border-radius: 10%;
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

    .video_button{
      border: none;
      background-color: white;
    }

  </style>
</head>
  <%@ include file="../mainbar/header.jsp" %>
  <div class="container-fluid">
    <div class="mb-4">
      <div class="image-container">
        <img src="/images/img5_main_cover.jpg" alt="치매 one-click 메인 커버" height="700em" width="100%">
        <div class="text-center main-title image-text">치매 One-click Matching</div>
        <p class="text-center image-text-second">치매환자와 가족과 동행하는 치매파트너 연결 서비스</p>
      </div>
    </div>
  </div>

  <% HashMap params=(HashMap)request.getAttribute("params"); String
  searchStr=(String)params.getOrDefault("search", ""); HashMap
  result=(HashMap)request.getAttribute("result"); %>
  <div>
    <form action="" method="post">
      <div class="container mb-2 text-center">
        🏥 치매 전문 센터 및 병원 찾기
      </div>
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="input-group mb-5">
            <select class="form-select" name="search">
              <option>선택</option>
              <option value="CENTER_NAME" <%=(searchStr.equals("CENTER_NAME")) ? "selected" : "" %>>시설명
              </option>
              <option value="CENTER_ADD" <%=(searchStr.equals("CENTER_ADD")) ? "selected" : "" %>
                >주소</option>
            </select>
            <input type="text" name="words" value='<%= params.getOrDefault("words", " ") %>'
            class="form-control" placeholder="검색..." id="keydownEnter">
            <button class="btn" style="background-color: #ff7f95;" type="submit" formaction="/TAB_PAGE/search_page/"
              formmethod="post">검색</button>
          </div>
        </div>
      </div>
  </div>
  </form>
    
  <div class="row justify-content-center">
    <div class="col">
      <form action="https://www.youtube.com/watch?v=GBbHNUx3kvI" method="get">
        <button class="video_button" type="submit" formaction="https://www.youtube.com/watch?v=GBbHNUx3kvI" target="_blank">
          <div class="image-container round-image">
            <img class="img-fluid" src="/images/img1_video_banner.png" alt="치매 인식 개선 영상">
          </div>
        </button>
      </form>
    </div>
  
    <div class="col">
      <form>
        <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/self_test" formmethod="post">
          <div class="image-container">
            <img class="img-fluid round-image" src="/images/img2_self_test.png" alt="치매 자가 진단">
          </div>
        </button>
      </form>
    </div>
  
    <div class="col">
      <form>
        <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/survey_a" formmethod="post">
          <div class="image-container">
            <img class="img-fluid round-image" src="/images/img3_partner_matching.png" alt="one-click 파트너 연결">
          </div>
        </button>
      </form>
  
      <form action="/TAB_PAGE/survey_b" method="post">
        <button type="submit" class="btn btn-link" ></button>
      </form>
    </div>
  
    <div class="col">
      <form>
        <button type="submit" class="btn btn-link" formaction="/TAB_PAGE/search_community/" formmethod="post">
          <div class="image-container">
            <img class="img-fluid round-image" src="/images/img4_community.png" alt="커뮤니티">
          </div>
        </button>
      </form>
    </div>
  </div>
  

  </div>



  <footer class="footer py-3 mt-5" style="background-color: rgb(235, 225, 235);">
    <div class="row">
      <div class="text-center">
        치매에 대해 궁금하세요?
      </div>
      <div class="text-center">
        ☎ 치매상담콜센터 : 1899-9988
      </div>
    </div>
  </footer>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>
