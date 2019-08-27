<%-- 
    Document   : home
    Created on : Aug 26, 2019, 10:52:35 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/home.css">
    </head>
    <body>
        <div class="background-image">
            <img src="resource/image/bg_top_img.jpg" alt="Airline background" width="100%">
        </div>
        <main class="main-container">
            <div class="title">Flight</div>
            <form action="flight_search" method="POST" class="search-form">
                <table class="flight-kind">
                    <tr>
                        <td><input type="radio" name="kindOfTicket" value="roundtrip">Round trip</td>
                        <td><input type="radio" name="kindOfTicket" value="oneway">One way</td>
                    </tr>
                </table>
                <table class="flight-info">
                    <tr>
                        <td style="width: 40%;">From</td>
                        <td>
                            <select name="from">
                                <option value="HN">Hà Nội</option>
                                 <option value="HCM">Hồ Chí Minh</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>To</td>
                        <td>
                            <select name="to">
                                <option value="HN">Hà Nội</option>
                                <option value="HCM" selected>Hồ Chí Minh</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Departure</td>
                        <td>
                            <input type="date" name="departure">
                        </td>
                    </tr>
                    <tr>
                        <td>Return</td>
                        <td>
                            <input type="date" name="return">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right; padding-top: 50px;"><input type="submit" value="Search"></td>
                </table>
            </form>
        </main>
    </body>
</html>
