/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import model.Flight;

/**
 *
 * @author Cong Le
 */
public class FlightDAO extends DBContext {

    public ArrayList<Flight> getAllFlights() {
        ArrayList<Flight> flights = new ArrayList<>();

        try {

            String sql = "SELECT * FROM Flight";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Flight f = new Flight();
                f.setId(rs.getInt("id"));
                f.setFrom(rs.getString("from"));
                f.setTo(rs.getString("to"));
                f.setDepartTime(rs.getTimestamp("departtime"));
                f.setReturnTime(rs.getTimestamp("returntime"));
                f.setTravelTime(rs.getTime("traveltime"));
                f.setPrice(rs.getFloat("price"));

                flights.add(f);
            }
        } catch (SQLException ex) {

        }

        return flights;
    }

    public ArrayList<Flight> findFlightByOneWay(String from, String to, String departTime) {
        ArrayList<Flight> flights = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Flight WHERE [from]=? and [to]=? and CAST(departtime AS DATE) = CAST(? AS DATE)";
            PreparedStatement statement = connection.prepareCall(sql);

            statement.setString(1, from);
            statement.setString(2, to);
            statement.setString(3, departTime);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Flight f = new Flight();
                f.setId(rs.getInt("id"));
                f.setFrom(rs.getString("from"));
                f.setTo(rs.getString("to"));
                f.setDepartTime(rs.getTimestamp("departtime"));
                f.setReturnTime(rs.getTimestamp("returntime"));
                f.setTravelTime(rs.getTime("traveltime"));
                f.setPrice(rs.getFloat("price"));

                flights.add(f);
            }

        } catch (SQLException ex) {

        }

        return flights;
    }

    public HashMap<String, ArrayList<Flight>> findFlightByRoundTrip(String from, String to, String departTime, String returnTime) {
        HashMap<String, ArrayList<Flight>> kindOfFlights = new HashMap<>();

        ArrayList<Flight> departingFlights = findFlightByOneWay(from, to, departTime);
        ArrayList<Flight> returningFlights = findFlightByOneWay(to, from, returnTime);

        kindOfFlights.put("departingFlights", departingFlights);
        kindOfFlights.put("returningFlights", returningFlights);

        return kindOfFlights;
    }

    public ArrayList<Flight> findFlightById(String[] flightId) {
        ArrayList<Flight> flights = new ArrayList<>();

        try {

            if (flightId.length <= 0) {
                return flights;
            } else {
                String sql = "SELECT * FROM Flight WHERE ";
                for (int i = 0; i < flightId.length; i++) {
                    if (i != (flightId.length - 1)) {
                        sql += "id=? or ";
                    } else {
                        sql += "id=?";
                    }
                }

                PreparedStatement statement = connection.prepareCall(sql);

                for (int i = 0; i < flightId.length; i++) {
                    statement.setInt(i + 1, Integer.parseInt(flightId[i]));
                }

                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    Flight f = new Flight();
                    f.setId(rs.getInt("id"));
                    f.setFrom(rs.getString("from"));
                    f.setTo(rs.getString("to"));
                    f.setDepartTime(rs.getTimestamp("departtime"));
                    f.setReturnTime(rs.getTimestamp("returntime"));
                    f.setTravelTime(rs.getTime("traveltime"));
                    f.setPrice(rs.getFloat("price"));

                    flights.add(f);
                }
            }
        } catch (SQLException ex) {

        }

        return flights;
    }
}
