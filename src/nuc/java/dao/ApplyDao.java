package nuc.java.dao;

import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ApplyDao {
    int result = 0;
    public int ApplyDao(String Sid,String Eid){
        String sql = "update student  set Sstatus='1',Eid=? where Sstatus='0' and Sid=? ";
        PreparedStatement pstmt = DButils.getPreparedStatement(sql,Eid,Sid);
        try {
            if (pstmt.executeUpdate()!=0){
                result = 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
