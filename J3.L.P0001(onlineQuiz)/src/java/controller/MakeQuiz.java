/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.QuestionDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;

/**
 *
 * @author Cong Le
 */
public class MakeQuiz extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page", "makeQuiz.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get user's information filled out
        String content = request.getParameter("content");
        String opt1 = request.getParameter("opt1");
        String opt2 = request.getParameter("opt2");
        String opt3 = request.getParameter("opt3");
        String opt4 = request.getParameter("opt4");
        String answers = request.getParameter("answer");
        
        // Create question object with available information
        Question q = new Question();
        q.setContent(content);
        q.setOpt1(opt1);
        q.setOpt2(opt2);
        q.setOpt3(opt3);
        q.setOpt4(opt4);
        q.setAnswer(answers);
        
        // Add question to database
        QuestionDAO questionDAO = new QuestionDAO();
        questionDAO.add(q);
        
        request.setAttribute("message", "Question saved.");
        request.setAttribute("page", "message.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
