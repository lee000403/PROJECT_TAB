<%@ page import="java.util.HashMap, java.util.ArrayList" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bootstrap 5 Template</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
        </head>

        <body>

            <!-- Menu -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="#">Logo</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <% HashMap params=(HashMap)request.getAttribute("params"); String
                searchStr=(String)params.getOrDefault("search", "" ); HashMap
                result=(HashMap)request.getAttribute("result"); %>
                <form action="" method="post">
                    <div class="container mt-4">
                        <div class="row">
                            <div class="col-md-8">
                                <h2>Search</h2>
                                <div class="input-group mb-3">
                                    <select class="form-select" name="search">
                                        <option>Select an option...</option>
                                        <option value="COMMON_CODE_ID" <%=(searchStr.equals("COMMON_CODE_ID")) ? "selected" : "" %>>COMMON_CODE_ID
                                        </option>
                                        <option value="NAME" <%=(searchStr.equals("NAME")) ? "selected" : "" %>
                                            >NAME</option>
                                        <option value="DESCRIPTION" <%=(searchStr.equals("DESCRIPTION")) ? "selected" : "" %>>DESCRIPTION
                                        </option>
                                        <option value="PARENT_COMMON_CODE_ID" <%=(searchStr.equals("PARENT_COMMON_CODE_ID")) ? "selected" : "" %>>PARENT_COMMON_CODE_ID
                                        </option>
                                    </select>
                                    <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                                        class="form-control" placeholder="Search..." id="keydownEnter">
                                    <button class="btn btn-primary" type="submit"
                                        formaction="/carInfor/map/commonSearch" formmethod="post">Go</button>
                                </div>
                                <h2>Table</h2>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>COMMON_CODE_ID</th>
                                            <th>NAME</th>
                                            <th>DESCRIPTION</th>
                                            <th>PARENT_COMMON_CODE_ID</th>
                                            <th>클릭 버튼</th>
                                        </tr>
                                    </thead>
                                    <tbody id="carTableBody">
                                        <% ArrayList resultList=(ArrayList)result.get("resultList"); for(int i=0; i <
                                            resultList.size(); i=i+1){ HashMap record=(HashMap)resultList.get(i); %>
                                            <tr>
                                                <td>
                                                    <%= record.get("COMMON_CODE_ID") %>
                                                </td>
                                                <td>
                                                    <%= record.get("NAME") %>
                                                </td>
                                                <td>
                                                    <%= record.get("DESCRIPTION") %>
                                                </td>
                                                <td>
                                                    <%= record.get("PARENT_COMMON_CODE_ID") %>
                                                </td>
                                                <td>
                                                    <button
                                                        formaction='/carInfor/map/deleteAndSelectSearch_Com/<%= record.get("COMMON_CODE_ID") %>'
                                                        formmethod="post">Del</button>
                                                    </form>
                                                    <form action="">
                                                    <button formaction='/carInfor/map/update_Com/<%= record.get("COMMON_CODE_ID") %>' formmethod="post">update</button>
                                                </form>
                                                </td>
                                            </tr>
                                            <% } %>
                                                <!-- Empty -->
                                    </tbody>
                                </table>
                                <form action="">
                                    <button formaction="/carInfor/map/insert_Com" formmethod="post">insert</button>
                                </form>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>


                <!-- Footer -->
                <footer class="bg-dark text-white text-center py-4 mt-4">
                    <div class="container">
                        <p>&copy; 2023 Your Website. All Rights Reserved.</p>
                    </div>
                </footer>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>