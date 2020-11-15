package nuc.java.dao;

import nuc.java.entity.Login;
import nuc.java.entity.apply;
import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class selectStudentById {
    apply app = null;
    ResultSet rs = null;
    public apply selectStudentById(String id){
        PreparedStatement pstmt =  DButils.getPreparedStatement("select * from student where sid=? ",id);

        try {
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            while (rs.next()){
                app = new apply(rs.getString(1),
                rs.getString(2),
                rs.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return app;
    }
}
