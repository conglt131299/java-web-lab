<%-- 
    Document   : home
    Created on : Aug 26, 2019, 10:52:35 PM
    Author     : Cong Le
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Flight"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <form action="home" method="POST" class="search-form" accept-charset="UTF-8">
                <%request.setCharacterEncoding("UTF-8");%>
                <table class="flight-kind">
                    <tr>
                        <td><input type="radio" name="kindOfTicket" value="roundtrip" checked>Round trip</td>
                        <td><input type="radio" name="kindOfTicket" value="oneway">One way</td>
                    </tr>
                </table>
                <table class="flight-info">
                    <tr>
                        <td style="width: 40%;">From</td>
                        <td>
                            <select name="from">
                                <c:forEach items="${requestScope.from}" var="i" varStatus="loop">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>To</td>
                        <td>
                            <select name="to">
                                <c:forEach items="${requestScope.to}" var="i" varStatus="loop">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
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
