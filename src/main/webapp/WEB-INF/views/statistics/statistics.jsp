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
      
      <%@ include file="../mainbar/header_for_stat.jsp" %>

    <body>

      <div class="container">
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
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="img" src="/images/newlogo.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img class="img" src="/images/one_click_matching.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img class="img" src="/images/guide.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img class="img" src="/images/flower_img.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img class="img" src="/images/newlogo.jpg" alt="">
              </div>
            </div>
          </div>

        <div class="stat stat_a">
          <canvas id="myChart"></canvas>
        </div>
        <div class="stat stat_b">
          <table id="dataTable">

          </table>
        </div>
        <div class="stat stat_c">
          statistics c
        </div>
      </div>

    </body>




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