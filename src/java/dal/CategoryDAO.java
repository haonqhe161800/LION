/*Đây là các lớp truy xuất dữ liệu (Data Access Object) dùng để truy vấn cơ sở dữ liệu và 
 *thực hiện các thao tác CRUD (Create, Read, Update, Delete) với các đối tượng Category và Product.
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.List;
import model.Category;

/**
 *
 * @author hoang
 */
public class CategoryDAO extends DBContext implements IDAO<Category>{

    @Override
    public List<Category> parse(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Category get(int id) {
        Category cate = new Category();
        String sql = "SELECT * FROM dbo.Category WHERE CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cate.setCategoryID(rs.getInt("CategoryID"));
                cate.setCategoryName(rs.getString("CategoryName"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cate;
    }

    @Override
    public List<Category> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Category t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Category t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Category t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
