/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.FlightDAO;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        request.setCharacterEncoding("utf-8");
        String kindOfTicket = request.getParameter("kindOfTicket");
        
        if (kindOfTicket.equals("roundtrip")) {
            processRoundTrip(request, response);
        } else {
            processOneWay(request, response);
        }
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    private void processRoundTrip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
    
    private void processOneWay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departTime = request.getParameter("departure");
        
        FlightDAO flightDAO = new FlightDAO();
        ArrayList<Flight> flights = flightDAO.findFlightByUser(from, to, departTime);
        
        request.setAttribute("path", "/home");
        request.setAttribute("onewayflight", flights);
        request.setAttribute("page", "oneWayFlight.jsp");
    }
    
    

    

}
