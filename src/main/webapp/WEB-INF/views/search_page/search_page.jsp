<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
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

</style>

</head>

<%@ include file="../mainbar/header.jsp" %>
<body>

    <!DOCTYPE html>
    <html>

    <head>
        <title>치매시설정보</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
            }

            .container {
                margin-top: 40px;
            }

            .input-group {
                margin-bottom: 20px;
            }

            .form-control {
                width: 60%;
            }

            .btn-search {
                background-color: rgba(221, 43, 43, 0.897);
                color: #fff;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th,
            td {
                padding: 10px;
                border: 1px solid #ccc;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #ebebeb;
            }

            .textname {
                font-weight: bold;
                font-size: large;
                text-align: left;

            }

            .textnayong {
                text-align: left;

            }
        </style>
    </head>

    <body>
        <div class="container">
            <div>
                <h2>🏥 치매시설정보</h2>
            </div>
            <br>
            <div class="container">
                <div class="row justify-content-center">
                  <div class="col-8 col-md-6 col-lg-4">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search">
                      <div class="input-group-append">
                        <button class="btn btn-search" type="button">Search</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
            <br>
            <table>
                <thead>
                    <tr>
                        <th>구분</th>
                        <th>시설명/주소</th>
                        <th>전화번호</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>중앙</td>
                        <td>
                            <div class="textname">중앙치매센터</div>
                            <div class="textnayong">서울특별시 중구 을지로 245 (을지로 6가 18-79) 국립중앙의료원 중앙치매센터</div>
                        </td>
                        <td>1666-0921</td>
                        <td><button type="submit" formaction="/selectDetail/${UNIQUE_ID}" formmethod="">상세</button></td>
                    </tr>
                    <tr>
                        <td>광역</td>
                        <td>
                            <div class="textname">서울특별시 광역치매센터</div>
                            <div class="textnayong">서울시 종로구 대학로 47 이화에수풀 2층</div>
                        </td>
                        <td>02-3431-7200</td>
                        <td><button type="submit" formaction="/selectDetail/${UNIQUE_ID}" formmethod="">상세</button></td>
                    </tr>
                    <tr>
                        <td>광역</td>
                        <td>
                            <div class="textname">부산광역시 광역치매센터</div>
                            <div class="textnayong">부산광역시 서구 대신공원로 26, 동아대학교병원 센터동 10층</div>
                        </td>
                        <td>051-240-2560</td>
                        <td><button type="submit" formaction="/selectDetail/${UNIQUE_ID}" formmethod="">상세</button></td>
                    </tr>
                    <tr>
                        <td>광역</td>
                        <td>
                            <div class="textname">대구광역시 광역치매센터</div>
                            <div class="textnayong">대구광역시 북구 호국로 807 칠곡경북대학교병원 2층</div>
                        </td>
                        <td>053-323-6321</td>
                        <td><button type="submit" formaction="/selectDetail/${UNIQUE_ID}" formmethod="">상세</button></td>
                    </tr>
                    <tr>
                        <td>광역</td>
                        <td>
                            <div class="textname">인천광역시 광역치매센터</div>
                            <div class="textnayong">인천광역시 부평구 동수로 56 가톨릭대학교인천성모병원 제3별관 1층</div>
                        </td>
                        <td>032-472-2027</td>
                        <td><button type="submit" formaction="/selectDetail/${UNIQUE_ID}" formmethod="">상세</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>

    <%@ include file="../mainbar/footer.jsp" %>
    </html>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>

<!-- https://www.nid.or.kr/info/facility_list.aspx# -->