package nuc.java.dao;

import nuc.java.entity.Attendence;
import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectZhunkaozhengDao {
    Attendence att = null;
    ResultSet rs = null;

    public Attendence SelectZhunkaozhengDao(String Sid) {
        PreparedStatement pstmt = DButils.getPreparedStatement("select  Sname,Ssex,Sid,exam.Ename,Rid from student,exam where student.Eid=exam.Eid and Sid=? ", Sid);
        try {
            rs = pstmt.executeQuery();
            while (rs.next()) {
                att = new Attendence(
                        rs.getString("Sname"),
                        rs.getString("Ssex"),
                        rs.getString("Sid"),
                        rs.getString("exam.Ename"),
                        rs.getString("Rid"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return att;
    }
}
