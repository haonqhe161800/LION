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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author laptop
 */
public class OrderDAO extends DBContext implements IDAO<Order>{

    DecimalFormat df = new DecimalFormat("#.00");

    public void addOrder(Order order, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();

        try {
            //add vào bang Order
            String sql = "INSERT INTO dbo.orders VALUES (?, ?, ?, ?, ROUND(?, 2), ROUND(?, 2), ROUND(?, 2), ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getOdate());
            st.setString(2, order.getSdate());
            st.setInt(3, order.getAccount().getAccountID());
            st.setInt(4, order.getProduct().getProductID());
            st.setFloat(5, Float.parseFloat(df.format(order.getPayment())));
            st.setFloat(6, Float.parseFloat(df.format(order.getShipping())));
            st.setFloat(7, Float.parseFloat(df.format(order.getPayment() + order.getShipping())));
            st.setString(8, order.getStatus());
            st.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Add vao order");
        }

        try {
            //lay ra id cua Order vua add
            String sql1 = "SELECT TOP 1 orderID FROM dbo.orders ORDER BY orderID DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add vào bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    try {
                        String sql2 = "INSERT INTO dbo.orderDetails VALUES (?,?,?,ROUND(?, 2),?,ROUND(?, 2))";
                        PreparedStatement st2 = connection.prepareStatement(sql2);
                        float discount = 0; // discount percentage
                        st2.setInt(1, oid);
                        st2.setInt(2, i.getProduct().getProductID());
                        st2.setFloat(3, discount); // discount
                        st2.setFloat(4, Float.parseFloat(df.format(i.getPrice())));
                        st2.setInt(5, i.getQuantity());
                        st2.setFloat(6, Float.parseFloat(df.format(i.getQuantity() * i.getPrice() * discount)));
                        st2.executeUpdate();
                    } catch (SQLException e) {
                        System.out.println(e);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Them vao detail nhung o ngoai");
        }

        //update so luong trong bang Product sau khi ban
        String sql3 = "update storage set num_left = num_left - ? where productID =  ? and size = ?";
        for (Item i : cart.getItems()) {
            try {
                PreparedStatement st3 = connection.prepareStatement(sql3);
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getProductID());
                st3.setString(3, i.getSize());
                st3.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("update storage");
            }
        }

    }

    public void updateConfirm(int oid, String message) {
        String sql;
        if (message.equals("delivering")) {
            sql = "UPDATE dbo.orders SET status = ?, shipDate = DATEADD(day, 5, orderDate) WHERE orderID = ? ";
        } else {
            sql = "UPDATE dbo.orders SET status = ?, shipDate = GETDATE() WHERE orderID = ? ";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, message);
            st.setInt(2, oid);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getOrderNum(String username) {
        int orderNum = 0;
        String sql = "SELECT username, COUNT(orderID) AS orderNum FROM dbo.orders WHERE username = ? AND MONTH(orderDate) = MONTH(GETDATE()) GROUP BY username";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                orderNum = rs.getInt(2);
            }
        } catch (SQLException ex) {
            System.out.println("lay so luong don hang");
        }
        return orderNum;
    }


    public List<Order> getAllOrder(int accountID) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT orderID, orderDate, shipDate, accountID, payment, shipping, total, status FROM orders ";
        if (accountID != 0) {
            sql = sql.concat(" WHERE accountID = " + accountID + " ");
        }
        sql = sql.concat(" ORDER BY orderID DESC");
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOid(rs.getInt(1));
                o.setOdate(rs.getString(2));
                o.setSdate(rs.getString(3));
                o.setAccount(new AccountDAO().get(accountID));
                o.setPayment(rs.getFloat(5));
                o.setShipping(rs.getFloat(6));
                o.setTotal(rs.getFloat(7));
                o.setStatus(rs.getString(8));
                list.add(o);
            }
        } catch (SQLException ex) {
            System.out.println("lay tat ca don hang");
        }
        return list;
    }

    public List<Item> getDetails(int oid) {
        List<Item> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.orderDetails WHERE orderID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Item i = new Item();
                i.setProduct(new ProductDAO().get(rs.getInt(2)));
                i.setSize(new ProductDAO().getSize(rs.getInt(2)).get(0));
                i.setQuantity(rs.getInt(5));
                i.setPrice(rs.getFloat(4));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Map<String, Integer> getMostBuy(String username) {
        Map<String, Integer> most = new HashMap<>();
        String sql = "SELECT TOP 1 dogID, SUM(quantity) AS num_of_bought "
                + "FROM dbo.orders INNER JOIN dbo.orderDetails ON orderDetails.orderID = orders.orderID "
                + "WHERE username = ? GROUP BY dogID ORDER BY num_of_bought DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                most.put(rs.getString(1), rs.getInt(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return most;
    }

    public static void main(String[] args) {
        DecimalFormat df = new DecimalFormat("#.00");
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.get(2);
        Account acc = new AccountDAO().get(1);
        Item i = new Item(acc, product, "", "XL", 1, product.getPrice() * 105 / 100);
        List<Item> list = new ArrayList<>();
        list.add(i);
        Cart cart = new Cart(3, 1);
        cart.setItems(list);
        Order order = new Order(3,
                new AccountDAO().get(cart.getAccountID()),
                new ProductDAO().get(cart.getProductID()),
                cart.getTotalMoney(),
                cart.getTotalMoney() / 100,
                (cart.getTotalMoney() * 101) / 100);
        OrderDAO odb = new OrderDAO();
        odb.addOrder(order, cart);
//        for (Item x : cart.getItems()) {
//            System.out.println(Float.parseFloat(df.format(x.getPrice())));
//            System.out.println(Float.parseFloat(df.format(x.getQuantity() * x.getPrice())));
//        }
//
//        System.out.println(odb.getOrderNum("mrc"));
//        odb.updateConfirm(10, "delivering");

//        Account acc = new Account("asd", "asd", "user");
//        Map<String, Integer> most = odb.getMostBuy(acc.getUsername());
//        String most_id = (String) most.keySet().toArray()[0];
//        System.out.println(most_id);
    }

    @Override
    public List<Order> parse(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Order get(int id) {
        Order o = new Order();
        String sql = "SELECT * FROM dbo.orders WHERE orderID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                o.setOid(rs.getInt(1));
                o.setOdate(rs.getString(2));
                o.setSdate(rs.getString(3));
                o.setAccount(new AccountDAO().get(rs.getInt(4)));
                o.setProduct(new ProductDAO().get(rs.getInt(5)));
                o.setPayment(rs.getFloat(6));
                o.setShipping(rs.getFloat(7));
                o.setTotal(rs.getFloat(8));
                o.setStatus(rs.getString(9));
            }
        } catch (SQLException ex) {
            System.out.println("lay tat ca don hang");
        }
        return o;
    }

    @Override
    public List<Order> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Order t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Order t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Order t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
