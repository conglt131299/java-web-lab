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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Cong Le
 */
public class UserDAO extends DBContext {

    public User find(String email, String password) {
        ArrayList<User> users = new ArrayList<>();

        try {
            String sql = "select * from [User]";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setFname(rs.getString("fname"));
                u.setLname(rs.getString("lname"));
                u.setAddress(rs.getString("address"));
                u.setPhoneNumber(rs.getString("phonenumber"));
                u.setSex((rs.getBoolean("sex") == true) ? "Male" : "Female");
                u.setAge(rs.getInt("age"));
                u.setCardNumber(rs.getString("cardnumber"));

                users.add(u);
            }

            for (User user : users) {
                if (email.equals(user.getEmail()) && password.equals(user.getPassword())) {
                    return user;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void add(User u) {
        try {
            String sql = "INSERT INTO [User]"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareCall(sql);
            statement.setString(1, u.getEmail());
            statement.setString(2, u.getPassword());
            statement.setString(3, u.getFname());
            statement.setString(4, u.getLname());
            statement.setString(5, u.getAddress());
            statement.setString(6, u.getPhoneNumber());
            statement.setBoolean(7, ("male".equals(u.getSex()) ? true : false));
            statement.setInt(8, u.getAge());
            statement.setString(9, u.getCardNumber());

            statement.executeQuery();
        } catch (SQLException ex) {

        }
    }
}
