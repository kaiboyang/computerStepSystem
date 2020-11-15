package nuc.java.dao;

import nuc.java.entity.Login;
import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IStuDao {
    public boolean dozhun(Login login) {
        String id=null ;
        boolean flag = false;
        System.out.println("111");
        String sql = "select Rid from zkz where Sid=?";
        PreparedStatement ps = DButils.getPreparedStatement(sql, login.getSid());

        ResultSet rs = null;
        try {
            rs = ps.executeQuery();
            while (rs.next()) {
                id = (String)rs.getObject("Rid");
            }
            if (id==null) {
                flag = false;
            } else {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;

    }
}

