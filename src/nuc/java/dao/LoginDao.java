package nuc.java.dao;

import nuc.java.entity.Login;

import java.sql.*;

public class LoginDao {
    //模型层：用于处理登录（查询数据库）
    static int result = -1;
    static Connection connection = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static int login(Login login) {//登录
        int flag = -1;  //-1:系统异常  0:用户名或密码异常   1：登陆成功
        try {

            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/testproject", "root", "123456");

            String sql = "select count(*) from student where Sid =? and Spwd =?";
            pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, login.getSid());
            pstmt.setString(2, login.getSpwd());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }
            if (result > 0) {
                return 1;
            } else {
                return 0;//登陆失败（用户名或密码有误！）
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return -1; //登陆失败（系统异常！）
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        } finally {
            {
                try {
                    if (pstmt != null) pstmt.close();
                    if (rs != null) rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }


}
