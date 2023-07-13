/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Account;
import model.Customer;
import utils.Utils;

/**
 *
 * @author laptop
 */
public class CustomerDAO extends DBContext implements IDAO<Customer> {

    private final Utils utils = new Utils();
    private final String SQL_INSERT = "INSERT INTO dbo.customer(accountID) VALUES (?)";
    private final String SQL_UPDATE = "UPDATE dbo.customer SET fullname = ? , phone = ?, address = ? WHERE accountID = ?";

    @Override
    public List<Customer> parse(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Customer get(int id) {
        Customer customer = new Customer();
        String sql = "SELECT * FROM dbo.Customer WHERE customerID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                customer.setCustomerID(rs.getInt("customerID"));
                customer.setAccount(new AccountDAO().get(rs.getInt("accountID")));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setFullname(rs.getString("fullname"));
            }
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Customer t) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_INSERT);
            st.setInt(1, t.getAccount().getAccountID());
            st.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    @Override
    public void delete(Customer t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public Customer findByAccountID(int accountID) {
        Customer customer = new Customer();
        String sql = "SELECT * FROM dbo.Customer WHERE accountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                customer.setCustomerID(rs.getInt("customerID"));
                customer.setAccount(new AccountDAO().get(rs.getInt("accountID")));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setFullname(rs.getString("fullname"));
            }
            st.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

//    public Customer getCustomer(String username) {
//        String sql = "SELECT * FROM dbo.customer WHERE username = ?";
//        Customer cus = null;
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, username);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                cus = new Customer();
//                cus.setUsername(username);
//                cus.setEmail(rs.getString(2));
//                cus.setAddress(rs.getString(3));
//                cus.setPhone(rs.getString(4));
//            }
//        } catch (SQLException e) {
//            System.out.println("lay ra thong tin khach hang");
//        }
//        return cus;
//    }
    @Override
    public void update(Customer t) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_UPDATE);
            st.setString(1, t.getFullname());
            st.setString(2, t.getPhone());
            st.setString(3, t.getAddress());
            st.setInt(4, t.getAccount().getAccountID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        Customer cus = new CustomerDAO().findByAccountID(1);
        cus.setAddress("36 Ngô Gia Tự, Đồng Hới");
        new CustomerDAO().update(cus);
    }

    

}
