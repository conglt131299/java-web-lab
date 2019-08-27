<%-- 
    Document   : quizPage
    Created on : Aug 21, 2019, 2:54:24 PM
    Author     : Cong Le
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Question"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    
    // get random question from user's quality required
    ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("returnQuestion");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/quizPage.css">
        <script src="resource/js/quizPage.js"></script>
    </head>
    <body>
        <h4>Welcome <span><%=user.getUsername() %></span></h4>
        <p id="timeSpan">Time remaining <span id="timeDisplay">00:00</span></p>
        <p id="questionPos">Question: 0/0</p>
        <form id="quizForm" action="take_quiz" method="POST">
            <input type="hidden" name="req" value="questionResult">
            <%
                for (int i = 0; i < questions.size(); i++) {
                    Question q = questions.get(i);
            %>
            <div id="q<%=i%>" class="question-tag hidden">
                <input type="hidden" name="numOfQuiz" value="<%=questions.size() %>">
                <input type="hidden" name="q<%=i%>" value="<%=q.getId() %>">
                <p><%=q.getContent() %></p>
                <ul>
                    <li><input type="checkbox" name="ans<%=i%>-1"><%=q.getOpt1() %></li>
                    
                    <li><input type="checkbox" name="ans<%=i%>-2"><%=q.getOpt2() %></li>
                   
                    <li><input type="checkbox" name="ans<%=i%>-3"><%=q.getOpt3() %></li>
                    
                    <li><input type="checkbox" name="ans<%=i%>-4"><%=q.getOpt4() %></li>
                </ul>
            </div>
            <% } %>
            <input id="submit-button" type="submit" value="Finish">
            <button id="next" type="button" onclick="nextQuestion()">Next</button>
        </form>
        <script>
            setNumOfQuiz(<%=questions.size()%>);
            quizStart();
        </script>
    </body>
</html>
