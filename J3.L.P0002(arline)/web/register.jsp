<%-- 
    Document   : register
    Created on : Aug 27, 2019, 3:40:33 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/register.css">
    </head>
    <body>
        <h2>Register</h2>
        <form action="register" method="POST" class="register-form">
            <table>
                <tr>
                    <th>New Account</th>
                    <td></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <td>Verify Password:</td>
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <th>Contact Information</th>
                    <td></td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="fname" required></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="lname" required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" required></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="tel" name="phonenum" required></td>
                </tr>
                <tr>
                    <td>Sex:</td>
                    <td>
                        <select name="sex">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td><input type="number" name="age" required></td>
                </tr>
                <tr>
                    <td>Card Number:</td>
                    <td><input type="number" name="cardnum" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Register"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
