/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.FlightDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Flight;

/**
 *
 * @author Cong Le
 */
public class HomeServlet extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        FlightDAO flightDAO = new FlightDAO();
        ArrayList<Flight> flights = flightDAO.getAllFlights();

        ArrayList<String> from = new ArrayList<>();
        ArrayList<String> to = new ArrayList<>();

        /* get all flight and separate departing flight and returning flight only appear once */
        
        for (Flight f : flights) {
            if (!from.contains(f.getFrom())) {
                from.add(f.getFrom());
            }
        }

        for (Flight f : flights) {
            if (!to.contains(f.getTo())) {
                to.add(f.getTo());
            }
        }

        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("page", "home.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override

    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // set request's encoding to utf-8 to avoid encoding error when get data from form.
        request.setCharacterEncoding("utf-8");
        
        try {
            
            // handle kind of ticket
            String kindOfTicket = request.getParameter("kindOfTicket");
            if (kindOfTicket.equals("roundtrip")) {
                processRoundTrip(request, response);
            } else if (kindOfTicket.equals("oneway")) {
                processOneWay(request, response);
            } else if (kindOfTicket.equals("none")) {
                processBook(request, response);
                return;
            }

        } catch (NullPointerException ex) {

        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void processRoundTrip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departTime = request.getParameter("departure");
        String returnTime = request.getParameter("return");

        FlightDAO flightDAO = new FlightDAO();
        HashMap<String, ArrayList<Flight>> kindOfFlights = flightDAO.findFlightByRoundTrip(from, to, departTime, returnTime);

        request.setAttribute("path", "/home");
        request.setAttribute("roundtripflight", kindOfFlights);
        request.setAttribute("page", "roundTripFlight.jsp");
    }

    private void processOneWay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departTime = request.getParameter("departure");

        FlightDAO flightDAO = new FlightDAO();
        ArrayList<Flight> flights = flightDAO.findFlightByOneWay(from, to, departTime);

        request.setAttribute("path", "/home");
        request.setAttribute("onewayflight", flights);
        request.setAttribute("page", "oneWayFlight.jsp");
    }

    private void processBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String[] flightId = request.getParameterValues("book");

        // if no flight booked then prompt message to user.
        // if flight booked then redirect user to book page.
        if (flightId == null) {
            request.setAttribute("path", "/home");
            request.setAttribute("content", "Please choose at least one flight to book.");
            request.setAttribute("page", "message.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            FlightDAO flightDAO = new FlightDAO();
            ArrayList<Flight> bookedFlights = flightDAO.findFlightById(flightId);

            HttpSession session = request.getSession();
            session.setAttribute("bookedFlights", bookedFlights);

            response.sendRedirect("book");
        }

    }

}
