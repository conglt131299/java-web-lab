<%-- 
    Document   : roundTripFlight
    Created on : Aug 29, 2019, 2:31:55 PM
    Author     : Cong Le
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Flight"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HashMap<String, ArrayList<Flight>> kindOfFlights = (HashMap<String, ArrayList<Flight>>)request.getAttribute("roundtripflight");
    SimpleDateFormat simpleDateFormat =
        new SimpleDateFormat("dd MMM HH:mm", new Locale("en", "US"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/roundTripFlight.css">
    </head>
    <body>
        <div class="title">Departing Flight</div>
        <form action="home" method="POST" class="round-trip-form"> 
        <table id="one-way-flight">
            <tr>
                <th>TIME</th>
                <th>DURATION</th>
                <th>PRICE</th>
                <th>BOOK</th>
            </tr>
            <%for (Map.Entry<String, ArrayList<Flight>> kindOfFlight : kindOfFlights.entrySet()) {
                    String kind = kindOfFlight.getKey();
                    ArrayList<Flight> flights = kindOfFlight.getValue();
            %>
            <% if (kind.equals("departingFlights")) {%>
            <% for (Flight f : flights) {
            %>
                <tr>
                    <td style="width: 30%;">
                        <%=simpleDateFormat.format(f.getDepartTime()) %> <i class="fa fa-plane"></i> <%=simpleDateFormat.format(f.getReturnTime()) %><br>
                        <%=f.getFrom() %> <i class="fa fa-plane"></i> <%=f.getTo() %><br>
                        VNAirline . AirBus A380
                    </td>
                    <td><%=f.getTravelTime() %></td>
                    <td>$<%=f.getPrice() %></td>
                    <td><input type="checkbox" name="book" value="<%=f.getId() %>"></td>
                </tr>
            <% } %>
            <% } %>
            <% } %>
            
        </table>
            <div class="title">Returning Flight</div>
        <table id="round-trip-flight">
            <tr>
                <th>TIME</th>
                <th>DURATION</th>
                <th>PRICE</th>
                <th>BOOK</th>
            </tr>
            <%for (Map.Entry<String, ArrayList<Flight>> kindOfFlight : kindOfFlights.entrySet()) {
                    String kind = kindOfFlight.getKey();
                    ArrayList<Flight> flights = kindOfFlight.getValue();
            %>
            <% if (kind.equals("returningFlights")) {%>
            <% for (Flight f : flights) {
            %>
                <tr>
                    <td style="width: 30%;">
                        <%=simpleDateFormat.format(f.getDepartTime()) %> <i class="fa fa-plane"></i> <%=simpleDateFormat.format(f.getReturnTime()) %><br>
                        <%=f.getFrom() %> <i class="fa fa-plane"></i> <%=f.getTo() %><br>
                        VNAirline . AirBus A380
                    </td>
                    <td><%=f.getTravelTime() %></td>
                    <td>$<%=f.getPrice() %></td>
                    <td><input type="checkbox" name="book" value="<%=f.getId() %>"></td>
                </tr>
            <% } %>
            <% } %>
            <% } %>
        </table>
            <input type="submit" value="BOOK">
    </body>
</html>
