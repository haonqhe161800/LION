/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author laptop
 */
public class Customer implements Serializable {

    private int customerID;
    private Account account;
    private String address;
    private String phone;
    private String fullname;

    public Customer() {
    }

    public Customer( Account account, String address, String phone, String fullname) {
        this.account = account;
        this.address = address;
        this.phone = phone;
        this.fullname = fullname;
    }

    public Customer(int customerID, Account account, String address, String phone, String fullname) {
        this.customerID = customerID;
        this.account = account;
        this.address = address;
        this.phone = phone;
        this.fullname = fullname;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

   

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", AccountID=" + account.getAccountID() + ", address=" + address + ", phone=" + phone + ", fullname = " + fullname + '}';
    }

}
