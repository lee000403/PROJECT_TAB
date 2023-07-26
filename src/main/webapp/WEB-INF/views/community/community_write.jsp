<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Dementia Bulletin Board - Write</title>
    <style>
        /* Additional CSS for popup */
        .modal-dialog {
            max-width: 600px;
            margin: 30px auto;
            height: 500px;
            /* 원하는 높이 값으로 조정 */
            max-height: 80vh;
            /* 원하는 최대 높이 값으로 조정 */
        }
        .comment-reply {
            margin-left: 50px;
        }

        body {
            padding-top: 10rem;
            background-color: #fff;
            justify-content: center;
            align-items: center;
            height: 100vh;
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

        .post-title {
            font-weight: bold; font-size: 22px; border-bottom: 1px solid #0000004d;margin-bottom:10px;
        }
        header {
            position: fixed;
            background-color: #fef0ea;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 100;
        }
        .btn-reply{
            background-color: #ff7f95;
        }
    </style>
</head>

<body>
    <%@ include file="../mainbar/header.jsp" %>
    <sec:authentication property="principal" var="userDetailsBean" />
    <div class="container mt-4">
        <h1 class="text-center"></h1>

        <div class="row mt-4">
            <div class="col-md-6 offset-md-3">
                <form>
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
                        <textarea class="form-control" id="content" name="POST_CONTENT" rows="5" placeholder="내용을 입력합니다"></textarea >
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-reply" formaction="/TAB_PAGE/community_end/${userDetailsBean.username}" formmethod="">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>