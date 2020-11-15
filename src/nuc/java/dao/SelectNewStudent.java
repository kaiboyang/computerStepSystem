package nuc.java.dao;

import nuc.java.entity.Login;
import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SelectNewStudent {
    String sid;
    ResultSet rs = null;
    String sname = null;
    String spwd = null;
    Login login = null;
    List<Login> list = new ArrayList<>();
    public List selectNewStudent(){
        PreparedStatement pstmt =  DButils.getPreparedStatement("SELECT * FROM student ORDER BY Sid DESC LIMIT 1");
        try {
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            while (rs.next()){
                sid = rs.getString("Sid");
                sname = rs.getString("Sname");
                spwd = rs.getString("Spwd");
                login = new Login(sid,sname,spwd);
                list.add(login);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
