<%-- 
    Document   : sidebar
    Created on : Sep 8, 2019, 10:24:16 PM
    Author     : Cong Le
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Article mostRecentArticle = (Article) request.getAttribute("mostRecentArticle");
    ArrayList<Article> fiveRecentArticle = (ArrayList<Article>) request.getAttribute("fiveRecentArticle");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/side-bar.css">
    </head>
    <body>
        <h3>Digital News</h3>
        <p><%=mostRecentArticle.getDescription()%></p>
        <h3>Search</h3>
        <form action="search" method="get">
            <input type="search" name="keyword" required size="15">
            <input type="submit" value="Go">
        </form>
        <h3>Last Articles</h3>
        <ul>
            <% for (Article a : fiveRecentArticle) {
            %>
            <li><a href="article?id=<%=a.getId()%>"><%=a.getTitle()%></a></li>
                <% }%>
        </ul>
    </body>
</html>
