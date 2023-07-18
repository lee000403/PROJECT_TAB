<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>
  <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
      ul {
        list-style-type: none;
      }

      .lis {
        display: grid;
        grid-template-columns: 2fr 2fr 3fr;
        /* Adjusted column widths */
        align-items: flex-start;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        padding: 20px;
        cursor: pointer;
      }

      .partner-image {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        margin-right: 20px;
      }


      .main-title {
        text-align: center;
        margin: 1cm;
        font-size: 30px;
        font-weight: bold;
      }

      .partner-name {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
      }

      .partner-info {
        display: flex;
        flex-direction: column;
        font-size: 16px;
        line-height: 2;
      }
    </style>
  </head>
    <body>
      <%@ include file="../mainbar/header.jsp" %>
      <div class="container">
        <div class="main-title">작성하신 요청 사항에 가장 가까운 파트너를 찾았어요</div>
        <div class="mx-3 my-2" style="text-align: end;"> 검색 결과 : 3 </div>
        <ul>
          <li onclick="window.location.href='detail_partners.html'" class="lis">
            <div>
              <a href="../detail/detail_partners.html">
                <img class="partner-image" src="/images/partner_1.JPG" alt="partner 1">
              </a>
            </div>
            <div>
              <div class="partner-info">
                <div class="partner-name">김버논</div>
                <div>
                  <div>성별: 남</div>
                  <div>주소: 서울시 강남구</div>
                </div>
              </div>
            </div>
            <div>
              <div class="partner-info">
                <div>근무 형태: 출퇴근형 (오전만)</div>
                <div>고용 형태: 장기 요양보호사</div>
                <div>동행 가능한 환자의 치매 단계: 경증 치매</div>
                <div>선호하는 지역: 1순위 서울, 2순위 경기</div>
                <div>차량 또는 면허: 면허 있음</div>
                <div>자격증: 요양 보호사 자격증</div>
              </div>
            </div>
          </li>
          <li onclick="window.location.href='detail_partners.html'" class="lis">
            <div>
              <a href="../detail/detail_partners.html">
                <img class="partner-image" src="/images/partner_2.JPG" alt="partner 2">
              </a>
            </div>
            <div>
              <div class="partner-info">
                <div class="partner-name">최미미</div>
                <div>
                  <div>성별: 여</div>
                  <div>주소: 경기도 수원시</div>
                </div>
              </div>
            </div>
            <div>
              <div class="partner-info">
                <div>근무 형태: 출퇴근형 (오전만)</div>
                <div>고용 형태: 장기 요양보호사</div>
                <div>동행 가능한 환자의 치매 단계: 경증 치매</div>
                <div>선호하는 지역: 1순위 서울, 2순위 경기</div>
                <div>차량 또는 면허: 차량 있음</div>
                <div>자격증: 요양 보호사 자격증</div>
              </div>
            </div>
          </li>
          <li onclick="window.location.href='detail_partners.html'" class="lis">
            <div>
              <a href="../detail/detail_partners.html">
                <img class="partner-image" src="/images/partner_3.JPG" alt="partner 3">
              </a>
            </div>
            <div>
              <div class="partner-info">
                <div class="partner-name">정윈터</div>
                <div>
                  <div>성별: 남</div>
                  <div>주소: 서울시 관악구</div>
                </div>
              </div>
            </div>
            <div>
              <div class="partner-info">
                <div>근무 형태: 출퇴근형 (오전만)</div>
                <div>고용 형태: 장기 요양보호사</div>
                <div>동행 가능한 환자의 치매 단계: 경증 치매</div>
                <div>선호하는 지역: 1순위 서울, 2순위 경기</div>
                <div>차량 또는 면허: 차량 있음</div>
                <div>자격증: 요양 보호사 자격증</div>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <form action="">
        <div style="text-align: center;">
          <button formaction="/TAB_PAGE/survey_a" formmethod="">다시 찾기</button>
        </div>
      </form>
    </body>
    <%@ include file="../mainbar/footer.jsp" %>

  </html>