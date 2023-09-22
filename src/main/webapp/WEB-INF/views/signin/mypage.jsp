<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 마이페이지</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
      background-color: #fef0ea;
      padding-top: 130px
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      font-weight: bold;
    }
    .profile-picture {
      text-align: center;
      margin-bottom: 20px;
    }
    .profile-picture img {
      width: 200px;
      height: 200px;
      object-fit: cover;
      border-radius: 50%;
    }
    .btn-primary {
      background-color: #ff92b3;
      border-color: #ff92b3;
    }
  </style>
</head>
<body>
  <%@ include file="../mainbar/header.jsp" %>
  <% HashMap params=(HashMap)request.getAttribute("params"); String
  searchStr=(String)params.getOrDefault("search", "" ); HashMap
  result=(HashMap)request.getAttribute("result"); %>
  <sec:authentication property="principal" var="userDetailsBean" />
  <div class="container">
    <h1>마이페이지</h1>
    <form>
      <div class="form-group">
        <label for="username">아이디:</label>
        <input type="text" class="form-control" id="username" value="<%=result.get("MEMBERID") %>" readonly>
      </div>
      <div class="form-group">
        <label for="name">이름:</label>
        <input type="text" class="form-control" id="name" name="name" value="<%=result.get("MEMBERNAME") %>">
      </div>
      <div class="form-group">
        <label for="auth">회원 타입:</label>
        <% String auth = (String) result.get("MEMBERTYPE_ID");%>
        <% if (auth.equals("M_04")) { %>
          <input type="text" class="form-control" id="auth" name="auth" value="전문의">
        <%} else if (auth.equals("M_03")) { %>
          <input type="text" class="form-control" id="auth" name="auth" value="파트너">
        <% }else if (auth.equals("M_02")) { %>
          <input type="text" class="form-control" id="auth" name="auth" value="가족">
        <% }else if (auth.equals("M_01")) { %>
          <input type="text" class="form-control" id="auth" name="auth" value="본인">
        <% } %>
      </div>
      <div class="form-group">
        <label for="gender">성별:</label>
        <br>
        <% String g = (String)result.get("GENDER_ID"); %>
        <label><input type="radio" name="gender" value="G_01" <%= g.equals("G_01") ? "checked=\"checked\"" : "" %>> 남성</label>
        <label><input type="radio" name="gender" value="G_02" <%= g.equals("G_02") ? "checked=\"checked\"" : "" %>> 여성</label>
      </div>
      <div class="form-group">
        <label for="birthdate">생년월일:</label>
        <input type="date" class="form-control" id="birthdate" name="birthdate" value='<%= result.get("BIRTHDATE") %>'>
      </div>
      <div class="form-group">
        <label for="phone">전화번호:</label>
        <input type="tel" class="form-control" id="phone" name="phone" value="<%=result.get("PHONENUMBER") %>">
      </div>
      <div class="form-group">
        <label for="address">주소:</label>
        <input type="text" class="form-control" id="address" name="address" value="<%=result.get("MEMBERADDRESS") %>">
      </div>
      <div class="form-group">
        <label for="email">이메일 주소:</label>
        <input type="email" class="form-control" id="email" name="email" value="<%=result.get("EMAIL") %>">
      </div>
      <div class="form-group">
        <label for="introduction">자기소개:</label>
        <textarea class="form-control" id="introduction" name="introduction"><%=result.get("INTRODUCTION")%></textarea>
      </div>
      <div>
        <button type="submit" formaction="/TAB_PAGE/mypage_update/${userDetailsBean.username}" formmethod="post" class="btn" style="background-color: #ff7f95;">수정하기</button>
        <button type="submit" formaction="/TAB_PAGE/mypage_ID_del/<%=result.get("MEMBERID") %>" formmethod="post" class="btn" style="background-color: #ff7f95;">회원탈퇴</button>
      </div>
    </form>
  </div>
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>
