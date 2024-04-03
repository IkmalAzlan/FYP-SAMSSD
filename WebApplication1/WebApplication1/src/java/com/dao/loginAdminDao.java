/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Admin;
import model.Staff;

/**
 *
 * @author Benjimal
 */
public class loginAdminDao {
    public static Connection getConnection(){
        Connection con = null;
         try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "");
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
     
    /**
     *
     * @param customer
     * @return Staff
     * @throws ClassNotFoundException
     */
    public Admin validate(String email, String password) throws ClassNotFoundException, SQLException
    {
        boolean result = false;
            Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "");
        
        String sql="select * from admins where password=? and email=?";
        
      Admin a = null;
      String role = "INVALID";
    try {
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, password);
      ps.setString(2, email);
      ResultSet rs=ps.executeQuery();
      result=rs.next();
      
      if(result)
      {
          a = new Admin(rs.getString("ID"), rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getString("phone"), rs.getString("role"));
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }    
    return a;
  }
}
