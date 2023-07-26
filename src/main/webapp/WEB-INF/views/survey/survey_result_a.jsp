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
    margin: 100px 0; /* Adjusted margin to give space */
    font-size: 2rem; /* Responsive font size */
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
          <li class="lis">
            <div>
              <button class="partner-button" formaction="/detail/detail_partners.jsp">
                <img class="partner-image" src="/images/partner_1.JPG" alt="partner 1">
              </button>
            </div>
            <div class="partner-info">
              <div class="partner-name">김 버논</div>
              <div>
                <div>성별: 남성</div>
                <div>주소: 서울 강남구</div>
              </div>
            </div>
            <div class="partner-info">
              <div>근무 유형: 출퇴근 (아침만)</div>
              <div>고용 형태: 장기 간병인</div>
              <div>동반자 환자의 치매 단계: 경도 치매</div>
              <div>선호 지역: 1순위 서울, 2순위 경기</div>
              <div>차량 또는 면허: 면허 보유</div>
              <div>자격증: 간병인 자격증</div>
            </div>
          </li>
          <li class="lis">
            <div>
              <button class="partner-button" formaction="/detail/detail_partners.jsp">
                <img class="partner-image" src="/images/partner_2.JPG" alt="partner 2">
              </button>
            </div>
            <div class="partner-info">
              <div class="partner-name">미미 최</div>
              <div>
                <div>성별: 여성</div>
                <div>주소: 경기도 수원시</div>
              </div>
            </div>
            <div class="partner-info">
              <div>근무 유형: 출퇴근 (아침만)</div>
              <div>고용 형태: 장기 간병인</div>
              <div>동반자 환자의 치매 단계: 경도 치매</div>
              <div>선호 지역: 1순위 서울, 2순위 경기</div>
              <div>차량 또는 면허: 차량 소유</div>
              <div>자격증: 간병인 자격증</div>
            </div>
          </li>
          <li class="lis">
            <div>
              <button class="partner-button" formaction="/detail/detail_partners.jsp">
                <img class="partner-image" src="/images/partner_3.JPG" alt="partner 3">
              </button>
            </div>
            <div class="partner-info">
              <div class="partner-name">정 윈터</div>
              <div>
                <div>성별: 남성</div>
                <div>주소: 서울 관악구</div>
              </div>
            </div>
            <div class="partner-info">
              <div>근무 유형: 출퇴근 (아침만)</div>
              <div>고용 형태: 장기 간병인</div>
              <div>동반자 환자의 치매 단계: 경도 치매</div>
              <div>선호 지역: 1순위 서울, 2순위 경기</div>
              <div>차량 또는 면허: 차량 소유</div>
              <div>자격증: 간병인 자격증</div>
            </div>
          </li>
        </ul>
        
      </div>
      <form action="">
        <div style="text-align: center;">
          <button style="background-color: #ff7f95; color: white; font-size: 1.2rem; padding: 10px 20px; border: none; border-radius: 5px;" formaction="/TAB_PAGE/survey_a" formmethod="">다시찾기</button>
        </div>
      </form>
         
    </body>
    <%@ include file="../mainbar/footer.jsp" %>

  </html>