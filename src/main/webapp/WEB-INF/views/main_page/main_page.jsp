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
      <link rel="stylesheet" href="/CSSs/main_page.css">
      <link href='http://www.openhiun.com/hangul/nanumbarungothic.css' rel='stylesheet' type='text/css'>

    </head>

    <body>
      <%@ include file="../mainbar/header.jsp" %>
        <div class="main_image_box">
          <div class="mt-5 mb-5 text-center">
            <img class="main_img" src="/images/one_click_matching.jpg" alt="치매 one-click 메인 커버">
            <!-- <div class="text-center main-title image-text">치매 One-click Matching</div>
              <p class="text-center image-text-second">치매환자와 가족과 동행하는 치매파트너 연결 서비스</p> -->
          </div>
        </div>
        <div>
          <form action="" method="post">
            <div class="container mb-2 text-center search_text">
              🏥 치매 전문 센터 및 병원 찾기
            </div>
            <div class="row justify-content-center">
              <div class="col-md-6">
                <div class="input-group mb-5">
                  <select class="form-select" name="search">
                    <option>선택</option>
                    <option value="CENTER_NAME">시설명
                    </option>
                    <option value="CENTER_ADD">주소</option>
                  </select>
                  <input type="text" name="words" class="form-control" placeholder="검색..." id="keydownEnter">
                  <button class="btn" style="background-color: #ff7f95;" type="submit"
                    formaction="/TAB_PAGE/search_page/" formmethod="post">검색</button>
                </div>
              </div>
            </div>
        </div>
        </form>

        <div class="btns">
          <div class="row justify-content-center video_button text-center">
            <div class="col">
              <form action="https://www.youtube.com/watch?v=GBbHNUx3kvI" method="get">
                <button type="submit" formaction="https://www.youtube.com/watch?v=GBbHNUx3kvI" target="_blank"
                  class="btn btn-link">
                  <div class="image-container round-image">
                    <img class="img-fluid" src="/images/img1_video_banner.png" alt="치매 인식 개선 영상">
                  </div>
                </button>
              </form>
            </div>

            <div class="col">
              <form>
                <button type="submit" formaction="/loginForm" formmethod="get" class="btn btn-link">
                  <div class="image-container">
                    <img class="img-fluid round-image" src="/images/img2_self_test.png" alt="치매 자가 진단">
                  </div>
                </button>
              </form>
            </div>

            <div class="col">
              <form>
                <button type="submit" formaction="/loginForm" formmethod="get" class="btn btn-link">
                  <div class="image-container">
                    <img class="img-fluid round-image" src="/images/img3_partner_matching.png" alt="one-click 파트너 연결">
                  </div>
                </button>
              </form>
            </div>
            <div class="col">
              <form>
                <button type="submit" formaction="/TAB_PAGE/search_page/" formmethod="post" class="btn btn-link">
                  <div class="image-container">
                    <img class="img-fluid round-image" src="/images/img4_community.png" alt="커뮤니티">
                  </div>
                </button>
              </form>
            </div>
          </div>
        </div>
        </div>
        <%@ include file="../mainbar/footer.jsp" %>


    </body>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    </html>