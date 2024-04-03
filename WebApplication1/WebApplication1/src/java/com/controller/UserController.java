/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.CustomerDao;
import com.dao.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.customer1;

public class UserController extends HttpServlet {
    
    private static String INSERT = "/customer.jsp";
    private static String EDIT = "/customer.jsp";
    private static String LIST_USER = "/customer.jsp";
    private CustomerDao dao;
    
    public UserController() throws ClassNotFoundException{
        super();
        dao = new CustomerDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            String userId = request.getParameter("userId");
            try {
                dao.deleteCustomer(userId);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            forward = LIST_USER;
            try {
                request.setAttribute("users", dao.getAllCustomers());
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if (action.equalsIgnoreCase("edit")){
            forward = EDIT;
            String userId = request.getParameter("userId");
            Customer customer = null;
            try {
                customer = (Customer)dao.getCustomerById(userId);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("user", customer);
            
        } else if (action.equalsIgnoreCase("listUser")){
            forward = LIST_USER;
            try {
                request.setAttribute("users", dao.getAllCustomers());
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if(action.equalsIgnoreCase("insert")){
            forward = INSERT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String action = request.getParameter("action");
        
        Customer customer = new Customer();
        customer.setEmail(request.getParameter("userid"));
        customer.setPass(request.getParameter("password"));
        customer.setName(request.getParameter("firstName"));
        customer.setPhone(request.getParameter("phone"));
        
        if(action.equalsIgnoreCase("edit")){
            try {
                dao.updateCustomer(customer);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                CustomerDao.addCustomer(customer);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        try {
            request.setAttribute("customer", dao.getAllCustomers());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        view.forward(request, response);
    }
}
