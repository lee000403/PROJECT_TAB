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
                <script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.3.2/uuid.min.js"></script>

            </head>
            <%@ include file="../mainbar/header.jsp" %>

                <body>
                    <%@ include file="../mainbar/header.jsp" %>
                        <% HashMap params=(HashMap)request.getAttribute("params"); HashMap
                            result=(HashMap)request.getAttribute("result"); %>
                            <div class="container mt-4">
                                <form class="" action="">
                                    <div class="row mt-4">
                                        <div class="col-md-12">
                                            <article style="border: 1px solid #ccc; padding: 20px;">
                                                <div class="post-title">
                                                    <%= result.get("POST_TITLE") %>
                                                </div>
                                                <div class="post-subtitle">작성자 : <%=result.get("MEMBERID")%> 작성일 :
                                                        <%=result.get("POST_DATE")%>
                                                </div>
                                                <p class="post-content">
                                                    <%= result.get("POST_CONTENT") %>
                                                </p>
                                            </article>
                                        </div>

                                        <div class="row mt-4 btn-group">
                                            <sec:authorize access="hasAnyRole('ROLE_DOCTOR')">
                                                <form action="">
                                                    <button type="submit"
                                                        formaction='/TAB_PAGE/community_update/<%=result.get("POST_ID")%>'
                                                        formmethod="post" class="btn btn-edit">수정</button>
                                                    <button type="submit"
                                                        formaction='/TAB_PAGE/community_deleteandSelect/<%=result.get("POST_ID")%>'
                                                        formmethod="post" class="btn btn-delete">삭제</button>
                                                    <button type="submit" formaction="/TAB_PAGE/search_community/"
                                                        formmethod="post" class="btn btn-list">목록</button>
                                                </form>
                                            </sec:authorize>
                                            <% String member=(String)result.get("MEMBERID"); %>
                                                <% String userId=(String)params.get("userId"); %>
                                                    <% if (userId.equals(member)) { %>
                                                        <form action="">
                                                            <input type="hidden" value='<%=result.get("POST_ID")%>'
                                                                id="post_id" name="post_id">
                                                            <button type="submit"
                                                                formaction='/TAB_PAGE/community_update/<%=result.get("POST_ID")%>'
                                                                formmethod="post" class="btn btn-edit">수정</button>
                                                            <button type="submit"
                                                                formaction='/TAB_PAGE/community_deleteandSelect/<%=result.get("POST_ID")%>'
                                                                formmethod="post" class="btn btn-delete">삭제</button>
                                                            <button type="submit"
                                                                formaction="/TAB_PAGE/search_community/"
                                                                formmethod="post" class="btn btn-list">목록</button>
                                                        </form>
                                                        <% } else { %>
                                                            <!-- <form action="">
                                                                <button type="submit"
                                                                    formaction="/TAB_PAGE/search_community/"
                                                                    formmethod="post" class="btn btn-list"
                                                                    style="background-color: #ff7f95;">목록으로
                                                                    돌아가기</button>
                                                            </form> -->
                                                            <% } %>
                                        </div>
                                    </div>
                                </form>

                                <div>
                                    <table class="comment_table">
                                        <thead>
                                            <tr class="table-head">
                                                <th>답글</th>
                                                <th>날짜</th>
                                            </tr>

                                            <% ArrayList resultList_comment=(ArrayList)
                                                request.getAttribute("result_comment"); for(int i=0; i <
                                                resultList_comment.size(); i ++) { HashMap record=(HashMap)
                                                resultList_comment.get(i); %>

                                                <tr>
                                                    <td>
                                                        <%= record.get("COMMENT") %>
                                                    </td>
                                                    <td class="date_box">
                                                        <%= record.get("COMMENT_DATE") %>
                                                    </td>
                                                </tr>
                                                <% } %>
                                        </thead>
                                        <tbody id="datashow"></tbody>
                                    </table>
                                    </tbody>

                                    <ul class="newcomments" id="comments"></ul>

                                </div>
                                <form id="newComment">
                                    <input type="text" name="comment" placeholder="답글" id="comment">

                                    <button class="comment_btn" onclick="fetchUpdate()">답글 남기기</button>
                                </form>

                            </div>
                </body>
                <script src="/js/community_comment.js"></script>
                <%@ include file="../mainbar/footer.jsp" %>

            </html>