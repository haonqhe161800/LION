/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author laptop
 */
public class Order {

    private int oid;
    private String odate, sdate;
    private Account account;
    private Product product;
    private String status;
    private float payment, shipping, total;
    DecimalFormat df = new DecimalFormat("#.00");

    public Order() {
        this.status = "delivering";
    }

    public Order(int oid, Account account, Product product, float payment, float shipping, float total) {

        this.oid = oid;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        //Given Date in String format
        this.odate = sdf.format(date);
        //Specifying date format that matches the given date

        Calendar c = Calendar.getInstance();
        try {
            //Setting the date to the given date
            c.setTime(sdf.parse(odate));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //Number of Days to add
        c.add(Calendar.DAY_OF_MONTH, 5);
        //Date after adding the days to the given date
        this.sdate = sdf.format(c.getTime());

        this.account = account;
        this.product = product;
        this.payment = Float.parseFloat(df.format(payment));
        this.shipping = Float.parseFloat(df.format(shipping));
        this.total = Float.parseFloat(df.format(total));
        this.status = "delivering";
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOdate() {
        return odate;
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public float getPayment() {
        return payment;
    }

    public void setPayment(float payment) {
        this.payment = Float.parseFloat(df.format(payment));
    }

    public float getShipping() {
        return shipping;
    }

    public void setShipping(float shipping) {
        this.shipping = Float.parseFloat(df.format(shipping));
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = Float.parseFloat(df.format(total));
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "oid=" + oid + ", odate=" + odate + ", sdate=" + sdate + ", account=" + account + ", product= " + product + ", status=" + status + ", payment=" + payment + ", shipping=" + shipping + ", total=" + total + '}';
    }

}
