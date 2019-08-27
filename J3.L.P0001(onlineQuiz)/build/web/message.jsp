<%-- 
    Document   : message
    Created on : Aug 19, 2019, 5:19:35 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            h4 {
                text-align: left;
                margin-left: 10px;
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <h4><%=message%></h4>
    </body>
</html>
