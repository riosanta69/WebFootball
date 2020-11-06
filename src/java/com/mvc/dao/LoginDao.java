package com.mvc.dao;

import com.mvc.bean.LoginBean;
import context.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

    public String authorizeLogin(LoginBean loginBean) //create authorizeLogin()function
    {
        String username = loginBean.getUsername(); //get username value through loginBean object and store in temporary variable "username"
        String password = loginBean.getPassword(); //get password value through loginBean object and store in temporary variable "password"
        String dbusername;
        String dbpassword;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //load driver
            Connection con = new DBContext().getConnection(); //create connection
            PreparedStatement ps = null;
            ps = con.prepareStatement("select * from User1 where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                dbusername = rs.getString("username");
                dbpassword = rs.getString("password");
                if (username.equals(dbusername) && password.equals(dbpassword)) {
                    return "SUCCESS LOGIN";
                }
            }
            ps.close();
            con.close(); //close connection

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "WRONG USERNAME AND PASSWORD";
    }
}
