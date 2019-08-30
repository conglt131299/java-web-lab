<%-- 
    Document   : manageBooking
    Created on : Aug 28, 2019, 9:42:42 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/manageBooking.css">
    </head>
    <body>
        <h2>Search Bookings</h2>
        <form action="manage_booking" method="POST" id="manage-form">
            <table>
                <tr>
                    <td></td>
                    <td>
                        <input type="radio" name="option" value="reservation" checked>Reservation code&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="option" value="all">All bookings
                    </td>
                </tr>
                <tr>
                    <td>Enter reservation code</td>
                    <td><input type="text" name="reservationcode" size="30"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Search"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
