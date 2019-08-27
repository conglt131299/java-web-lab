<%-- 
    Document   : welcome
    Created on : Aug 19, 2019, 3:40:28 PM
    Author     : Cong Le
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            h4, p {
                text-align: left;
                margin-left: 10px;
            }
            
            span {
                color: blue;
            }
        </style>
    </head>
    <body>
        <h4 style="margin-top: 50px; ">Welcome <span><%=user.getUsername() %></span></h4>
        <p>This is a online quiz system. You can review and test in this system.</p>
    </body>
</html>
