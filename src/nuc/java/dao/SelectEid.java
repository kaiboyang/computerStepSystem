package nuc.java.dao;

import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectEid {
    String result = null;
    ResultSet rs = null;
    public String selectEid(String Ename){
        PreparedStatement pstmt =  DButils.getPreparedStatement("select Eid from exam where Ename=? ",Ename);

        try {
            rs = pstmt.executeQuery();
            while (rs.next()){
                result =  rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return result;
    }
}
