<%-- 
    Document   : loginForm
    Created on : Aug 8, 2019, 4:10:25 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/loginForm.css">
    </head>
    <body>
        <h4>Login Form</h4>
        <form action="login" method="POST">
            <table>
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Sign in">&nbsp;<a href="register">Register</a></td>
                </tr>
                <% if (request.getAttribute("loginResult") != null && request.getAttribute("loginResult").equals("false")) {%>
                <tr>
                    <td></td>
                    <td><p style="color: red">* Tên tài khoản hoặc mật khẩu không chính xác</p></td>
                </tr>
                <%}%>
            </table>
        </form>
    </body>
</html>
