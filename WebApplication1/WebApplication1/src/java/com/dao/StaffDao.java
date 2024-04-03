package com.dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author Benjimal
 */
import static com.dao.CustomerDao.getConnection;
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
import java.util.HashSet;
import java.util.Set;
import model.Admin;
import model.Boat;
import model.Comment;
import model.Staff;
import model.reservation;

public class StaffDao {

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
    public static String addStaff(Staff s) throws ClassNotFoundException{
        try{
            try (Connection con = getConnection()) {
//                Class.forName("com.mysql.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
                //con = myConnection;
                PreparedStatement preparedStatement = myConnection.prepareStatement("insert into staffs (email, password, name, phone, role, status, address, licence) values (?, ?, ?, ?, ?, ?, ?, ?)");
                //Parameters start with 1
                preparedStatement.setString(1, s.getEmail());
                preparedStatement.setString(2, s.getPassword());
                preparedStatement.setString(3, s.getName());
                preparedStatement.setString(4, s.getPhone());
                preparedStatement.setString(5, s.getRole());
                preparedStatement.setString(6, s.getStatus());
                preparedStatement.setString(7, s.getAddress());
                preparedStatement.setString(8, s.getLicense());
                preparedStatement.executeUpdate();
                
                return "1";
            }
        } catch (SQLException e){
            System.out.print(e);
            return e.toString();
        }
    }
    public static void deleteStaff(String id) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement;
            preparedStatement = con.
                    prepareStatement("delete from staffs where id=?");
            //Parameter start with 1
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    
    public static void updateStaff(Staff s) throws ClassNotFoundException{
        try{
            
//        Class.forName("com.mysql.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
            PreparedStatement preparedStatement = myConnection
                    .prepareStatement("update staffs set phone=?, name=?, email=?, password=?, status=?, role=?, address=?, licence=? where id=?");
            //Parameters start with 1
                preparedStatement.setString(1, s.getPhone());
                preparedStatement.setString(2, s.getName());
                preparedStatement.setString(3, s.getEmail());
                preparedStatement.setString(4, s.getPassword());
                preparedStatement.setString(5, s.getStatus());
                preparedStatement.setString(6, s.getRole());
                preparedStatement.setString(7, s.getAddress());
                preparedStatement.setString(8, s.getLicense());
                preparedStatement.setString(9, s.getID());
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static List<Staff> getAllStaffs() throws ClassNotFoundException, SQLException{
        List<Staff> staffList = new ArrayList<>();
//        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "");
        try{
//            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from staffs");
            while (rs.next()){
                Staff s = new Staff(rs.getString("id"), rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getString("phone"), rs.getString("role"), rs.getString("status"), rs.getString("address"), rs.getString("licence"));
                staffList.add(s);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return staffList;
    }
    public static Staff getStaffById(String id) throws ClassNotFoundException{
        Staff s = new Staff();
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from staffs where id=?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                s.setID(id);
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
                s.setName(rs.getString("name"));
                s.setRole(rs.getString("role"));
                s.setStatus(rs.getString("status"));
                s.setAddress(rs.getString("address"));
                s.setLicense(rs.getString("licence"));
                
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return s;
    }
    
    public static Admin getAdminById(String id) throws ClassNotFoundException{
        Admin a = new Admin();
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from admins where id=?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                a.setID(id);
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setName(rs.getString("name"));
                a.setRole(rs.getString("role"));
                
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return a;
    }
    
    public static Admin getAdminByName(String id) throws ClassNotFoundException{
        Admin a = new Admin();
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from admins where name=?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                a.setID(rs.getString("ID"));
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setName(rs.getString("name"));
                a.setRole(rs.getString("role"));
                
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return a;
    }
    
    public static void postReply(int cid, String id, String comment) throws ClassNotFoundException {
        try{
            try (Connection con = getConnection()) {
//                System.out.println("Connection success!");
                Class.forName("com.mysql.cj.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
                //con = myConnection;
                PreparedStatement preparedStatement = myConnection.prepareStatement("insert into replies (reply, comment_id) values (?, ?)");
                //Parameters start with 1
//                preparedStatement.setString(1, String.valueOf(cid));
                preparedStatement.setString(1, comment);
                preparedStatement.setString(2, id);
                preparedStatement.executeUpdate();
//                System.out.println("Insert success!");
            }
        } catch (SQLException e){
            System.out.print(e);
//                System.out.println("ERROR__________________________________________________________________________");
        }
        
    }

    public static int reply_id() throws ClassNotFoundException {
        int id = 0;
        try{
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            
//                System.out.println("Connection success!");
            ResultSet rs = statement.executeQuery("select * from replies order by id desc");
            while (rs.next()){
                id = Integer.parseInt(rs.getString("id"));
                break;
            }
            
//                System.out.println("Reply ID : " + id);
        } catch (SQLException e){
            e.printStackTrace();
            
//                System.out.println("ERROR___________________________________________-");
        }
        return id;
    }

    public static ArrayList<Comment> getAllReplies() throws ClassNotFoundException {
        ArrayList<Comment> allC = new ArrayList<>();
        try{
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from replies order by datetime desc");
            while (rs.next()){
                Comment c = new Comment();
                c.setId(Integer.parseInt(rs.getString("id")));
                c.setComment(rs.getString("reply"));
                c.setC_id(Integer.parseInt(rs.getString("comment_id")));
                c.setTimestamp(rs.getString("datetime"));
                allC.add(c);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return allC;
    }
    
    
    public static String addBoat(Boat b) throws ClassNotFoundException{
        try{
            try (Connection con = getConnection()) {
//                Class.forName("com.mysql.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
                //con = myConnection;
                PreparedStatement preparedStatement = myConnection.prepareStatement("insert into boatinfo (id, boatOwner, brand, plate, capacity, color) values (?, ?, ?, ?, ?, ?)");
                //Parameters start with 1
                preparedStatement.setString(1, String.valueOf(b.getId()));
                preparedStatement.setString(2, String.valueOf(b.getBoatOwner()));
                preparedStatement.setString(3, b.getBrand());
                preparedStatement.setString(4, b.getPlate());
                preparedStatement.setString(5, String.valueOf(b.getCapacity()));
                preparedStatement.setString(6, b.getColor());
                preparedStatement.executeUpdate();
                
                return "1";
            }
        } catch (SQLException e){
            System.out.print(e);
            return e.toString();
        }
    }
    
    

    public static ArrayList<Boat> getAllBoats() throws ClassNotFoundException {
        ArrayList<Boat> allB = new ArrayList<>();
        try{
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from boatinfo");
            while (rs.next()){
                Boat b = new Boat(Integer.parseInt(rs.getString("id")), Integer.parseInt(rs.getString("boatOwner")), rs.getString("brand"), rs.getString("plate"), Integer.parseInt(rs.getString("capacity")), rs.getString("color"));
                
                allB.add(b);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return allB;
    }
    
    
    public static void deleteBoat(String id) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement;
            preparedStatement = con.
                    prepareStatement("delete from boatinfo where id=?");
            //Parameter start with 1
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    
    public static void updateBoat(Boat b) throws ClassNotFoundException{
        try{
            
//        Class.forName("com.mysql.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
            PreparedStatement preparedStatement = myConnection
                    .prepareStatement("update boatinfo set brand=?, plate=?, capacity=?, color=? where id=?");
            //Parameters start with 1
                preparedStatement.setString(1, b.getBrand());
                preparedStatement.setString(2, b.getPlate());
                preparedStatement.setString(3, String.valueOf(b.getCapacity()));
                preparedStatement.setString(4, b.getColor());
                preparedStatement.setString(5, String.valueOf(b.getId()));
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static Boat getBoatByID(String id) throws ClassNotFoundException {
        Boat b = null;
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from boatinfo where id=?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                b = new Boat(Integer.parseInt(rs.getString("id")), Integer.parseInt(rs.getString("boatOwner")), rs.getString("brand"), rs.getString("plate"), Integer.parseInt(rs.getString("capacity")), rs.getString("color"));
                
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return b;
    }
}