/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookingHistoryDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Flight;
import model.User;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author Cong Le
 */
public class BookServlet extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("path", "/book");
        request.setAttribute("page", "book.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override

    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // get user'id
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = user.getId();
        
        BookingHistoryDAO bookingHistoryDAO = new BookingHistoryDAO();
        
        try {
            
            // add booked flight to database with reservation code
            int flightID = Integer.parseInt(request.getParameter("flightID"));
            String reservationCode = RandomStringUtils.randomAlphanumeric(5);
            bookingHistoryDAO.add(userID, flightID, reservationCode.toUpperCase());
            
        } catch (NullPointerException | NumberFormatException ex) {
            
            // add 2 booked flight to database with reservation code
            int flightID1 = Integer.parseInt(request.getParameter("flightID1"));
            int flightID2 = Integer.parseInt(request.getParameter("flightID2"));

            String reservationCode1 = RandomStringUtils.randomAlphanumeric(5);
            bookingHistoryDAO.add(userID, flightID1, reservationCode1.toUpperCase());

            String reservationCode2 = RandomStringUtils.randomAlphanumeric(5);
            bookingHistoryDAO.add(userID, flightID2, reservationCode2.toUpperCase());
        }
        
        // Delete bookedFlight list after book successfully.
        ArrayList<Flight> bookedFlights = new ArrayList<>();
        session.setAttribute("bookedFlights", bookedFlights);

        request.setAttribute("path", "/book");
        request.setAttribute("content", "You booked flight successfully.");
        request.setAttribute("page", "message.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
