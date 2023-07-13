package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import utils.Configs;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = (Connection) DriverManager.getConnection("jdbc:sqlserver://" + Configs.SERVER + ":" + Configs.PORT_NUMBER + ";databaseName=" + Configs.DB_NAME,
                    Configs.DB_USERNAME, Configs.DB_PASSWORD);
            System.out.println("Connect databse successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
