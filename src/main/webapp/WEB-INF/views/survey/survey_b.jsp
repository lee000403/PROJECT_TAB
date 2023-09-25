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
            display: flex;
            justify-content: center;
        }

        .btn-style {       
            background-color: #fc267fe0;
        }

        .form-style {
            width: 60%;
            padding: 10%;
            background-color: #f5bd4571;
            border-radius: 10%;
        }
        .form-group {
            width: 100%;
        }

        body {
             background-color:#fff;

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

<body>
  <%@ include file="../mainbar/header.jsp" %>
    <div class="container py-1 px-5">
        <div class="centered-text" style=" font-size: 30px; font-weight: bold; margin-top: 200px;">동행이 필요한 치매환자를 찾고 계신가요?</div>
        <div class="centered-text">지원하시고픈 환자의 조건을 검색해보세요</div>
        </div>
        <div>
        <form class="container-fluid form-style">
            <div class="form-group">
                <label for="gender">선호하는 환자의 성별이 있나요?</label>
                <select class="form-control" id="gender">
                    <option name="gender" value="SURA-0041">무관</option>
                    <option name="gender" value="SURA-0042">남</option>
                    <option name="gender" value="SURA-0043">여</option>
                </select>
            </div>

            <div class="form-group">
                <label for=" work-type">어떤 근무 형태를 원하시나요?</label>
                <select class="form-control" id="work-type">
                    <option name="work-type" value="SURA-0044">출퇴근형 (오전만)</option>
                    <option name="work-type" value="SURA-0045">출퇴근형 (오후만)</option>
                    <option name="work-type" value="SURA-0046">출퇴근형 (종일)</option>
                    <option name="work-type" value="SURA-0047">입주형</option>
                    <option name="work-type" value="SURA-0048">파트너와 상담 후 결정할게요.</option>
                </select>
            </div>

            <div class="form-group">
                <label for="partner-type">원하시는 고용형태는요?</label>
                <select class="form-control" id="partner-type">
                    <option name="partner-type" value="SURA-0049">장기 요양보호사</option>
                    <option name="partner-type" value="SURA-0050">단기 케어</option>
                    <option name="partner-type" value="SURA-0051">자원봉사자</option>
                </select>
            </div>
        
            <div class="form-group">
                <label for="patient-level">동행 가능한 환자의 치매 단계는 어떻게 될까요?</label>
                <select class="form-control" id="patient-level">
                    <option name="STAGE_ID" value="SURA-0052">경증 치매</option>
                    <option name="STAGE_ID" value="SURA-0053">중등도 치매</option>
                    <option name="STAGE_ID" value="SURA-0054">중증 치매</option>
                </select>
            </div>

            <div class="form-group">
                <div>선호하는 지역을 선택해주세요</div>
                <label for="addressFirst">(1순위)</label>
                <select data-v-4604670f="" name="area" class="select custom-select disabled" data-testid="address-first" aria-invalid="false" id="requestAddressProvince">
                    <option disabled="disabled" value="">시/도</option>
                    <option value="SURA-0089">서울</option>
                    <option value="SURA-0090">세종</option>
                    <option value="SURA-0091">강원</option>
                    <option value="SURA-0092">인천</option>
                    <option value="SURA-0093">경기</option>
                    <option value="SURA-0094">충북</option>
                    <option value="SURA-0095">충남</option>
                    <option value="SURA-0096">경북</option>
                    <option value="SURA-0097">대전</option>
                    <option value="SURA-0098">대구</option>
                    <option value="SURA-0099">전북</option>
                    <option value="SURA-0100">경남</option>
                    <option value="SURA-0101">울산</option>
                    <option value="SURA-0102">광주</option>
                    <option value="SURA-0103">부산</option>
                    <option value="SURA-0104">전남</option>
                    <option value="SURA-0105">제주</option>
                </select>
        </div>

            <div class="form-group">
                <label for="vehicle-ownership">차량 또는 면허가 있나요?</label>
                <select class="form-control" id="vehicle-ownership">
                    <option name="car" value="SURA-0083">차량 있음</option>
                    <option name="car" value="SURA-0084">운전 가능</option>
                    <option name="car" value="SURA-0085">운전 불가</option>
                </select>
            </div>

            <div class="form-group">
                <label for="license">자격증이 있나요?</label>
                <select class="form-control" id="license">
                    <option name="patner" value="SURA-0086">요양 보호사 자격증</option>
                    <option name="patner" value="SURA-0087">치매 파트너 교육 이수</option>
                    <option name="patner" value="SURA-0088">없음</option>
                </select>
            </div>

            <div class="centered-button mt-5">
                <button type="submit" class="btn btn-style" formaction="/TAB_PAGE/survey_result_b" formmethod="post"> <span style="color:whitesmoke;">파트너 찾기</span> </button>
            </div>
        </form>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>