<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <title>Dementia Bulletin Board</title>

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

                .post-title {
                    font-weight: bold;
                    font-size: 22px;
                    border-bottom: 1px solid #0000004d;
                    margin-bottom: 10px;
                }

                .btn-reply {
                    background-color: #ff7f95;
                }

                .btn-link {
                    background-color: transparent;
                    border: none;
                    padding: 0;
                    font-size: inherit;
                    color: black;
                    /* You can set the desired text color here */
                    text-decoration: none;
                    cursor: pointer;
                }

                .pagination-container {
    display: flex;
    justify-content: center;
}
            </style>
        </head>

        <body>
            <%@ include file="../mainbar/header.jsp" %>
                <% HashMap params=(HashMap)request.getAttribute("params"); String
                    searchStr=(String)params.getOrDefault("search", "" ); HashMap
                    result=(HashMap)request.getAttribute("result"); %>

                    <h1 class="text-center mt-5">선생님, 질문있습니다!</h1>

                    <br>

                    <form action="">
                        <div style="display: flex; align-items: center; margin: 0 500px; border: 1px solid #ccc;">
                            <select name="search" style="border: none; outline: none; background-color: transparent;">
                                <option>선택</option>
                                <option value="POST_TITLE" <%=(searchStr.equals("POST_TITLE")) ? "selected" : "" %>>제목
                                </option>
                                <option value="MEMBERID" <%=(searchStr.equals("MEMBERID")) ? "selected" : "" %>>작성자
                                </option>
                            </select>
                            <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                                placeholder="검색어를 입력하세요" style="flex: 1; border: none; outline: none;">
                            <button class="btn" type="submit" formaction='/TAB_PAGE/search_community/' formmethod="post"
                                style="background-color:#ff7f95;">찾기</button>
                        </div>
                    </form>

                    <div class="container mt-5 mb-4">
                        <table class="table table-striped" style="background-color: #ffffff;">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <% Paginations paginations=(Paginations)result.get("paginations"); %>
                                <% String userId=(String)result.get("userId"); %>
                                    <% ArrayList resultList=(ArrayList)result.get("resultList"); for(int i=0; i <
                                        resultList.size(); i=i+1){ HashMap record=(HashMap)resultList.get(i); %>
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <%=i+1%>
                                                </th>
                                                <td>
                                                    <form
                                                        action='/TAB_PAGE/community_answer/<%=record.get(" POST_ID")%>'
                                                        method="post">
                                                        <button style=" color:black; text-decoration: none;"
                                                            type="submit" class="btn btn-link"
                                                            formaction='/TAB_PAGE/community_answer/<%=record.get("POST_ID")%>'
                                                            formmethod="post">
                                                            <%= record.get("POST_TITLE") %>
                                                        </button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <%= record.get("MEMBERID") %>
                                                </td>
                                                <td>
                                                    <%= record.get("POST_DATE") %>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <%}%>
                        </table>
                    </div>

                    <div class="pagination-container">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link"
                                        href='/TAB_PAGE/search_community/?currentPage=<%=paginations.getPreviousPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'style="color: #ff7f95;">Previous</a>
                                </li>
                                <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
                                    <li class="page-item">
                                        <a class="page-link"
                                            href='/TAB_PAGE/search_community/?currentPage=<%=i%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'style="color: #ff7f95;">
                                            <%= i %>
                                        </a>
                                    </li>
                                    <% } %>
                                        <li class="page-item">
                                            <a class="page-link"
                                                href='/TAB_PAGE/search_community/?currentPage=<%=paginations.getNextPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'style="color: #ff7f95;">Next</a>
                                        </li>
                            </ul>
                        </nav>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-12 text-center">
                            <form action="">
                                <button class="btn btn-reply" formaction="/TAB_PAGE/community_write"
                                    formmethod="post" style="background-color:#ff7f95;">글쓰기</button>
                            </form>
                        </div>
                    </div>

        </body>

        </html>