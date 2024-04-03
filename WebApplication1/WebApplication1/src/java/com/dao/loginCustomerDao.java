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
import model.loginCustomer;

//import com.model.loginadmin;

/**
 *
 * @author Benjimal
 */
public class loginCustomerDao {
    
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
     * @return Customer
     * @throws ClassNotFoundException
     */
    public Customer validate(loginCustomer customer) throws ClassNotFoundException, SQLException
    {
        boolean result = false;
            Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "");
        
        String sql="select * from users where password=? and email=?";
        
      Customer c = null;
      String role = "INVALID";
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, customer.getPassword());
      ps.setString(2, customer.getEmail());
      ResultSet rs=ps.executeQuery();
      result=rs.next();
      
      if(result)
      {
          c = new Customer(rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getString("phone"), rs.getString("role"));
          c.setId(rs.getString("id"));
      }
    return c;
  }
  }
    
    

