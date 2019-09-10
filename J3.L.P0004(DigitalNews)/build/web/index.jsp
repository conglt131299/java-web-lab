<%-- 
    Document   : index
    Created on : Sep 8, 2019, 8:27:37 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String includePage = (String) request.getAttribute("includepage");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Digital News</title>
        <link rel="stylesheet" type="text/css" href="resource/css/index.css">
    </head>
    <body>
        <div id="container">

            <header>
                <div id="pre-header">
                    <img src="resource/image/preheader.jpg">
                </div>
                <div id="custom-header">
                    <h3>My Digital News</h3>
                </div>
                <nav>
                    <a href="home">News</a>
                </nav>
            </header>

            <div id="wrapper">

                <div id="main-container">
                    <jsp:include page="<%=includePage%>" />
                </div>

                <aside>
                    <jsp:include page="sidebar.jsp" />
                </aside>

            </div>

            <footer>

            </footer>
        </div>
    </body>
</html>
