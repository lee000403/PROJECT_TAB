<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<sec:authentication property="principal" var="userDetailsBean" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <title>Post Detail</title>
    <link rel="stylesheet" href="/CSSs/community_answer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.3.2/uuid.min.js"></script>
    
</head>
<body>
    <%@ include file="../mainbar/header.jsp" %>
    <form action="/files/insertMulti" method="post" id="insertForm" enctype="multipart/form-data">
        <div class="container mt-5">
            <div class="container mt-4">
                <div class="row">
                    <h1>Insert Form</h1>

                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="file title">
                    </div>
                    <div class="mb-3">
                        <label for="editor" class="form-label">Content</label>
                        <div id="editor" style="height: 300px;" class="form-control"> 
                            <b>file contents</b>
                        </div>
                        <input type="hidden" name="content" id="contentInput" />
                    </div>
                    <%
                    for (int i = 0; i < 2; i += 1) {
                    %>
                    <div class="mb-3">
                        <label for="fileUpload_${i}" class="form-label">File Upload</label>
                        <input type="file" class="form-control-file" id="fileUpload_${i}" name="fileUpload_${i}" />
                    </div>
                    <%
                    }
                    %>                    

                    <button type="submit" class="btn btn-primary">Submit</button>

                </div>
            </div>
        </div>

    </form>

<h2>답글</h2>
<ul id="comments"></ul>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
    let quill = new Quill('#editor', {
        theme: 'snow'
    });

    quill.setContents(${content});

    // Set hidden input value before form submission
    let form = document.querySelector('#insertForm');
    form.onsubmit = function () {
        var contentInput = document.querySelector('#contentInput');
        contentInput.value = quill.root.innerHTML;
        return true;
    };
</script>
</body>
<script src="/js/community_comment.js"></script>
</html>