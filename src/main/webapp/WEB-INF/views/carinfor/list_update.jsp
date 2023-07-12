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
            <form>
              <h2>update page</h2>
              <div>NAME</div>
              <div><input name="NAME" type="text"></div>
              <div>SYSTEM_CODE_YN</div>
              <div><input name="SYSTEM_CODE_YN" type="text"></div>
              <div>MODIFIER_SEQ</div>
              <div><input name="MODIFIER_SEQ" type="text"></div>
              <div>MODIFY_DATE</div>
              <div><input name="MODIFY_DATE" type="text"></div>
              <button type="submit" formaction='/carInfor/map/updateAndSelectsearch_Com/${UNIQUE_ID}' formmethod="post">전송</button>
            </form>
        </body>

        </html>