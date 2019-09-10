<%-- 
    Document   : content
    Created on : Sep 8, 2019, 10:23:44 PM
    Author     : Cong Le
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Article currentArticle = (Article) request.getAttribute("currentArticle");
    SimpleDateFormat formatter = new SimpleDateFormat("MMM dd yyyy - hh:mm a", Locale.ENGLISH);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/content.css">
    </head>
    <body>
        <h3><%=currentArticle.getTitle()%></h3>
        <img src="<%=currentArticle.getImage()%>" width="80%" alt="illustrate image">
        <p><%=currentArticle.getContent()%></p>
        <br>
        <hr>
        <p class="time-icon" style="text-align: right;">By <%=currentArticle.getAuthor()%> | <%=formatter.format(currentArticle.getDatetime())%></p>
    </body>
</html>
