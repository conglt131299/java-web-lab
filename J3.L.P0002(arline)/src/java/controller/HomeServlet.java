/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cong Le
 */
public class HomeServlet extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page", "home.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    

}