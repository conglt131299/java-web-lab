<%-- 
    Document   : quizResult
    Created on : Aug 21, 2019, 11:32:27 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mark = (String) request.getAttribute("mark");
    String percent = (String) request.getAttribute("percent");
    String status = (String) request.getAttribute("status");
    mark = mark.replace(",", ".");
    percent = percent.replace(",", ".");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            table {
                margin-top: 30px;   
            }
            
            td {
                padding-top: 15px;
                padding-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <form action="take_quiz" method="POST">
            <input type="hidden" name="req" value="questionPrepare">
            <table>
                <tr>
                    <td colspan="2">Your score <span style="color: blue;"><%=mark%> (<%=percent%>%) - <%=status%></span></td>
                </tr>
                <tr>
                    <td>Take another test</td>
                    <td><input type="submit" value="Start"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
