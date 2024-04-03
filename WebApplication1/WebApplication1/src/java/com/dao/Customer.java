package com.dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Benjimal
 */
public class Customer {
    private String id;
    private String email;
    private String pass;
    private String name;
    private String phone;
    private String role;

    public Customer(String email, String pass, String name, String phone, String role) {
        this.email = email;
        this.pass = pass;
        this.name = name;
        this.phone = phone;
        this.role = role;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Customer() {
    }

    @Override
    public String toString() {
        return "Customer{" + "email=" + email + ", pass=" + pass + ", name=" + name + ", phone=" + phone + ", role=" + role + '}';
    }
    
    
}
