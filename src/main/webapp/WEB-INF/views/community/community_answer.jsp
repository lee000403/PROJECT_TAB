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
                            <input type="hidden" value='<%=result.get("POST_ID")%>'
                            id="post_id" name="post_id">

                            <!-- 현재 로그인한 사람의 userid를 param member_id로 넘겨야 함 -->
                            
                            <input type="hidden" value='<%= "userId" %>' id="member_id">
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
                                                <th></th>
                                                <th style="width: 70px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody id="datashow">
                                            <% ArrayList resultList_comment=(ArrayList)
                                                request.getAttribute("result_comment");
                                                for(int i=0; i < resultList_comment.size(); i ++) {
                                                    HashMap record=(HashMap)
                                                resultList_comment.get(i); %>

                                                <tr class="selected_comment">
                                                    <td class="table_comment">
                                                        <%= record.get("COMMENT") %>
                                                    </td>
                                                    <td class="date_box table_comment">
                                                        <%= record.get("COMMENT_DATE") %>
                                                    </td>
                                                    <td style="text-align: center; cursor: pointer;" class="table_comment">
                                                        <% if (userId.equals(record.get("MEMBERID"))) { %>
                                                                <button
                                                                    style="border: none; background-color: white;"
                                                                    class="delete_Button"
                                                                    value="<%= record.get("COMMENT_ID") %>">
                                                                    삭제
                                                                </button>
                                                            <% } %>
                                                    </td>
                                                    <td>
                                                        <div class="new_deleteButtonBox">

                                                        </div>
                                                    </td>
                                                </tr>
                                                <% } %>
                                               
                                                    <tr class="" id="reply_template">
                                                        <td class="table_comment">
                                                        </td>
                                                        <td class="table_comment date_box">
                                                        </td>
                                                        <td class="table_comment" style="text-align: center;">
                                                        </td>
                                                    </tr>
                                        </tbody>
                                    </table>
                                </div>
                                    <input class="textbox" type="text" placeholder="글을 입력해 주세요"
                                        id="comment">
                                    <button class="comment_btn" id="newComment" name="newComment">답글 남기기</button>
                            </div>
                </body>


                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script type="module" src="/js/community_comment.js"></script>
                <%@ include file="../mainbar/footer.jsp" %>


            </html>