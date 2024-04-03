/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Benjimal
 */
public class Boat {
    private int id;
    private int boatOwner;
    private String brand;
    private String plate;
    private int capacity;
    private String color;

    public Boat(int id, String brand, String plate, int capacity, String color) {
        this.id = id;
        this.brand = brand;
        this.plate = plate;
        this.capacity = capacity;
        this.color = color;
    }

    public Boat(int id, int boatOwner, String brand, String plate, int capacity, String color) {
        this.id = id;
        this.boatOwner = boatOwner;
        this.brand = brand;
        this.plate = plate;
        this.capacity = capacity;
        this.color = color;
    }

    public int getBoatOwner() {
        return boatOwner;
    }

    public void setBoatOwner(int boatOwner) {
        this.boatOwner = boatOwner;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    
}
