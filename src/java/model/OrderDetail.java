/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author laptop
 */
public class OrderDetail {
    private String dogID;
    private String sex;
    private int quantity;
    private float total;
    
    DecimalFormat df = new DecimalFormat("#.00");

    public OrderDetail() {
    }

    public OrderDetail(String dogID, String sex, int quantity, float total) {
        this.dogID = dogID;
        this.sex = sex;
        this.quantity = quantity;
        this.total = Float.parseFloat(df.format(total));
    }

    public String getDogID() {
        return dogID;
    }

    public void setDogID(String dogID) {
        this.dogID = dogID;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = Float.parseFloat(df.format(total));
    }
    
}
