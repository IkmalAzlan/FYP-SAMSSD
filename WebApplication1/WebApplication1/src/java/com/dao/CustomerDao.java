package com.dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author Benjimal
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
//import com.model.rider;
import com.util.DBConnection;
import java.sql.DriverManager;
import model.Comment;

public class CustomerDao {

//    public static Connection getConnection(){
//        Connection con = null;
//         try{
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "admin");
//            
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return con;
//    }
    
//    public CustomerDao() throws ClassNotFoundException{
//        
//        connection = DBConnection.getConnection();
//    }
    private static Connection myConnection=null;
    private static final String myURL="jdbc:mysql://localhost:3306/holiday";
    public static Connection getConnection() throws ClassNotFoundException{
        if (myConnection != null){
            return myConnection;
        } else try {
            //Establish and open MySQL database connection....
            Class.forName("com.mysql.cj.jdbc.Driver");
            myConnection = DriverManager.getConnection(myURL, "root", "");
        } catch (SQLException e){
            e.printStackTrace();
        }
        return myConnection;
    }


    /**
     *
     * @param customer
     * @return 
     * @throws java.lang.ClassNotFoundException 
     */
    public static String addCustomer(Customer customer) throws ClassNotFoundException{
        try{
            try (Connection con = getConnection()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
                //con = myConnection;
                PreparedStatement preparedStatement = myConnection.prepareStatement("insert into users (name, phone, email, password, role) values (?, ?, ?, ?, ?)");
                //Parameters start with 1
                preparedStatement.setString(1, customer.getName());
                preparedStatement.setString(2, customer.getPhone());
                preparedStatement.setString(3, customer.getEmail());
                preparedStatement.setString(4, customer.getPass());
                preparedStatement.setString(5, customer.getRole());
                preparedStatement.executeUpdate();
                
                return "1";
            }
        } catch (SQLException e){
            System.out.print(e);
            return e.toString();
        }
    }
    public static void deleteCustomer(String id) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement;
            preparedStatement = con.
                    prepareStatement("delete from users where id=?");
            //Parameter start with 1
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    
    public static void updateCustomer (Customer customer) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con
                    .prepareStatement("update users set name=?, phone=?"
                            + ", email=?, " + "password=? where phone=?");
            //Parameters start with 1
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getPhone());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getPass());
            preparedStatement.setString(5, customer.getPhone());
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static List<Customer> getAllCustomers() throws ClassNotFoundException{
        List<Customer> customerList = new ArrayList<>();
        try{
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from users");
            while (rs.next()){
                Customer customer = new Customer();
                customer.setName(rs.getString("name"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));
                customer.setPass(rs.getString("password"));
                customer.setId(rs.getString("id"));
                customer.setRole(rs.getString("role"));
                customerList.add(customer);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return customerList;
    }
    public static Customer getCustomerById(String phone) throws ClassNotFoundException{
        Customer customer = new Customer();
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from users where phone=?");
            preparedStatement.setString(1, phone);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                customer.setName(rs.getString("name"));
                customer.setPhone(phone);
                customer.setEmail(rs.getString("email"));
                customer.setPass(rs.getString("password"));
                customer.setRole(rs.getString("role"));
                
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return customer;
    }
    
    public static Customer getCustomerByIdd(String id) throws ClassNotFoundException{
        Customer customer = new Customer();
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from users where id=?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                customer.setName(rs.getString("name"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));
                customer.setPass(rs.getString("password"));
                customer.setRole(rs.getString("role"));
                customer.setId(rs.getString("id"));
                
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return customer;
    }

    public static void postReview(int cid, String id, String comment) throws ClassNotFoundException {
        try{
            try (Connection con = getConnection()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
                //con = myConnection;
                PreparedStatement preparedStatement = myConnection.prepareStatement("insert into comments (id, user_id, comment) values (?, ?, ?)");
                //Parameters start with 1
                preparedStatement.setString(1, String.valueOf(cid));
                preparedStatement.setString(2, id);
                preparedStatement.setString(3, comment);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e){
            System.out.print(e);
        }
        
    }

    public static int comment_id() throws ClassNotFoundException {
        int id = 0;
        try{
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from comments order by id desc");
            while (rs.next()){
                id = Integer.parseInt(rs.getString("id"));
                break;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return id;
    }

    public static ArrayList<Comment> getAllComments() throws ClassNotFoundException {
        ArrayList<Comment> allC = new ArrayList<>();
        try{
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from comments order by datetime desc");
            while (rs.next()){
                Comment c = new Comment();
                c.setId(Integer.parseInt(rs.getString("id")));
                c.setComment(rs.getString("comment"));
                c.setC_id(Integer.parseInt(rs.getString("user_id")));
                c.setTimestamp(rs.getString("datetime"));
                allC.add(c);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return allC;
    }

    public static void deleteReview(String id) throws ClassNotFoundException, SQLException {
        try{
            Connection con = DBConnection.getConnection();
            System.out.println("Connected!");
            PreparedStatement preparedStatement;
            preparedStatement = con.
                    prepareStatement("delete from comments where id=?");
            //Parameter start with 1
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
            System.out.println("Exceuted!");
        } catch (SQLException e){
            e.printStackTrace();
            
            System.out.println("ERROR!!! _______________________________________________________________________________");
        }
    }
    
        public static int deleteAllReviewByCustomerId(String id) throws ClassNotFoundException, SQLException {
        
            int x = 0;
            try{
            Connection con = DBConnection.getConnection();
            System.out.println("Connected!");
            PreparedStatement preparedStatement;
            preparedStatement = con.
                    prepareStatement("delete from comments where user_id=?");
            //Parameter start with 1
            preparedStatement.setString(1, id);
            x = preparedStatement.executeUpdate();
            System.out.println("Executed!");
        } catch (SQLException e){
            e.printStackTrace();
            
            System.out.println("ERROR!!! _______________________________________________________________________________");
        }
            
            return x;
    }
    
}