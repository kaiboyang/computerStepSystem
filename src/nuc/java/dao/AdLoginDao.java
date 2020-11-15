package nuc.java.dao;

import nuc.java.entity.Admin;
import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdLoginDao {
    ResultSet rs = null;
    int result = 0;
    public int adLoginDao(Admin admin){
        String sql = "select count(*) from admin where aid=? and apwd=? ";
        PreparedStatement pstmt = DButils.getPreparedStatement(sql,admin.getaId(),admin.getaPwd());
        try {
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
                System.out.println("getInt"+rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("result是"+result);
        return result;
    }
}
