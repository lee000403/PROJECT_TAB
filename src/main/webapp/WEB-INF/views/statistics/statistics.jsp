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
      <script src="/js/statistics.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <%@ include file="../mainbar/header_for_stat.jsp" %>
      <style>
        #map {
          height: 400px;
          width: 100%;
        }
      </style>

    <body>

      <div class="fs-3">
        <div class="container">
          <div id="controlsid" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button class="active cbtn" data-bs-slide-to="0" data-bs-target="#controlsid">
                1
              </button>
              <button class="cbtn" data-bs-slide-to="1" data-bs-target="#controlsid">
                2
              </button>
              <button class="cbtn" data-bs-slide-to="2" data-bs-target="#controlsid">
                3
              </button>
              <button class="cbtn" data-bs-slide-to="3" data-bs-target="#controlsid">
                4
              </button>
              <button class="cbtn" data-bs-slide-to="4" data-bs-target="#controlsid">
                5
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
        </div>
      </div>




      <div class="stat_a">
        statistics a
      </div>
      <div class="stat_b">
        statistics b
      </div>
      <div class="stat_c">
        statistics c
      </div>

      <div class="container mt-4">
        <div class="row">
            <!-- Bar Chart -->
            <div class="col" id="barChart"></div>

        </div>
        <div class="row">
            <!-- Pie Chart and Line Chart -->
            <div class="col-sm-6" id="pieChart"></div>
            <div class="col-sm-6" id="lineChart"></div>
        </div>

        <!-- Google Maps Container -->
        <div class="row">
            <div class="col" id="map"></div>
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
    <script type='text/javascript'>
      // Load the Visualization API and the corechart package
      google.charts.load('current', { 'packages': ['corechart'] });

      // Set a callback to run when the Google Visualization API is loaded
      google.charts.setOnLoadCallback(drawCharts);

      // Function to draw the charts
      function drawCharts() {
          // Data for Bar Chart
          let barData = google.visualization.arrayToDataTable([
              ['Category', 'Value'],
              ['Category A', 10],
              ['Category B', 20],
              ['Category C', 15]
          ]);

          // Options for Bar Chart
          let barOptions = {
              title: 'Bar Chart'
          };

          // Data for Pie Chart
          let pieData = google.visualization.arrayToDataTable([
              ['Fruit', 'Quantity'],
              ['Apple', 30],
              ['Banana', 20],
              ['Orange', 50]
          ]);

          // Options for Pie Chart
          let pieOptions = {
              title: 'Pie Chart'
          };

          // Data for Line Chart
          let lineData = new google.visualization.DataTable();
          lineData.addColumn('number', 'X');
          lineData.addColumn('number', 'Line1');
          lineData.addColumn('number', 'Line2');

          lineData.addRows([
              [1, 5, 7],
              [2, 9, 3],
              [3, 2, 6]
          ]);

          let lineOptions = {
              title: 'Line Chart',
              curveType: 'function',
              legend: { position: 'bottom' }
          };

          let barChart = new google.visualization.BarChart(document.querySelector('#barChart'));
          barChart.draw(barData, barOptions);

          let pieChart = new google.visualization.PieChart(document.querySelector('#pieChart'));
          pieChart.draw(pieData, pieOptions);

          let lineChart = new google.visualization.LineChart(document.querySelector('#lineChart'));
          lineChart.draw(lineData, lineOptions);
      }

      // Coordinates and Location Names
      let locations = [
          { lat: 37.5666791, lng: 126.9782914, name: '서울' },
          { lat: 37.566535, lng: 126.9779692, name: '광화문' },
          { lat: 37.5586867, lng: 126.9782364, name: '명동' },
          { lat: 37.5551483, lng: 126.9707136, name: '남대문 시장' },
          { lat: 37.5617981, lng: 127.0071515, name: '강남역' },
          { lat: 37.5701391, lng: 127.0079479, name: '삼성동' },
          { lat: 37.5296212, lng: 127.0325739, name: '잠실' }
      ];

      // Initialize and Display the Map
      function initMap() {
          let map = new google.maps.Map(document.querySelector('#map'), {
              zoom: 12,
              center: { lat: 37.5666791, lng: 126.9782914 } // Seoul Coordinates
          });

          // Add Markers and Info Windows
          for (let i = 0; i < locations.length; i++) {
              let marker = new google.maps.Marker({
                  position: locations[i],
                  map: map,
                  title: locations[i].name
              });

              let infowindow = new google.maps.InfoWindow({
                  content: locations[i].name
              });

              marker.addListener('click', function () {
                  infowindow.open(map, this);
              });
          }
      }
  </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    </body>

    </html>