/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.PageBean;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Riosanta69
 */
public class PageDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<PageBean> getAllPages() {
        try {
            List<PageBean> pageList = new ArrayList<>();
            String query = "select * from Page";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                PageBean p = new PageBean(rs.getInt(1),
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

    public List<PageBean> getAllPages(int slideId) {
        try {
            List<PageBean> pageList = new ArrayList<>();
            String query = "select * from Page where id > 5 * (? - 1) and id <= 5 * ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, slideId);
            ps.setInt(2, slideId);
            rs = ps.executeQuery();
            while (rs.next()) {
                PageBean p = new PageBean(rs.getInt(1),
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

}
