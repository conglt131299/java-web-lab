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
import model.Question;

/**
 *
 * @author Cong Le
 */
public class QuestionDAO extends DBContext {

    public void add(Question q) {

        try {
            String sql = "INSERT INTO Question"
                    + " VALUES (?, ?, ?, ?, ?, ?, GETDATE())";
            PreparedStatement statement = connection.prepareCall(sql);

            statement.setString(1, q.getContent());
            statement.setString(2, q.getOpt1());
            statement.setString(3, q.getOpt2());
            statement.setString(4, q.getOpt3());
            statement.setString(5, q.getOpt4());
            statement.setString(6, q.getAnswer());

            statement.executeQuery();
        } catch (SQLException ex) {

        }
    }

    public ArrayList<Question> getQuestion() {
        ArrayList<Question> questions = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Question";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setContent(rs.getString("content"));
                q.setOpt1(rs.getString("opt1"));
                q.setOpt2(rs.getString("opt2"));
                q.setOpt3(rs.getString("opt3"));
                q.setOpt4(rs.getString("opt4"));
                q.setAnswer(rs.getString("answer"));
                q.setDateCreated(rs.getDate("created"));

                questions.add(q);
            }
        } catch (SQLException ex) {

        }

        return questions;
    }

    public int size() {

        try {
            String sql = "SELECT COUNT(*) AS TotalQuestion FROM Question";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalQuestion");
            }
        } catch (SQLException ex) {

        }

        return 0;
    }

    public Question findQuestionById(int id) {
        
        Question q = new Question();

        try {
            String sql = "SELECT * FROM Question WHERE id=?";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                q.setAnswer(rs.getString("answer"));
            }
        } catch (SQLException ex) {

        }
        
        return q;
    }
}
