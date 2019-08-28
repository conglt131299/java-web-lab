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
    
    public ArrayList<Flight> findFlightByUser(String from, String to, String departTime) {
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
}
