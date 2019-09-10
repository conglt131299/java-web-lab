/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ArticleDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;

/**
 *
 * @author Cong Le
 */
public class SideBar extends HttpServlet {

    protected void refreshPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ArticleDAO articleDAO = new ArticleDAO();

            Article mostRecentArticle = articleDAO.getRecentArticle(1).get(0);
            ArrayList<Article> fiveRecentArticle = articleDAO.getRecentArticle(5);

            req.setAttribute("mostRecentArticle", mostRecentArticle);
            req.setAttribute("fiveRecentArticle", fiveRecentArticle);
        } catch (Exception ex) {
            Logger.getLogger(SideBar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
