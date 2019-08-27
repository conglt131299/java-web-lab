/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.QuizHistory;

/**
 *
 * @author Cong Le
 */
public class QuizHistoryDAO extends DBContext {
    
    public void addEntry(QuizHistory qh) {
        try {
            String sql = "INSERT INTO QuizHistory"
                    + " VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareCall(sql);
            
            statement.setInt(1, qh.getStudentId());
            statement.setInt(2, qh.getNumOfQuiz());
            statement.setFloat(3, (float) qh.getMark());
            statement.executeQuery();
        } catch (SQLException ex) {
            
        }
    }
}
