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
import utils.Utils;

/**
 *
 * @author laptop
 */
public class AccountDAO extends dal.DBContext implements IDAO<Account> {

    private Utils utils = new Utils();
    private final String SQL_INSERT = "INSERT INTO dbo.Account\n"
            + "(\n"
            + "    username,\n"
            + "    password,\n"
            + "    role,\n"
            + "    email\n"
            + ")\n"
            + "VALUES\n"
            + "(?, ?, ?, ?)";

    public Account find(String username, String password) {
        String sql = "select * from account where username=? and password=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt("accountID"), rs.getString("username"), rs.getString("password"), rs.getString("role"), rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String addAccount(String username, String password, String email) {
        String out = "Dang ky thanh cong";
        String accountID = utils.getAlphaNumericString(10);
        try {
            PreparedStatement st = connection.prepareStatement(SQL_INSERT);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, "user");
            st.setString(4, email);
            st.executeQuery();
        } catch (SQLException ex) {
            if (!(ex.toString().contains("The statement did not return a result set."))) {
                out = "Đăng ký thất bại, , vui lòng thử tên đăng nhập khác.";
            }
        }
        return out;
    }

    public void updatePassword(Account t) {
        String sql = "UPDATE dbo.account SET password = ? WHERE username = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, t.getPassword());
            st.setString(2, t.getUsername());
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    

    @Override
    public List<Account> parse(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Account get(int id) {
        Account account = new Account();
        String sql = "SELECT * FROM dbo.Account WHERE accountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                account.setAccountID(rs.getInt("accountID"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setRole(rs.getString("role"));
            }
            st.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    @Override
    public List<Account> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Account t) {
         String sql = "UPDATE dbo.account SET email = ? WHERE username = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, t.getEmail());
            st.setString(2, t.getUsername());
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static void main(String[] args) {
        System.out.println(new AccountDAO().get(1));
    }
}
