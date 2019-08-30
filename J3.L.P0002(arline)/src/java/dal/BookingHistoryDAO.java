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
import model.BookingHistory;

/**
 *
 * @author Cong Le
 */
public class BookingHistoryDAO extends DBContext {

    public void add(int userID, int flightID, String reservationCode) {
        try {
            String sql = "INSERT INTO BookingHistory"
                    + " VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            statement.setInt(2, flightID);
            statement.setString(3, reservationCode);

            statement.executeQuery();
        } catch (SQLException ex) {

        }
    }

    public ArrayList<BookingHistory> findFlightByReservationCode(String reservationCode) {
        ArrayList<BookingHistory> bookingHistory = new ArrayList<>();
        try {
            String sql = "SELECT * FROM BookingHistory WHERE reservation_code=?";
            PreparedStatement statement = connection.prepareCall(sql);

            statement.setString(1, reservationCode);

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                BookingHistory b = new BookingHistory();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("userid"));
                b.setFlightId(rs.getInt("flightid"));
                b.setReservationCode(rs.getString("reservation_code"));

                bookingHistory.add(b);
            }

        } catch (SQLException ex) {

        }

        return bookingHistory;
    }

    public ArrayList<BookingHistory> getAllBookings() {
        ArrayList<BookingHistory> allBookings = new ArrayList<>();

        try {

            String sql = "SELECT * FROM BookingHistory";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                BookingHistory b = new BookingHistory();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("userid"));
                b.setFlightId(rs.getInt("flightid"));
                b.setReservationCode(rs.getString("reservation_code"));

                allBookings.add(b);
            }
        } catch (SQLException ex) {

        }

        return allBookings;
    }
}
