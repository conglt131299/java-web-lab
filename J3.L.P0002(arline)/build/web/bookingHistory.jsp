<%-- 
    Document   : bookingHistory
    Created on : Aug 30, 2019, 4:52:05 PM
    Author     : Cong Le
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.User"%>
<%@page import="model.Flight"%>
<%@page import="model.BookingHistory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // get user object
    User user = (User) session.getAttribute("user");
    
    // get bookingHistory and flights to compare flight's id
    ArrayList<BookingHistory> bookingHistory = (ArrayList<BookingHistory>) request.getAttribute("bookingHistory");
    ArrayList<Flight> flights = (ArrayList<Flight>) request.getAttribute("flights");
    
    // format date by custom string
    SimpleDateFormat simpleDateFormat1
            = new SimpleDateFormat("dd/MM/YYYY hh:mm:ss", new Locale("vi", "VN"));
    SimpleDateFormat simpleDateFormat2
            = new SimpleDateFormat("hh:mm a", new Locale("vi", "VN"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/bookingHistory.css">
    </head>
    <body>
        <% for (int i = 0; i < bookingHistory.size(); i++) {
        %>
        <% for (Flight f : flights) {
        %>
        <% if (bookingHistory.get(i).getFlightId() == f.getId()) {%>
        <div class="booking-info">
            <h2><%=(i + 1)%>. eTicket Receipt</h2>
            <hr>
            <p>Prepared for</p>
            <p style="font-weight: bold;"><%=user.getFname()%> <%=user.getLname()%></p>
            <p>RESERVATION CODE: <span style="font-weight: bold;"><%=bookingHistory.get(i).getReservationCode()%></span></p>
            <h2>Itinerary Details</h2>
            <hr>
            <table>
                <tr>
                    <td>TRAVEL DATE</td>
                    <td>DEPARTURE</td>
                    <td>ARRIVAL</td>
                </tr>
                <tr>
                    <td><%=simpleDateFormat1.format(f.getDepartTime())%></td>
                    <td>
                        <%=f.getFrom()%><br>
                        Time: <%=simpleDateFormat2.format(f.getDepartTime())%>
                    </td>
                    <td>
                        <%=f.getTo()%><br>
                        Time: <%=simpleDateFormat2.format(f.getReturnTime())%>
                    </td>
                </tr>
            </table>
        </div>
        <% } %>
        <% } %>
        <% }%>
    </body>
</html>
