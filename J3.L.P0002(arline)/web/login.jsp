<%-- 
    Document   : login
    Created on : Aug 27, 2019, 12:52:03 AM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/login.css">
    </head>
    <body>
        <h2>Login</h2>
        <form action="login" method="POST" class="login-form">
            <table>
                <tr>
                    <td style="width: 30%;">Email:</td>
                    <td><input type="email" name="email" required size="30"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="pass" required size="30"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Login">&nbsp;
                        <button type="button"><a href="register" style="text-decoration: none; color: #FFFFFF;">Register</a></button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
