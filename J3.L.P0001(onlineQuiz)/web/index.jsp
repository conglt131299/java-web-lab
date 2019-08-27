<%-- 
    Document   : index
    Created on : Aug 8, 2019, 2:32:50 PM
    Author     : Cong Le
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String includePage = (String) request.getAttribute("page"); // Get include page from servlet.
    User user = (User) session.getAttribute("user"); // get user's session logged in.

    /*
        Determine title of page when user access.
     */
    String title = "";
    if (includePage.equals("loginForm.jsp")) {
        title = "Home";
    } else if (includePage.equals("registerForm.jsp")) {
        title = "Register";
    } else if (includePage.equals("takeQuiz/prepareQuiz.jsp")
            || includePage.equals("takeQuiz/quizPage.jsp")
            || includePage.equals("takeQuiz/quizResult.jsp")) {
        title = "Take Quiz";
    } else if (includePage.equals("manageQuiz.jsp")) {
        title = "Manage Quiz";
    } else if (includePage.equals("makeQuiz.jsp")) {
        title = "Make Quiz";
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Display title on user's browser-->
        <title><%=title%></title> 
        <link rel="stylesheet" href="resource/css/index.css">
    </head>
    <body>
        <div id="container">
            <div id="nav-bar">
                <ul>
                    <li><a href="login">Home</a></li>
                    <li><a href="take_quiz">Take Quiz</a></li>
                    <li><a href="make_quiz">Make Quiz</a></li>
                    <li><a href="manage_quiz">Manage Quiz</a></li>
                        <% if (user != null) {%>
                    <li><a href="logout">Logout</a></li>
                        <%}%>
                </ul>
            </div>
            <!--Display includePage required from servlet-->
            <div id="main-content">
                <jsp:include page="<%=includePage%>" />
            </div>
        </div>
    </body>
</html>
