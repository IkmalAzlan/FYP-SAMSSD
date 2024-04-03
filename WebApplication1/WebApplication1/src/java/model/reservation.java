/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Benjimal
 */
public class reservation {
    private String id, phoneNo, date, session, numOfPassenger, status;

    public reservation(String id, String phoneNo, String date, String session, String numOfPassenger, String status) {
        this.id = id;
        this.phoneNo = phoneNo;
        this.date = date;
        this.session = session;
        this.numOfPassenger = numOfPassenger;
        this.status = status;
    }

    public reservation() {}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public String getNumOfPassenger() {
        return numOfPassenger;
    }

    public void setNumOfPassenger(String numOfPassenger) {
        this.numOfPassenger = numOfPassenger;
    }

    public String getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return "reservation{" + "id=" + id + ", phoneNo=" + phoneNo + ", date=" + date + ", session=" + session + ", numOfPassenger=" + numOfPassenger + ", status=" + status + '}';
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
