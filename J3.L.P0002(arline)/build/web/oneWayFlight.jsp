<%-- 
    Document   : oneWayFlight
    Created on : Aug 29, 2019, 12:48:40 AM
    Author     : Cong Le
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Flight"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Flight> flights = (ArrayList<Flight>) request.getAttribute("onewayflight");
    SimpleDateFormat simpleDateFormat =
        new SimpleDateFormat("dd MMM HH:mm", new Locale("en", "US"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/oneWayFlight.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <h1>Departing Flight</h1>
        <table border="1" id="one-way-flight">
            <tr>
                <th>TIME</th>
                <th>DURATION</th>
                <th>PRICE</th>
                <th>LINK</th>
            </tr>
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
                    <td><a href="#">Book</a></td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
