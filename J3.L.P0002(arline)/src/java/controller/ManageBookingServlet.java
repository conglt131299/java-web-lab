/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookingHistoryDAO;
import dal.FlightDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BookingHistory;
import model.Flight;

/**
 *
 * @author Cong Le
 */
public class ManageBookingServlet extends BaseAuthenticationController {
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page", "manageBooking.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        // define flightDAO and bookingHistoryDAO 's instance
        FlightDAO flightDAO = new FlightDAO();
        BookingHistoryDAO bookingHistoryDAO = new BookingHistoryDAO();
        
        ArrayList<Flight> flights = flightDAO.getAllFlights();
        ArrayList<BookingHistory> bookingHistory = new ArrayList<>();
        
        String option = request.getParameter("option");
        
        if (option.equals("reservation")) {
            String reservationCode = request.getParameter("reservationcode");
            bookingHistory = bookingHistoryDAO.findFlightByReservationCode(reservationCode);
        } else if (option.equals("all")) {
            bookingHistory = bookingHistoryDAO.getAllBookings();
        }
        
        request.setAttribute("flights", flights);
        request.setAttribute("bookingHistory", bookingHistory);
        request.setAttribute("path", "manage_booking");
        request.setAttribute("page", "bookingHistory.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
}
