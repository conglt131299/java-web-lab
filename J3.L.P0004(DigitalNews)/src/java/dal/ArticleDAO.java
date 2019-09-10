package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Article;

/**
 *
 * @author Cong Le
 */
public class ArticleDAO {

    public ArrayList<Article> getRecentArticle(int numberArticle) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT TOP (?) * "
                + "FROM Article \n"
                + "ORDER BY Date DESC";

        ArrayList<Article> listArticle = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, numberArticle);
            rs = ps.executeQuery();

            while (rs.next()) {

                Article article = new Article();
                article.setId(rs.getInt("id"));
                article.setTitle(rs.getString("title"));
                article.setImage(db.getResource() + rs.getString("image"));
                article.setContent(rs.getString("content"));
                article.setDatetime(rs.getTimestamp("date"));
                article.setAuthor(rs.getString("author"));
                article.setDescription(article.getContent());

                listArticle.add(article);
            }
            return listArticle;

        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    public Article getArticleById(int id) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT title, image, content, date, author FROM Article WHERE id = ?";

        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Article article = new Article();
                article.setTitle(rs.getString("title"));
                article.setImage(db.getResource() + rs.getString("image"));
                article.setContent(rs.getString("content"));
                article.setDatetime(rs.getTimestamp("date"));
                article.setAuthor(rs.getString("author"));
                article.setDescription(article.getContent());

                return article;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    public ArrayList<Article> getListAticleSearch(int numberArticleInPage, int pageCurrent, String keyword) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Article> listArticle = new ArrayList<>();

        String sql = "SELECT * FROM (\n"
                + "SELECT ROW_NUMBER()\n"
                + "OVER(ORDER BY id) as Number,\n"
                + "* FROM Article \n"
                + "WHERE content LIKE ? OR title LIKE ? \n"
                + ") as DataSearch where Number >= ? and Number <= ?";
        try {
            db = new DBContext();

            int articleFrom = (pageCurrent - 1) * numberArticleInPage + 1;
            int articleTo = pageCurrent * numberArticleInPage;

            con = db.getConnection();
            ps = con.prepareStatement(sql);
            keyword = "%" + keyword + "%";
            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ps.setInt(3, articleFrom);
            ps.setInt(4, articleTo);
            rs = ps.executeQuery();

            while (rs.next()) {

                Article article = new Article();
                article.setId(rs.getInt("id"));
                article.setTitle(rs.getString("title"));
                article.setImage(db.getResource() + rs.getString("image"));
                article.setContent(rs.getString("content"));
                article.setDatetime(rs.getTimestamp("date"));
                article.setAuthor(rs.getString("author"));
                article.setDescription(article.getContent());

                listArticle.add(article);
            }
            
            return listArticle;
        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    public int getNumberPage(int numberArticleInPage, String keyword) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(id) FROM Article \n"
                + "WHERE content\n"
                + "LIKE ? OR title LIKE ?";
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            keyword = "%" + keyword + "%";
            ps.setString(1, keyword);
            ps.setString(2, keyword);
            rs = ps.executeQuery();

            while (rs.next()) {
                int numberArticle = rs.getInt(1);
                return (numberArticle + numberArticleInPage - 1) / numberArticleInPage;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return -1;
    }
}
