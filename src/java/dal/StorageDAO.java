/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author laptop
 */
public class StorageDAO extends DBContext {


    public void addStock(int productID, String size, int add) {
        String sql1 = "INSERT INTO dbo.storage(productID, size, num_left) VALUES(?,?,?)";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, productID);
            st1.setString(2, size);
            st1.setInt(3, 0);
            st1.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }

        System.out.println("Continue");

        String sql2 = "UPDATE dbo.storage SET num_left = num_left + ? , inDate = GETDATE() WHERE productID = ? AND size = ?";
        try {
            System.out.println("This RUN");
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, add);
            st2.setInt(2, productID);
            st2.setString(3, size);
            st2.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }

        System.out.println("Final");

    }

    public int getLeft(int productID, String size) {
        int left = 0;
        String sql = "select num_left from storage where productID = " + productID + " and size = '" + size + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                left = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return left;
    }

    public static void main(String[] args) {
        StorageDAO sdb = new StorageDAO();
        System.out.println(sdb.getLeft(2, "XL"));
    }
}
