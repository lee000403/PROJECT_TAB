<%@ page import="java.util.HashMap, java.util.ArrayList, com.yojulab.study_springboot.utills.Paginations" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%  HashMap
    result=(HashMap)request.getAttribute("result"); %>
    <div>
        <% ArrayList resultList=(ArrayList)result.get("resultList"); 
        for(int i=0; i < resultList.size(); i=i+1) 
        { HashMap record=(HashMap)resultList.get(i);
        %>
        <div>
            <%= record.get("name") %>
        </div>
        <% } %>
    </div>    
</body>
</html>