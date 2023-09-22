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
    <link rel="stylesheet" href="/CSSs/community_answer.css">
    <script src="/js/community_comment.js"></script>
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
                        <button type="submit" formaction='/TAB_PAGE/community_update/<%=result.get("POST_ID")%>' formmethod="post" class="btn btn-edit">수정</button>
                        <button type="submit" formaction='/TAB_PAGE/community_deleteandSelect/<%=result.get("POST_ID")%>' formmethod="post" class="btn btn-delete">삭제</button>
                        <button type="submit" formaction="/TAB_PAGE/search_community/" formmethod="post" class="btn btn-list">목록</button>
                    </form>
                    </sec:authorize>
                    <% String member =  (String)result.get("MEMBERID"); %>
                    <% String userId = (String)params.get("userId"); %>
                    <% if (userId.equals(member)) { %>
                        <form action="">
                            <button type="submit" formaction='/TAB_PAGE/community_update/<%=result.get("POST_ID")%>' formmethod="post" class="btn btn-edit">수정</button>
                            <button type="submit" formaction='/TAB_PAGE/community_deleteandSelect/<%=result.get("POST_ID")%>' formmethod="post" class="btn btn-delete">삭제</button>
                            <button type="submit" formaction="/TAB_PAGE/search_community/" formmethod="post" class="btn btn-list">목록</button>
                        </form>
                    <% } else { %>
                        <form action="">
                            <button type="submit" formaction="/TAB_PAGE/search_community/" formmethod="post" class="btn btn-list" style="background-color: #ff7f95;">목록으로 돌아가기</button>
                        </form>
                    <% } %>
                </div>
            </div>
        </form>

        <div class="container">
            <label for="newComment">Add your comment below-</label>
            <textarea id="newComment"></textarea>
            <button id="addComments">Add Comment</button>
            <div id="allComments"></div>
        </div>






        <!-- <div class="row mt-4">
            <div class="col-md-12">
                <h4>전체 댓글</h4>
                <div class="card comment-section">
                    <div class="card-body">
                        <div class="media">
                            <div class="media-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="mt-0">John Doe</h5>

                                    <div>
                                        <button class="btn btn-sm btn-reply"
                                            onclick="showReplyForm('comment1')">답글</button>
                                        <button class="btn btn-sm btn-edit">수정</button>
                                        <button class="btn btn-sm btn-delete">삭제</button>
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
                                        <button class="btn btn-sm btn-reply" onclick="showReplyForm('comment2')">답글</button>
                                        <button class="btn btn-sm btn-edit">수정</button>
                                        <button class="btn btn-sm btn-delete">삭제</button>
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
                            <button type="submit" class="btn btn-reply" formaction="/TAB_PAGE/community_answer" formmethod="post">제출</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <h2>댓글 작성하기</h2>
                <form>
                    <div class="form-group">
                        <label for="comment-text">내용:</label>
                        <textarea class="form-control" id="comment-text" rows="3"></textarea>
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-reply" style="background-color: #ff7f95;">제출</button>
                    </div>
                </form>
            </div>
        </div>
    </div> -->
</body>
<%@ include file="../mainbar/footer.jsp" %>
</html>