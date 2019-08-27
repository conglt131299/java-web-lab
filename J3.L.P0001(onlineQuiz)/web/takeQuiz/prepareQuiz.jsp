<%-- 
    Document   : takeQuiz
    Created on : Aug 19, 2019, 5:32:34 PM
    Author     : Cong Le
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    Integer size = (Integer)request.getAttribute("size");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            p {
                margin-top: 50px;
                margin-left: 10px;
                text-align: left;
            }
            
            table {
                margin-left: 10px;
            }
        </style>
    </head>
    <body>
        <p>Welcome <span style="color: blue;"><%=user.getUsername() %></span></p>
        <form action="take_quiz" method="POST">
            <input type="hidden" name="req" value="questionRequest">
            <table border="0" style="width: 100%;">
                <tr>
                    <td>Enter number of questions:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="number" name="numOfQuiz" min="1" max="<%=size%>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2"  style="text-align: center;"><input type="submit" value="Start"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
