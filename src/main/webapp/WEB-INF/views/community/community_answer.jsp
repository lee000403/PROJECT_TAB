<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<sec:authentication property="principal" var="userDetailsBean" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Post Detail</title>
    <style>
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
            font-weight: bold;
            font-size: 22px;
            border-bottom: 1px solid #0000004d;
            padding-bottom: 10px;

        }

        .post-subtitle {
            font-size: 12px;
            border-bottom: 1px solid #0000004d;
            margin-bottom: 10px;
        }

        header {
            position: fixed;
            background-color: #fef0ea;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 100;
        }

        .btn-reply {
            background-color: #ff7f95;
        }

        .btn-group {
            float: right;
            margin-right: auto;

        }

        .btn-group .text-right {
            text-align: right;
        }


        .btn-edit {
            background-color: yellow;
            margin-right: 10px;
        }

        .btn-delete {
            background-color: yellow;
            margin-right: 10px;
        }

        .btn-list {
            background-color: yellow;
            margin-right: 10px;
        }

        /* Adjust comment section height */
        .comment-section {
            height: 250px;
            overflow-y: auto;
        }
    </style>
</head>
<%@ include file="../mainbar/header.jsp" %>
<body>
    <%@ include file="../mainbar/header.jsp" %>
    <% HashMap params=(HashMap)request.getAttribute("params");
    HashMap result=(HashMap)request.getAttribute("result"); %>
    <div class="container mt-4">
        <h1 class="text-center">커뮤니티</h1>
        <form action="">
            <div class="row mt-4">
                <div class="col-md-12">
                    <article style="border: 1px solid #ccc; padding: 20px;">
                        <div class="post-title"><%= result.get("POST_TITLE") %></div>
                        <div class="post-subtitle">작성자 : <%=result.get("MEMBERID")%> 작성일 : <%=result.get("POST_DATE")%></div>
                        <p><%= result.get("POST_CONTENT") %></p>
                    </article>
                </div>

                <div class="row mt-4 btn-group">
                    <sec:authorize access="hasAnyRole('ROLE_DOCTOR')">
                    <form action="">
                        <button type="submit" formaction='/TAB_PAGE/community_update/<%=result.get("POST_ID")%>' class="btn btn-edit">수정</button>
                        <button type="submit" formaction='/TAB_PAGE/community_deleteandSelect/<%=result.get("POST_ID")%>' class="btn btn-delete">삭제</button>
                        <button type="submit" formaction="/TAB_PAGE/community" class="btn btn-list">목록</button>
                    </form>
                    </sec:authorize>
                    <% String member =  (String)result.get("MEMBERID"); %>
                    <% String userId = (String)params.get("userId"); %>
                    <% if (userId.equals(member)) { %>
                        <form action="">
                            <button type="submit" formaction='/TAB_PAGE/community_update/<%=result.get("POST_ID")%>' class="btn btn-edit">수정</button>
                            <button type="submit" formaction='/TAB_PAGE/community_deleteandSelect/<%=result.get("POST_ID")%>' class="btn btn-delete">삭제</button>
                            <button type="submit" formaction="/TAB_PAGE/community" class="btn btn-list">목록</button>
                        </form>
                    <% } else { %>
                        <form action="">
                            <button type="submit" formaction="/TAB_PAGE/community" class="btn btn-list">목록</button>
                        </form>
                    <% } %>
                </div>
            </div>
        </form>

        <div class="row mt-4">
            <div class="col-md-12">
                <h4>전체 댓글</h4>
                <div class="card comment-section"> <!-- Added comment-section class -->
                    <div class="card-body">
                        <div class="media">
                            <div class="media-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="mt-0">John Doe</h5>

                                    <div>
                                        <button class="btn btn-sm btn-reply"
                                            onclick="showReplyForm('comment1')">Reply</button>
                                        <button class="btn btn-sm btn-edit">Edit</button>
                                        <button class="btn btn-sm btn-delete">Delete</button>
                                    </div>
                                </div>
                                <p class="mb-0">It's too hard to be tired. Get some more rest!</p>
                                <small class="text-muted">2023-07-06</small>
                            </div>
                        </div>

                        <div class="media mt-3 comment-reply">
                            <div class="media-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="mt-0">↳ Jane Smith</h5>
                                    <div>
                                        <button class="btn btn-sm btn-reply" onclick="showReplyForm('comment2')">Reply</button>
                                        <button class="btn btn-sm btn-edit">Edit</button>
                                        <button class="btn btn-sm btn-delete">Delete</button>
                                    </div>
                                </div>
                                <p class="mb-0">Cheer up a little. Cheer up with positive thoughts!</p>
                                <small class="text-muted">2023-07-07</small>
                            </div>
                        </div>

                        <form class="mt-3" id="commentForm" style="display: none;">
                            <div class="form-group">
                                <textarea class="form-control" rows="3" placeholder="Write your comment"></textarea>
                            </div>
                            <button type="submit" class="btn btn-reply" formaction="community_answer" formmethod="">Submit</button>
                        </form>
                    </div>
                </div>

                <!-- Add more comment threads as needed -->
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <h2>Write a Comment</h2>
                <form>
                    <div class="form-group">
                        <label for="comment-text">Comment:</label>
                        <textarea class="form-control" id="comment-text" rows="3"></textarea>
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-reply">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>