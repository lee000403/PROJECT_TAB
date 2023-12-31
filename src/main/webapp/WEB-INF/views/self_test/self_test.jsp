<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>치매자가진단</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #fff;
      padding-top: 160px;
    }

    .board_head {
      background-color: #ff7f95;
      padding: 2rem 2rem 1rem 2rem;
      color: #fff;
    }

    .board_head .icon_head {
      display: inline-block;
      width: 30px;
      height: 30px;
      background-color: #e91e63;
      vertical-align: middle;
      margin-right: 10px;
    }

    .board_head ul {
      margin-top: 10px;
      padding-left: 20px;
    }

    .table_responsive {
      width: 70%;
      overflow-x: auto;
      margin:auto;
      margin-top: 20px;
    }

    .p_notice {
      text-align: center;
    }

    .table_st {
      width: 100%;
      border-collapse: collapse;
      text-align: center;
    }

    .table_st th,
    .table_st td {
      border: 1px solid #ccc;
      padding: 10px;
    }

    .btnboxC {
      text-align: center;
      margin-top: 20px;
    }

    .btn_red_normal,
    .btn_blue_normal {
      display: inline-block;
      padding: 10px 20px;
      border-radius: 5px;
      color: #fff;
      text-decoration: none;
      font-weight: bold;
    }

    .btn_red_normal {
      background-color: #f44336;
      margin-right: 10px;
    }

    .btn_blue_normal {
      background-color: #2196f3;
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
    .form-box{
      margin-bottom: 10rem;
    }

  </style>
</head>
<%@ include file="../mainbar/header.jsp" %>
<sec:authentication property="principal" var="userDetailsBean" />
<body>
  <div class="board_head">
    
    <p class="title_st">📝 치매진단 안내</p>
    <ul>
      <li>이 검사는 한국치매학회의 자가 치매 진단 테스트입니다.</li>
      <li>총 15개의 문항으로 구성되어 있으며, 각 문항은 일상생활 중에 나타나는 능력이 어떻게 변했는지 묻게 됩니다.</li>
      <li >합계가 7점 이상이면 치매를 의심할 수 있으므로 치매조기검진 신청을 해주시기 바랍니다.</li>
    </ul>
  </div>

  <div class="text-center mt-3">Your privacy is important to us. All results are completely anonymous.</div>
  <div class="form-box">
  <form name="frmChkDepressive" method="post">
    <div class="table_responsive">
      <table class="table_st taC">
        <caption>치매자가진단을 항목과 문항당 선택 답변(아니다(0점), 가끔(1점), 자주(2점))을 선택하는 표입니다.</caption>
        <colgroup>
          <col class="col7">
          <col>
          <col class="col15">
          <col class="col15">
          <col class="col15">
        </colgroup>
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">항목</th>
            <th scope="col">아니다 (0점)</th>
            <th scope="col">가끔 (1점)</th>
            <th scope="col">자주 (2점)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>1</th>
            <td>오늘이 몇 월이고, 무슨 요일인지 잘 모른다</td>
            <td><label for="ra1_1" class="hidden"></label><input type="radio" id="ra1_1" name="ST-01" value="0"></td>
            <td><label for="ra1_2" class="hidden"></label><input type="radio" id="ra1_2" name="ST-01" value="1"></td>
            <td><label for="ra1_3" class="hidden"></label><input type="radio" id="ra1_3" name="ST-01" value="2"><input
                type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>2</th>
            <td>자기가 놔둔 물건을 찾지 못한다.</td>
            <td><label for="ra2_1" class="hidden"></label><input type="radio" id="ra2_1" name="ST-02" value="0"></td>
            <td><label for="ra2_2" class="hidden"></label><input type="radio" id="ra2_2" name="ST-02" value="1"></td>
            <td><label for="ra2_3" class="hidden"></label><input type="radio" id="ra2_3" name="ST-02" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>3</th>
            <td>같은 질문을 반복해서 한다.</td>
            <td><label for="ra3_1" class="hidden"></label><input type="radio" id="ra3_1" name="ST-03" value="0"></td>
            <td><label for="ra3_2" class="hidden"></label><input type="radio" id="ra3_2" name="ST-03" value="1"></td>
            <td><label for="ra3_3" class="hidden"></label><input type="radio" id="ra3_3" name="ST-03" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>4</th>
            <td>약속을 하고서 잊어버린다.</td>
            <td><label for="ra4_1" class="hidden"></label><input type="radio" id="ra4_1" name="ST-04" value="0"></td>
            <td><label for="ra4_2" class="hidden"></label><input type="radio" id="ra4_2" name="ST-04" value="1"></td>
            <td><label for="ra4_3" class="hidden"></label><input type="radio" id="ra4_3" name="ST-04" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>5</th>
            <td>물건을 가지러 갔다가 잊어버리고 그냥 온다.</td>
            <td><label for="ra5_1" class="hidden"></label><input type="radio" id="ra5_1" name="ST-05" value="0"></td>
            <td><label for="ra5_2" class="hidden"></label><input type="radio" id="ra5_2" name="ST-05" value="1"></td>
            <td><label for="ra5_3" class="hidden"></label><input type="radio" id="ra5_3" name="ST-05" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>6</th>
            <td>물건이나 사람의 이름을 대기가 힘들어 머뭇거린다.</td>
            <td><label for="ra6_1" class="hidden"></label><input type="radio" id="ra6_1" name="ST-06" value="0"></td>
            <td><label for="ra6_2" class="hidden"></label><input type="radio" id="ra6_2" name="ST-06" value="1"></td>
            <td><label for="ra6_3" class="hidden"></label><input type="radio" id="ra6_3" name="ST-06" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>7</th>
            <td> 대화 중 내용이 이해되지 않아 반복해서 물어본다.</td>
            <td><label for="ra7_1" class="hidden"></label><input type="radio" id="ra7_1" name="ST-07" value="0"></td>
            <td><label for="ra7_2" class="hidden"></label><input type="radio" id="ra7_2" name="ST-07" value="1"></td>
            <td><label for="ra7_3" class="hidden"></label><input type="radio" id="ra7_3" name="ST-07" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>8</th>
            <td>길을 잃거나 헤맨 적이 있다.</td>
            <td><label for="ra8_1" class="hidden"></label><input type="radio" id="ra8_1" name="ST-08" value="0"></td>
            <td><label for="ra8_2" class="hidden"></label><input type="radio" id="ra8_2" name="ST-08" value="1"></td>
            <td><label for="ra8_3" class="hidden"></label><input type="radio" id="ra8_3" name="ST-08" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>9</th>
            <td>예전에 비해서 계산능력이 떨어졌다.<br>(예: 물건값이나 거스름돈 계산을 못한다.)</td>
            <td><label for="ra9_1" class="hidden"></label><input type="radio" id="ra9_1" name="ST-09" value="0"></td>
            <td><label for="ra9_2" class="hidden"></label><input type="radio" id="ra9_2" name="ST-09" value="1"></td>
            <td><label for="ra9_3" class="hidden"></label><input type="radio" id="ra9_3" name="ST-09" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>10</th>
            <td>예전에 비해 성격이 변했다.</td>
            <td><label for="ra10_1" class="hidden"></label><input type="radio" id="ra10_1" name="ST-10" value="0"></td>
            <td><label for="ra10_2" class="hidden"></label><input type="radio" id="ra10_2" name="ST-10" value="1"></td>
            <td><label for="ra10_3" class="hidden"></label><input type="radio" id="ra10_3" name="ST-10" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>11</th>
            <td>이전에 잘 다루던 기구의 사용이 서툴러졌다.<br>(세탁기, 전기밥솥, 경운기 등)</td>
            <td><label for="ra11_1" class="hidden"></label><input type="radio" id="ra11_1" name="ST-11" value="0"></td>
            <td><label for="ra11_2" class="hidden"></label><input type="radio" id="ra11_2" name="ST-11" value="1"></td>
            <td><label for="ra11_3" class="hidden"></label><input type="radio" id="ra11_3" name="ST-11" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>12</th>
            <td>예전에 비해 방이나 집안의 정리 정돈을 하지 못한다.</td>
            <td><label for="ra12_1" class="hidden"></label><input type="radio" id="ra12_1" name="ST-12" value="0"></td>
            <td><label for="ra12_2" class="hidden"></label><input type="radio" id="ra12_2" name="ST-12" value="1"></td>
            <td><label for="ra12_3" class="hidden"></label><input type="radio" id="ra12_3" name="ST-12" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>13</th>
            <td>상황에 맞게 스스로 옷을 선택하여 입지 못한다.</td>
            <td><label for="ra13_1" class="hidden"></label><input type="radio" id="ra13_1" name="ST-13" value="0"></td>
            <td><label for="ra13_2" class="hidden"></label><input type="radio" id="ra13_2" name="ST-13" value="1"></td>
            <td><label for="ra13_3" class="hidden"></label><input type="radio" id="ra13_3" name="ST-13" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>14</th>
            <td>혼자 대중교통 수단을 이용하여 목적지에 가기 힘들다.<br>(관절염 등 신체적인 문제로 인한 것은 제외)</td>
            <td><label for="ra14_1" class="hidden"></label><input type="radio" id="ra14_1" name="ST-14" value="0"></td>
            <td><label for="ra14_2" class="hidden"></label><input type="radio" id="ra14_2" name="ST-14" value="1"></td>
            <td><label for="ra14_3" class="hidden"></label><input type="radio" id="ra14_3" name="ST-14" value="2"><input type="hidden" name="rad"></td>
          </tr>
          <tr>
            <th>15</th>
            <td>내복이나 옷이 더러워져도 갈아입지 않으려고 한다.</td>
            <td><label for="ra15_1" class="hidden"></label><input type="radio" id="ra15_1" name="ST-15" value="0"></td>
            <td><label for="ra15_2" class="hidden"></label><input type="radio" id="ra15_2" name="ST-15" value="1"></td>
            <td><label for="ra15_3" class="hidden"></label><input type="radio" id="ra15_3" name="ST-15" value="2"><input type="hidden" name="rad"></td>
          </tr>
</tbody>
</table>
</div>
<div class="btnboxC">
  <form action="" method="">
  <button class="btn_red_normal" formaction="/TAB_PAGE/self_test_road/${userDetailsBean.username}" formmethod="post" onclick="javascript:chkDepressive();">결과보기</button>
  <button class="btn_blue_normal" formaction="/TAB_PAGE/self_test" formmethod="post" onclick="javascript:document.frmChkDepressive.reset();">다시하기</button>
  </form>
</div>
</form>
</div>
</body>
<%@ include file="../mainbar/footer.jsp" %>
<script>
  function chkDepressive() {
    var radios = document.querySelectorAll('input[type="radio"]:checked');
      if (radios.length !== 15) {
        alert('모든 항목에 답변을 선택해주세요.');
        return false; // 폼이 제출되지 않고 화면이 유지됨
      }
      // 폼의 formaction 속성을 동적으로 설정하여 결과 페이지로 이동
      var form = document.querySelector('form[name="frmChkDepressive"]');
      form.setAttribute('action', '/TAB_PAGE/self_test_road_result');
      return true; // 폼이 정상적으로 제출됨
    }

    // 폼에 onsubmit 이벤트 핸들러를 추가하여 폼이 제출될 때 chkDepressive 함수 실행
    var form = document.querySelector('form[name="frmChkDepressive"]');
    form.onsubmit = function() {
      return chkDepressive();
  }
</script>
</html>