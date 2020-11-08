package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mvc.bean.RegisterBean;
import java.sql.ResultSet;

public class RegisterDao {

    public String authorizeRegister(RegisterBean registerBean) //create authorizeRegister()function
    {
        String firstname = registerBean.getFirstname();
        String lastname = registerBean.getLastname();
        String username = registerBean.getUsername();  //get all value through registerBean object and store in temporary variable
        String password = registerBean.getPassword();

        String url = "jdbc:sqlserver://localhost:1433;databaseName=User"; //database connection url string
        String user = "sa"; //database username
        String pass = "181639e01e7c8de"; //database password

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //load driver
            Connection con = DriverManager.getConnection(url, user, pass); //create connection
            PreparedStatement ps = con.prepareStatement("select * from User1 where username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            String comparedUsername = null;
            if(rs.next())
                comparedUsername = rs.getString("username");

            if (comparedUsername != null && comparedUsername.equals(username)) {
                ps.close(); //close statement
                con.close(); //close connection
                return "Account has already been registered!";
            }
            ps = con.prepareStatement("insert into User1(firstname,lastname,username,password) values(?,?,?,?)"); //sql insert query
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.executeUpdate(); //execute query

            ps.close(); //close statement

            con.close(); //close connection

            return "SUCCESS REGISTER"; //if valid return string "SUCCESS REGISTER" 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "FAIL REGISTER"; //if invalid return string "FAIL REGISTER"
    }
}
