<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/CSSs/community_write.css">
    <title>Dementia Bulletin Board - Write</title>
</head>

<body>
    <%@ include file="../mainbar/header.jsp" %>
    <sec:authentication property="principal" var="userDetailsBean" />
    <div class="container mt-5">
        <h1 class="text-center"></h1>

        <div class="row mt-4">
            <div class="col-md-6 offset-md-3 mt-5">
                <form class="write_form">
                    <div class="form-group">
                        <label for="name">작성자명</label>
                        <input type="text" class="form-control" id="name" name="name" maxlength="30" placeholder="작성자" value="${userDetailsBean.memberName}">
                    </div>
                        <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" class="form-control" id="title" name="POST_TITLE" maxlength="30" placeholder="제목을 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea class="form-control content_control" id="content" name="POST_CONTENT" rows="5" placeholder="내용을 입력합니다"></textarea >
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-reply" formaction='/TAB_PAGE/community_end/${userDetailsBean.username}' formmethod="post" style="background-color: #ff7f95;">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>