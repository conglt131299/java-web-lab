<%-- 
    Document   : message
    Created on : Sep 10, 2019, 4:02:20 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String keyword = (String) request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h3 style="color: red;">Not found!</h3>
        <p>Can not find any articles with keyword '<%=keyword%>'</p>
    </body>
</html>
