package dao;

import model.Page;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Riosanta69
 */
public class PageDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Page getPage(int id) {
        Page page = null;
        try {
            conn = new DBContext().getConnection();
            String query;
            query = "select * from Page where id = ?";

            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            page = new Page(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4));
        } catch (Exception e) {
        }
        return page;
    }
    
    public String getPageType(int id) {
        String page = null;
        try {
            conn = new DBContext().getConnection();
            String query;
            query = "select * from Page_Type where page_id = ?";

            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            page = rs.getString(2);
            System.out.println(page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return page;
    }

    public List<Page> getAllPages(String type) {
        try {
            List<Page> pageList = new ArrayList<>();
            conn = new DBContext().getConnection();
            String query;
            if (type.equals("ALL")) {
                query = "select * from Page";
                ps = conn.prepareStatement(query);
            } else {
                query = "select * from Page inner join Page_Type on Page.id = Page_Type.page_id"
                        + " where Page_Type.type = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, type);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                Page p = new Page(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
                pageList.add(p);
            }
            return pageList;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Page> getAllPages(int slideId, String type) {
        try {
            conn = new DBContext().getConnection();

            List<Page> pageList = new ArrayList<>();
            String query;
            if (type.equals("ALL")) {
                query = "select * from Page where id > 5 * (? - 1) and id <= 5 * ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, slideId);
                ps.setInt(2, slideId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Page p = new Page(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4));
                    pageList.add(p);
                }
            } else {
                query = "select * from Page inner join Page_Type on Page.id = Page_Type.page_id"
                        + " where Page_Type.type = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, type);
                rs = ps.executeQuery();
                int index = 1;
                while (rs.next()) {
                    Page p = new Page(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4));
                    if (index > 5 * (slideId - 1) && index <= 5 * slideId) {
                        pageList.add(p);
                    }
                    index++;
                }
            }
            return pageList;
        } catch (Exception e) {
        }
        return null;
    }

    public void deletePage(int Id) {
        try {
            conn = new DBContext().getConnection();
            String sql = "delete from Page where id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Id);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(PageDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addPage(String type, String heading, String summary, String content) {
        try {
            conn = new DBContext().getConnection();
            int newId;
            String sql = "select max(id) + 1 as id from Page";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            newId = rs.getInt(1);

            sql = "insert into Page(id, heading, summary, page_content) values(?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, newId);
            ps.setString(2, heading);
            ps.setString(3, summary);
            ps.setString(4, content);
            ps.executeUpdate();

            sql = "insert into Page_Type(page_id, type) values(?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, newId);
            ps.setString(2, type);
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(PageDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePage(int id, String type, String heading, String summary, String content) {
        try {
            conn = new DBContext().getConnection();
             
            String sql = "update Page set heading=?, summary=?, page_content=? where id=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, heading);
            ps.setString(2, summary);
            ps.setString(3, content);
            ps.setInt(4, id);
            ps.executeUpdate();

            sql = "update Page set type=? where page_id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(2, id);
            ps.setString(1, type);
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(PageDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
