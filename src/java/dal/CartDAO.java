/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author laptop
 */
public class CartDAO extends DBContext implements IDAO<Cart> {

    DecimalFormat df = new DecimalFormat("#.00");

    @Override
    public List<Cart> parse(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cart get(int id) {
        Cart cart = new Cart(id);
        String sql = "SELECT * FROM product INNER JOIN dbo.cart \n"
                + "ON Cart.productID = Product.productID\n"
                + "WHERE Cart.productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), Float.parseFloat(df.format(rs.getFloat(4))), rs.getString(5), rs.getString(6), new CategoryDAO().get(rs.getInt(7)));
                String size = rs.getString(16);
                String colour = rs.getString(15);
                int quantity = rs.getInt(12);
                float price = product.getPrice();
                Item t = new Item(new AccountDAO().get(rs.getInt(10)), product, colour, size, quantity, price);
                cart.addItem(t);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cart;
    }

    @Override
    public List<Cart> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Cart t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Cart t) {
        // xóa cũ
        String sql1 = "DELETE FROM dbo.cart WHERE accountID = ? and productID = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, t.getAccountID());
            st1.setInt(2, t.getProductID());
            st1.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
        for (int i = 0; i < t.getItems().size(); i++) {
            // thay mới
            String sql2 = "INSERT INTO dbo.cart VALUES (?, ?, ?, ?, ROUND(?, 2), ROUND(?, 2)), ?, ?";
            Item item = t.getItems().get(i);
            try {
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setString(1, item.getProduct().getImage());
                st2.setInt(2, item.getAccount().getAccountID());
                st2.setInt(3, item.getProduct().getProductID());
                st2.setInt(4, item.getQuantity());
                st2.setFloat(5, Float.parseFloat(df.format(item.getPrice())));
                st2.setFloat(6, Float.parseFloat(df.format(item.getPrice())) * item.getQuantity());
                st2.setString(7, item.getColour());
                st2.setString(8, item.getSize());
                st2.executeQuery();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    @Override
    public void delete(Cart t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
