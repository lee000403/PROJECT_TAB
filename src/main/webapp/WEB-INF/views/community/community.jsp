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
            </style>
        </head>

        <body>
            <%@ include file="../mainbar/header.jsp" %>
                <% HashMap params=(HashMap)request.getAttribute("params"); String
                    searchStr=(String)params.getOrDefault("search", "" ); HashMap
                    result=(HashMap)request.getAttribute("result"); %>
                    <div class="container mt-4">
                        <h1 class="text-center">선생님, 질문있습니다!</h1>
                        <form action="">
                            <select class="form-select" name="search">
                                <option>Select an option...</option>
                                <option value="POST_TITLE" <%=(searchStr.equals("POST_TITLE")) ? "selected" : "" %>>제목명
                                </option>
                                <option value="MEMBERID" <%=(searchStr.equals("MEMBERID")) ? "selected" : "" %>
                                    >작성자</option>
                            </select>
                            <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                                class="form-control" placeholder="Search..." id="keydownEnter">
                            <button class="btn btn-primary" type="submit" formaction='/TAB_PAGE/search_community/'
                                formmethod="post">검색</button>
                        </form>
                        <div class="row mt-4">
                            <div class="col-md-12">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">작성자</th>
                                            <th scope="col">작성일</th>
                                        </tr>
                                    </thead>
                                    <% Paginations paginations=(Paginations)result.get("paginations"); %>
                                        <% String userId=(String)result.get("userId"); %>
                                            <% ArrayList resultList=(ArrayList)result.get("resultList"); for(int i=0; i
                                                < resultList.size(); i=i+1){ HashMap record=(HashMap)resultList.get(i);
                                                %>
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
                                                                    formaction='/TAB_PAGE/community_answer/<%=record.get("POST_ID")%>' formmethod="post"> 
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
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link"
                                                href='/TAB_PAGE/search_community/?currentPage=<%=paginations.getPreviousPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'>Previous</a>
                                        </li>
                                        <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){
                                            %>
                                            <li class="page-item">
                                                <a class="page-link"
                                                    href='/TAB_PAGE/search_community/?currentPage=<%=i%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'>
                                                    <%= i %>
                                                </a>
                                            </li>
                                            <% } %>
                                                <li class="page-item">
                                                    <a class="page-link"
                                                        href='/TAB_PAGE/search_community/?currentPage=<%=paginations.getNextPage()%>&search=<%=params.getOrDefault("search", "" )%>&words=<%=params.getOrDefault("words", "" )%>'>Next</a>
                                                </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-12 text-center">
                                <form action="">
                                    <button class="btn btn-reply" formaction="/TAB_PAGE/community_write" formmethod="post">글쓰기</button>
                                </form>
                            </div>
                        </div>
                    </div>
        </body>
        <%@ include file="../mainbar/footer.jsp" %>

        </html>