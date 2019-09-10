<%-- 
    Document   : search
    Created on : Sep 10, 2019, 2:11:11 PM
    Author     : Cong Le
--%>

<%@page import="util.HtmlHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Article> articles = (ArrayList<Article>) request.getAttribute("articles");
    
    Integer pageIndex = (Integer) request.getAttribute("pageindex");
    Integer totalPage = (Integer) request.getAttribute("totalpage");
    String keyword = (String) request.getAttribute("keyword");
    
    SimpleDateFormat formatter = new SimpleDateFormat("MMM dd yyyy - hh:mm a", Locale.ENGLISH);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/search.css">
    </head>
    <body>
        <% for (Article a : articles) {
        %>
        <h2><a href="article?id=<%=a.getId()%>"><%=a.getTitle()%></a></h2>
        <img src="<%=a.getImage()%>" width="80%" alt="illustrating image">
        <p><%=a.getDescription()%></p>
        <p class="time-icon" style="text-align: right;">By <%=a.getAuthor()%> | <%=formatter.format(a.getDatetime())%></p>
        <% }%>
        <%=HtmlHelper.pager(keyword, pageIndex, 2, totalPage)%>
    </body>
</html>
