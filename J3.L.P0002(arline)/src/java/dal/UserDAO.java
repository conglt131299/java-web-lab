/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author Cong Le
 */
public class UserDAO extends DBContext {

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
