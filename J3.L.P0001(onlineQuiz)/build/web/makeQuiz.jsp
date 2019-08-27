<%-- 
    Document   : makeQuiz
    Created on : Aug 19, 2019, 5:32:44 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            table {
                margin-left: 30px;
                margin-top: 10px;
            }

            table td {
                vertical-align: top;
                text-align: left;
            }
        </style>
    </head>
    <body>
        <form action="make_quiz" method="POST">
            <table>
                <tr>
                    <td>Question:</td>
                    <td><textarea rows="7" cols="60" name="content" required></textarea></td>
                </tr>
                <tr>
                    <td>Option 1:</td>
                    <td><textarea rows="2" cols="60" name="opt1" required></textarea></td>
                </tr>
                <tr>
                    <td>Option 2:</td>
                    <td><textarea rows="2" cols="60" name="opt2" required></textarea></td>
                </tr>
                <tr>
                    <td>Option 3:</td>
                    <td><textarea rows="2" cols="60" name="opt3" required></textarea></td>
                </tr>
                <tr>
                    <td>Option 4:</td>
                    <td><textarea rows="2" cols="60" name="opt4" required></textarea></td>
                </tr>
                <tr>
                    <td>Answer(s):</td>
                    <td>
                        <input type="checkbox" name="answer" value="1">Option 1&nbsp;
                        <input type="checkbox" name="answer" value="2">Option 2&nbsp;
                        <input type="checkbox" name="answer" value="3">Option 3&nbsp;
                        <input type="checkbox" name="answer" value="4">Option 4&nbsp;
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
