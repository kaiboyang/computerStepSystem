package nuc.java.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DButils {
    //    创建连接
    private static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/testproject", "root", "123456");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static PreparedStatement getPreparedStatement(String sql, Object... objects) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = getConnection().prepareStatement(sql);
            for (int i = 0; i < objects.length; i++) {
                preparedStatement.setObject(i + 1, objects[i]);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return preparedStatement;
    }
}
