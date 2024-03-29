/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Cong Le
 */
public abstract class BaseAuthenticationController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param req
     * @param resp
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Get user'session logged in
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        
        String path = req.getServletPath(); // Get path of servlet user access

        if (user != null) {
            if (user.getType() == 1) {
                processGet(req, resp);
            } else {
                if (path.equals("/manage_quiz") || path.equals("/make_quiz")) {
                    req.setAttribute("message", "You don't have permission to access this function.");
                    req.setAttribute("page", "message.jsp");
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                } else {
                    processGet(req, resp);
                }
            }
        } else {
            req.setAttribute("message", "You have to login to use this function.");
            req.setAttribute("page", "message.jsp");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processPost(req, resp);
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
