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
      <link rel="stylesheet" href="/CSSs/statistics.css">
<<<<<<< HEAD
      <script src="/js/statistics.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
=======

>>>>>>> 2285b42dde6d4e5e82b39405501c58870f6b4fbb
      <%@ include file="../mainbar/header_for_stat.jsp" %>
      <style>
        #map {
          height: 400px;
          width: 100%;
        }
      </style>

    <body>

      <div class="container">
        <div class="carousel_box">
          <div id="controlsid" style="margin: 0 auto" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button class="active cbtn" data-bs-slide-to="0" data-bs-target="#controlsid">
                ◻
              </button>
              <button class="cbtn" data-bs-slide-to="1" data-bs-target="#controlsid">
                ◻
              </button>
              <button class="cbtn" data-bs-slide-to="2" data-bs-target="#controlsid">
                ◻
              </button>
              <button class="cbtn" data-bs-slide-to="3" data-bs-target="#controlsid">
                ◻
              </button>
              <button class="cbtn" data-bs-slide-to="4" data-bs-target="#controlsid">
                ◻
              </button>
            </div>
            <div class="first_line">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img class="img" src="/images/newlogo.jpg" alt="">
                </div>
                <div class="carousel-item">
                  <img class="img" src="/images/one_click_matching.jpg" alt="">
                </div>
                <div class="carousel-item">
                  <a href="http://contents2.kocw.or.kr/KOCW/data/document/2020/edu1/gicu/kimkisik1111/14-1.pdf">
                    <img class="img" src="/images/guide.jpg" alt="">
                  </a>
                </div>
                <div class="carousel-item">
                  <img class="img" src="/images/flower_img.jpg" alt="">
                </div>
                <div class="carousel-item">
                  <img class="img" src="/images/newlogo.jpg" alt="">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="intro_box">
          <div class="title">
            <strong>
              환영합니다!
            </strong> <br>
          </div>
          <div class="text_box">
            우리 웹사이트는 치매를 앓고 있는 환자 <br>
            및 보호자들이 공동체와 연결될 수 있도록 <br>
            만들어졌습니다
          </div>
          <div class="small_text_box">
            치매 환자들이 지역사회에서 일상을 누리며 행복하게 살아가기 위해서는
            <strong>지역사회의 노력과 연대</strong>
            가 필요합니다
          </div>
          <div class="small_text_box">
            치매, 동행과 함께 우리 공동체 곳곳에 자리잡은 전문가들과 소통해 보세요
          </div>
        </div>
      </div>

      <div class="container">
        <div class="stat_box">
          <div class="stat stat_a">
            <canvas id="myChart"></canvas>
          </div>
          <div class="stat stat_b">
            <canvas id="myNextChart"></canvas>
          </div>
          <div class="stat stat_c">
            <canvas id="myLastChart"></canvas>
          </div>
        </div>
      </div>
      <div class="text_box" style="text-align: center;">
        <strong>
          2016년 국내 치매 관련 시설 현황
        </strong>
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

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="module" src="/js/statistics.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>