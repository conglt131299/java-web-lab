<%-- 
    Document   : index
    Created on : Aug 26, 2019, 10:51:11 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String includePage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
