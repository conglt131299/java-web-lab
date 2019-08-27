<%-- 
    Document   : registerForm
    Created on : Aug 19, 2019, 5:00:01 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            h4 {
                padding: 30px 20px;
                text-align: left;
            }

            table {
                padding-left: 20px;
            }

            table td {
                text-align: left;
            }
        </style>
    </head>
    <body>
        <h4>Registration Form</h4>
        <form action="register" method="POST">
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
                    <td>User Type:</td>
                    <td>
                        <select name="type">
                            <option value="1">Teacher</option>
                            <option value="0">Student</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Register"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
