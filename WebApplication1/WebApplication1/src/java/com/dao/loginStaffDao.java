/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Staff;
import model.loginCustomer;

//import com.model.loginadmin;

/**
 *
 * @author Benjimal
 */
public class loginStaffDao {
    
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
    public Staff validate(String email, String password) throws ClassNotFoundException, SQLException
    {
        boolean result = false;
            Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "");
        
        String sql="select * from staffs where password=? and email=?";
        
      Staff s = null;
      String role = "INVALID";
    try {
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, password);
      ps.setString(2, email);
      ResultSet rs=ps.executeQuery();
      result=rs.next();
      
      if(result)
      {
          s = new Staff(rs.getString("ID"), rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getString("phone"), rs.getString("role"), rs.getString("status"));
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }    
    return s;
  }
  }
    
    

