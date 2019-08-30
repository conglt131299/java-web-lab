<%-- 
    Document   : book
    Created on : Aug 28, 2019, 9:42:34 PM
    Author     : Cong Le
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Flight"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // get bookedFlight after book in homepage
    ArrayList<Flight> bookedFlights = (ArrayList<Flight>) session.getAttribute("bookedFlights");
    
    // formate date by custom string
    SimpleDateFormat simpleDateFormat1
            = new SimpleDateFormat("dd/MM/YYYY", new Locale("vi", "VN"));
    SimpleDateFormat simpleDateFormat2
            = new SimpleDateFormat("hh:mm a", new Locale("vi", "VN"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/book.css">
        <style>
            h1 {
                margin-top: 30px;
                margin-left: 60px;
            }

            .flight-info {
                width: 60%;
                margin-left: 85px;
                margin-top: 10px;
            }

            .save-button {
                margin-top: 50px;
                margin-left: 61%;
                background-color: #1d86ef;
                color: #FFFFFF;
                border: 1px solid grey;
                border-radius: 0.25em;
                padding: 5px 15px;
            }
        </style>
    </head>
    <body>
        <% if (bookedFlights == null || bookedFlights.size() == 0) {%>
        <h1> No flight found. Please choose flight in home page before booking.</h1>
        <% } else if (bookedFlights.size() == 1) {%>
        <div style="margin-left: 70%; margin-top: 50px;"><span style="font-weight: bold;">Departure:</span><%=bookedFlights.get(0).getFrom()%> &nbsp;&nbsp; <span style="font-weight: bold;">Return:</span> <%=bookedFlights.get(0).getTo()%></div>
        <h1>1. Select Departing Flight</h1>
        <div style="margin-left: 85px;"><span style="font-weight: bold; font-size: 18px;"><%=bookedFlights.get(0).getFrom()%></span> to <span style="font-weight: bold; font-size: 18px;"><%=bookedFlights.get(0).getTo()%></span></div>
        <div style="margin-top: 5px; margin-left: 85px; color: red;"><%=simpleDateFormat1.format(bookedFlights.get(0).getDepartTime())%></div>
        <table class="flight-info">
            <tr>
                <td>Departs</td>
                <td>Arrives</td>
                <td>Flight Detail</td>
                <td></td>
            </tr>
            <tr>
                <td><%=simpleDateFormat2.format(bookedFlights.get(0).getDepartTime())%></td>
                <td><%=simpleDateFormat2.format(bookedFlights.get(0).getReturnTime())%></td>
                <td><%=bookedFlights.get(0).getTravelTime()%></td>
                <td style="background-color: black; color: red;">$<%=bookedFlights.get(0).getPrice()%></td>
            </tr>
        </table>
        <form action="book" method="POST">
            <input type="hidden" name="flightID" value="<%=bookedFlights.get(0).getId()%>">
            <input type="submit" value="Save" class="save-button">
        </form>
        <% } else {%>
        <h1>1. Select Departing Flight</h1>
        <div style="margin-left: 85px;"><span style="font-weight: bold; font-size: 18px;"><%=bookedFlights.get(0).getFrom()%></span> to <span style="font-weight: bold; font-size: 18px;"><%=bookedFlights.get(0).getTo()%></span></div>
        <div style="margin-top: 5px; margin-left: 85px; color: red;"><%=simpleDateFormat1.format(bookedFlights.get(0).getDepartTime())%></div>
        <table class="flight-info">
            <tr>
                <td>Departs</td>
                <td>Arrives</td>
                <td>Flight Detail</td>
                <td></td>
            </tr>
            <tr>
                <td><%=simpleDateFormat2.format(bookedFlights.get(0).getDepartTime())%></td>
                <td><%=simpleDateFormat2.format(bookedFlights.get(0).getReturnTime())%></td>
                <td><%=bookedFlights.get(0).getTravelTime()%></td>
                <td style="background-color: black; color: red;">$<%=bookedFlights.get(0).getPrice()%></td>
            </tr>
        </table>

        <h1>2. Select Returning Flight</h1>
        <div style="margin-left: 85px;"><span style="font-weight: bold; font-size: 18px;"><%=bookedFlights.get(1).getFrom()%></span> to <span style="font-weight: bold; font-size: 18px;"><%=bookedFlights.get(1).getTo()%></span></div>
        <div style="margin-top: 5px; margin-left: 85px; color: red;"><%=simpleDateFormat1.format(bookedFlights.get(1).getDepartTime())%></div>
        <table class="flight-info">
            <tr>
                <td>Departs</td>
                <td>Arrives</td>
                <td>Flight Detail</td>
                <td></td>
            </tr>
            <tr>
                <td><%=simpleDateFormat2.format(bookedFlights.get(1).getDepartTime())%></td>
                <td><%=simpleDateFormat2.format(bookedFlights.get(1).getReturnTime())%></td>
                <td><%=bookedFlights.get(1).getTravelTime()%></td>
                <td style="background-color: black; color: red;">$<%=bookedFlights.get(1).getPrice()%></td>
            </tr>
        </table>
        <form action="book" method="POST">
            <input type="hidden" name="flightID1" value="<%=bookedFlights.get(0).getId()%>">
            <input type="hidden" name="flightID2" value="<%=bookedFlights.get(1).getId()%>">
            <input type="submit" value="Save" class="save-button">
        </form>
        <% }%>

    </body>
</html>
