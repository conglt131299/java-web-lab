<%-- 
    Document   : header
    Created on : Aug 26, 2019, 6:55:42 PM
    Author     : Cong Le
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // get user object
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/header.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <header>
            <img src="resource/image/bg_top.jpg" alt="Header image" width="100%" height="250px" class="background-top-image">
            <img src="resource/image/logo.png" alt="Arline logo" class="logo-image">
            <table class="authentication-button">
                <% if (user != null) {%>
                <tr>
                    <td><i class="fa fa-folder fa-2x" style="color: grey;"></i></td>
                    <td><a href="logout"><img src="resource/image/quit_t.png" alt="logout image"></a></td>
                </tr>
                <tr>
                    <td style="color: white;"><%=user.getFname()%></td>
                    <td><a href="logout">Logout</a></td>
                </tr>
                <% } else { %>
                <tr>
                    <td><a href="login"><i class="fa fa-home fa-2x"></i></a></td>
                    <td><a href="register"><img src="resource/image/register_t.png" alt="Register image"></a></td>
                </tr>
                <tr>
                    <td><a href="login">Login</a></td>
                    <td><a href="register">Register</a></td>
                </tr>
                <% }%>

            </table>
            <h4>Fast, Frequent & Safe Flights</h4>
            <nav>
                <ul>
                    <li><a href="home" <%= (request.getAttribute("path").equals("/home")) ? "class='current'" : ""%>>Home</a></li>
                    <li><a href="book" <%= (request.getAttribute("path").equals("/book")) ? "class='current'" : ""%>>Book</a></li>
                    <li><a href="manage_booking" <%= (request.getAttribute("path").equals("/manage_booking")) ? "class='current'" : ""%>>Manage Booking</a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>
