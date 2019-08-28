<%-- 
    Document   : index
    Created on : Aug 26, 2019, 10:51:11 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String includePage = (String)request.getAttribute("page");
    
    /*
        Determine title of page when user access.
     */
    String title = "";
    if (request.getAttribute("path").equals("/login")) {
        title = "Login";
    } else if (request.getAttribute("path").equals("/home")) {
        title = "Home";
    } else if (request.getAttribute("path").equals("/register")) {
        title = "Register";
    } else if (request.getAttribute("path").equals("/book")) {
        title = "Book";
    } else if (request.getAttribute("path").equals("/manage_booking")) {
        title = "Manage Book";
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=title%></title>
        <style type="text/css">
            .container {
                position: relative;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <jsp:include page="header.jsp" />
        </div>
        <div class="container">
            <jsp:include page="<%=includePage%>" />
        </div>
    </body>
</html>
