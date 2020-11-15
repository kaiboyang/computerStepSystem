package nuc.java.dao;

import nuc.java.entity.GradeShow;
import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GradeShowDao {
    ResultSet rs;
    GradeShow gradeShow;
    public GradeShow gradeShowDao(String sid){
        String sql = "select sid,sname,ename,grade from student,exam where student.eid=exam.eid and sid=?";
        PreparedStatement pstmt = DButils.getPreparedStatement(sql,sid);
        try {
            rs = pstmt.executeQuery();
            while (rs.next()){
                gradeShow = new GradeShow(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gradeShow;
    }
}
