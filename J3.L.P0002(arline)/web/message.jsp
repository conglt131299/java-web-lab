<%-- 
    Document   : message
    Created on : Aug 27, 2019, 5:20:56 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String message = (String)request.getAttribute("content");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            h1 {
                margin-top: 50px;
                margin-left: 50px;
            }
        </style>
    </head>
    <body>
        <h1><%=message%></h1>
    </body>
</html>
