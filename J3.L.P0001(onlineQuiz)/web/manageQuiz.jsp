<%-- 
    Document   : manageQuiz
    Created on : Aug 19, 2019, 5:32:53 PM
    Author     : Cong Le
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("questions");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/manageQuiz.css">
    </head>
    <body>
        <p>Number of questions: <span><%=questions.size()%></span></p>
        <table>
            <tr>
                <th>Question</th>
                <th>DateCreated</th>
            </tr>
            <%
                for (Question q : questions) {
                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy", Locale.ENGLISH);
            %>
            <tr>
                <td><%=q.getContent()%></td>
                <td style="width: 20%;"><%=formatter.format(q.getDateCreated())%></td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
