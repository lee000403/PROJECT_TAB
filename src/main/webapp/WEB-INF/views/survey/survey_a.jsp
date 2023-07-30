<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>설문 조사</title>

    <style>
      .centered-text {
        text-align: center;
      }

      .centered-button {
      text-align: center;
      margin-top: 20px;
    }

      .btn-style {
        background-color: #ff7f95;
      }

      .form-style {
      max-width: 600px; /* Set the maximum width of the form container */
      margin: 0 auto; /* Center the form container horizontally */
      padding: 40px; /* Add some padding to the form container */
      background-color: #ff7f9471;
      border-radius: 10px;
    }

      .form-group {
        width: 100%;
      }
    </style>

  </head>

  <body>
    <%@ include file="../mainbar/header.jsp" %>
      <div class="container py-1 px-5">
        <div class="centered-text" style="font-size: 30px; font-weight: bold; margin-top: 40px;">치매 동행 파트너를 찾고 계시나요?</div>
        <div class="centered-text">원하시는 파트너의 조건을 검색해보세요</div>
      </div>
      <div>
        <form class="container-fluid form-style" style="margin-top: 20px;">
          <div class="form-group">
            <label for="gender">선호하는 파트너의 성별이 있나요?</label>
            <select class="form-control" id="gender">
              <option>무관</option>
              <option>남</option>
              <option>여</option>
            </select>
          </div>
          <div class="form-group">
            <label for="age">선호하는 파트너의 연령이 있나요?</label>
            <select class="form-control" id="age">
              <option>20대</option>
              <option>30대</option>
              <option>40대</option>
              <option>50대</option>
              <option>60대</option>
              <option>무관</option>
            </select>
          </div>


          <div class="form-group">
            <label for=" work-type">어떤 근무 형태를 원하시나요?</label>
            <select class="form-control" id="work-type">
              <option>출퇴근형 (오전만)</option>
              <option>출퇴근형 (오후만)</option>
              <option>출퇴근형 (종일)</option>
              <option>입주형</option>
              <option>파트너와 상담 후 결정할게요.</option>
            </select>
          </div>

          <div class="form-group">
            <label for="partner-type">원하시는 고용형태는요?</label>
            <select class="form-control" id="partner-type">
              <option>장기 요양보호사</option>
              <option>단기 케어</option>
              <option>자원봉사자</option>
            </select>
          </div>


          <div class="form-group">
            <label for="requestAddress">서비스를 받고 싶은 지역을 선택해주세요</label>
            <select data-v-4604670f="" name="requestAddress" class="select custom-select margin-bottom disabled"
              data-testid="request-address" aria-invalid="false" id="requestAddressProvince">
              <option disabled="disabled" value="">시/도</option>
              <option value="서울">서울</option>
              <option value="세종">세종</option>
              <option value="강원">강원</option>
              <option value="인천">인천</option>
              <option value="경기">경기</option>
              <option value="충북">충북</option>
              <option value="충남">충남</option>
              <option value="경북">경북</option>
              <option value="대전">대전</option>
              <option value="대구">대구</option>
              <option value="전북">전북</option>
              <option value="경남">경남</option>
              <option value="울산">울산</option>
              <option value="광주">광주</option>
              <option value="부산">부산</option>
              <option value="전남">전남</option>
              <option value="제주">제주</option>
            </select>

            <select data-v-4604670f="" name="requestAddress" disabled="disabled" class="select custom-select disabled"
              data-testid="request-address" aria-invalid="false" id="requestAddressCity">
              <option disabled="disabled" value="">시/군/구</option>
            </select>
          </div>

          <div class="form-group">
            <label for="vehicle-ownership">차량 또는 면허가 필요할까요?</label>
            <select class="form-control" id="vehicle-ownership">
              <option>차량 필요</option>
              <option>운전 필요</option>
              <option>무관</option>
            </select>
          </div>

          <div class="form-group">
            <label for="license">자격증이 필요한가요?</label>
            <select class="form-control" id="license">
              <option>요양 보호사 자격증</option>
              <option>치매 파트너 교육 이수</option>
              <option>무관</option>
            </select>
          </div>


          <div class="centered-button mt-5">
            <button type="submit" class="btn btn-style" formaction="/TAB_PAGE/survey_result_a" style="background-color: #ff7f95;"> 파트너 찾기 </button>
          </div>
        </form>
      </div>

      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
  <%@ include file="../mainbar/footer.jsp" %>

  </html>