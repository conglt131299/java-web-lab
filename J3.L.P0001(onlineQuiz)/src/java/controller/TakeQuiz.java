/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.QuestionDAO;
import dal.QuizHistoryDAO;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import model.QuizHistory;
import model.User;

/**
 *
 * @author Cong Le
 */
public class TakeQuiz extends BaseAuthenticationController {
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionDAO questionDAO = new QuestionDAO();
        int size = questionDAO.size();
        request.setAttribute("size", size);
        request.setAttribute("page", "takeQuiz/prepareQuiz.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String req = request.getParameter("req");
        
        // Do method base on input with name 'req'
        if (req.equals("questionRequest")) {
            questionRequest(request, response);
        } else if (req.equals("questionResult")) {
            questionResult(request, response);
        } else if (req.equals("questionPrepare")) {
            processGet(request, response);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    protected void questionRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int numberOfQuiz = Integer.parseInt(request.getParameter("numOfQuiz"));
        List<Integer> questionIndexs = new ArrayList<>();
        for (int i = 0; i < new QuestionDAO().size(); i++) {
            questionIndexs.add(i);
        }
        Collections.shuffle(questionIndexs);
        
        List<Question> returnQuestion = new ArrayList<>();
        for (int i = 0; i < numberOfQuiz; i++) {
            returnQuestion.add(new QuestionDAO().getQuestion().get(questionIndexs.get(i)));
        }
        
        request.setAttribute("returnQuestion", returnQuestion);
        request.setAttribute("page", "takeQuiz/quizPage.jsp");
    }
    
    protected void questionResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        QuestionDAO questionDAO = new QuestionDAO();
        int numOfQuiz = Integer.parseInt(request.getParameter("numOfQuiz"));
        int correctAnswer = 0;
        double mark = 0;
        
        for (int i = 0; i < numOfQuiz; i++) {
            int id = Integer.parseInt(request.getParameter("q" + String.valueOf(i)));
            Question question = questionDAO.findQuestionById(id);
            
            String answer = "";
            for (int j = 0; j < 4; j++) {
                String answerId = "ans" + String.valueOf(i) + "-" + String.valueOf(j + 1);
                if (request.getParameter(answerId) != null) {
                    answer += String.valueOf(j + 1);
                }
            }
            
            if (question.getAnswer().equals(answer)) {
                correctAnswer++;
            }
        }
        
        QuizHistoryDAO qhd = new QuizHistoryDAO();
        User user = (User) request.getSession().getAttribute("user");
        int userID = user.getId();
        
        QuizHistory qh = new QuizHistory();
        qh.setStudentId(userID);
        qh.setNumOfQuiz(numOfQuiz);
        qh.setMark(mark);
        qhd.addEntry(qh);
        
        NumberFormat formatter = new DecimalFormat("#0.00");
        mark = (correctAnswer / (double) numOfQuiz) * 10;
        double percent = mark * 10;
        String status = (mark > 4) ? "Passed" : "Failed";
        
        request.setAttribute("mark", formatter.format(mark));
        request.setAttribute("percent", formatter.format(percent));
        request.setAttribute("status", status);
        request.setAttribute("page", "takeQuiz/quizResult.jsp");
    }
    
}
