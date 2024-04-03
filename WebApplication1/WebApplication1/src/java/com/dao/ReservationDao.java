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
import model.Staff;
import model.reservation;

public class ReservationDao {

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
    private static Connection myConnection = null;
    private static final String myURL = "jdbc:mysql://localhost:3306/holiday";

    public static Connection getConnection() throws ClassNotFoundException {
        if (myConnection != null) {
            return myConnection;
        } else try {
            //Establish and open MySQL database connection....
            Class.forName("com.mysql.jdbc.Driver");
            myConnection = DriverManager.getConnection(myURL, "root", "");
        } catch (SQLException e) {
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
    public static String addReservation(reservation r) throws ClassNotFoundException {
        try {
            try ( Connection con = getConnection()) {
                Class.forName("com.mysql.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "");
                //con = myConnection;
                PreparedStatement preparedStatement = myConnection.prepareStatement("insert into reservations (phone, date, session, passenger, status) values (?, ?, ?, ?, ?)");
                //Parameters start with 1
                preparedStatement.setString(1, r.getPhoneNo());
                preparedStatement.setString(2, r.getDate());
                preparedStatement.setString(3, r.getSession());
                preparedStatement.setString(4, r.getNumOfPassenger());
                preparedStatement.setString(5, r.getStatus());
                preparedStatement.executeUpdate();

                return "1";
            }
        } catch (SQLException e) {
            System.out.print(e);
            return e.toString();
        }
    }

    public static String addGuestReservationInfo(int reservationId, String name, String email, String phoneNumber, String emergencyPhoneNumber) throws ClassNotFoundException {
        try {

            myConnection = DriverManager.getConnection(myURL, "root", "");
            //con = myConnection;
            PreparedStatement preparedStatement = myConnection.prepareStatement("insert into guest_reservation(reservationId, guestName, guestEmail, guestPhoneNumber, guestEmergencyPhoneNumber) values(?, ?, ?, ?, ?)");
            //Parameters start with 1
            preparedStatement.setInt(1, reservationId);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, phoneNumber);
            preparedStatement.setString(5, emergencyPhoneNumber);
            preparedStatement.executeUpdate();

            return "1";

        } catch (SQLException e) {
            System.out.print(e);
            return e.toString();
        }
    }
    
    public static String addCustomerReservationInfo(int reservationId, String name, String email, String phoneNumber, String emergencyPhoneNumber) throws ClassNotFoundException {
        try {

            myConnection = DriverManager.getConnection(myURL, "root", "");
            //con = myConnection;
            PreparedStatement preparedStatement = myConnection.prepareStatement("insert into customer_reservation(reservationId, customerName, customerEmail, customerPhoneNumber, customerEmergencyPhoneNumber) values(?, ?, ?, ?, ?)");
            //Parameters start with 1
            preparedStatement.setInt(1, reservationId);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, phoneNumber);
            preparedStatement.setString(5, emergencyPhoneNumber);
            preparedStatement.executeUpdate();

            return "1";

        } catch (SQLException e) {
            System.out.print(e);
            return e.toString();
        }
    }
    
    public static int checkCustomerReservationAvailability(int reservationId) throws ClassNotFoundException {
        try {

            myConnection = DriverManager.getConnection(myURL, "root", "");
            PreparedStatement preparedStatement = myConnection.prepareStatement("SELECT * FROM customer_reservation WHERE reservationId='" + reservationId + "'");
            ResultSet rs = preparedStatement.executeQuery();
            
            if(rs.next()) {
                return 1;
            }

        } catch (SQLException e) {
            System.out.print(e);
        }
        return 0;
    }
    
    public static int checkAvailability(int reservationId) throws ClassNotFoundException {
        try {

            myConnection = DriverManager.getConnection(myURL, "root", "");
            PreparedStatement preparedStatement = myConnection.prepareStatement("SELECT * FROM guest_reservation WHERE reservationId='" + reservationId + "'");
            ResultSet rs = preparedStatement.executeQuery();
            
            if(rs.next()) {
                return 1;
            }

        } catch (SQLException e) {
            System.out.print(e);
        }
        return 0;
    }

    public static int getReservationId() throws ClassNotFoundException {
        try {

            Connection connection = DBConnection.getConnection();
            //con = myConnection;
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id from reservations ORDER BY id DESC LIMIT 1");
            //Parameters start with 1

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.print(e);
        }
        return 0;
    }

    public static void deleteReservation(String id) throws ClassNotFoundException {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement;
            preparedStatement = con.
                    prepareStatement("delete from reservations where id=?");
            //Parameter start with 1
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void cancelReservation(String id) throws ClassNotFoundException {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement;
            preparedStatement = con.
                    prepareStatement("update reservations set status=? where id=?");
            //Parameter start with 1
            preparedStatement.setString(1, "CANCELLED");
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateReservation(reservation r) throws ClassNotFoundException {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con
                    .prepareStatement("update reservations set phone=?, date=?,"
                            + " session=?, passenger=?, status=? where id=?");
            //Parameters start with 1
            preparedStatement.setString(1, r.getPhoneNo());
            preparedStatement.setString(2, r.getDate());
            preparedStatement.setString(3, r.getSession());
            preparedStatement.setString(4, r.getNumOfPassenger());
            preparedStatement.setString(5, r.getStatus());
            preparedStatement.setString(6, r.getId());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<reservation> getAllReservations() throws ClassNotFoundException, SQLException {
        List<reservation> reservationList = new ArrayList<>();
//        Class.forName("com.mysql.jdbc.Driver");
//        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "");
        try {
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from reservations");
            while (rs.next()) {
                reservation r = new reservation(rs.getString("id"), rs.getString("phone"), rs.getString("date"), rs.getString("session"), rs.getString("passenger"), rs.getString("status"));
                reservationList.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservationList;
    }

    public static reservation getReservationById(String id) throws ClassNotFoundException {
        reservation r = new reservation();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from reservations where id=?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                r.setPhoneNo(rs.getString("phone"));
                r.setDate(rs.getString("date"));
                r.setSession(rs.getString("session"));
                r.setNumOfPassenger(rs.getString("passenger"));
                r.setStatus(rs.getString("status"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public static Staff getReservationBoat(String id) throws ClassNotFoundException {
        Staff r = new Staff();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(
                    "select * from boats where reservationID=?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            String boatID = "0";
            while (rs.next()) {
                boatID = rs.getString("boatID");
//                r.setPhoneNo(rs.getString("phone"));
//                r.setDate(rs.getString("date"));
//                r.setSession(rs.getString("session"));
//                r.setNumOfPassenger(rs.getString("passenger"));
//                r.setStatus(rs.getString("status"));   
            }

            if (!"0".equalsIgnoreCase(boatID)) {
                preparedStatement = con.prepareStatement(
                        "select * from staffs where ID=?");
                preparedStatement.setString(1, boatID);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
//                boatID = rs.getString("boatID");
                    r.setName(rs.getString("name"));
                    return r;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String addBoatClaim(String rID, String bID) throws ClassNotFoundException {
        try {
            try ( Connection con = getConnection()) {

                //con = myConnection;
                myConnection = DriverManager.getConnection(myURL, "root", "");
                PreparedStatement preparedStatement = myConnection.prepareStatement("insert into boats (reservationID, boatID) values (?, ?)");
                //Parameters start with 1
                preparedStatement.setString(1, rID);
                preparedStatement.setString(2, bID);
                preparedStatement.executeUpdate();

                return "1";
            }
        } catch (SQLException e) {
            System.out.print(e);
            return e.toString();
        }
    }

    public static String resetBoatClaim(String rID) throws ClassNotFoundException {
        try {
            try ( Connection con = getConnection()) {

                //con = myConnection;
                PreparedStatement preparedStatement = con.prepareStatement("delete from boats where reservationID=?");
                //Parameters start with 1
                preparedStatement.setString(1, rID);
                preparedStatement.executeUpdate();

                return "1";
            }
        } catch (SQLException e) {
            System.out.print(e);
            return e.toString();
        }
    }

}
