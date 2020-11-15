package nuc.java.dao;

import nuc.java.DaoInterface.IManDao;
import nuc.java.entity.Student;
import nuc.java.utils.DButils;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class Manimpl implements IManDao {
    @Override
    public List<Student> showAll() {
        String sql = "select student.*,room.Tname,exam.Ename from student,exam,room where student.Eid = exam.Eid and student.Sstatus = 1 and room.Rid=student.Rid";
        PreparedStatement ps = DButils.getPreparedStatement(sql);
        ResultSet rs = null;
        List<Student> list = new ArrayList<Student>();
        try {
            rs = ps.executeQuery();
            while (rs.next()) {
                Student stu = new Student(
                        rs.getInt("Sid"),
                        rs.getString("Sname"),
                        rs.getString("Spwd"),
                        rs.getString("Ssex"),
                        rs.getString("Sphone"),
                        rs.getInt("Sstatus"),
                        rs.getInt("Eid"),
                        rs.getInt("Aid"),
                        rs.getInt("Rid"),
                        rs.getInt("Grade"),
                        rs.getString("Tname"),
                        rs.getString("Ename")

                );
                list.add(stu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }

    @Override
    public List<Student> showGrade() {
        String sql = "select student.Sid,Sname,Ssex,Grade,Exam.Eid,Ename from student,exam where student.Eid = exam.Eid";
        PreparedStatement ps = DButils.getPreparedStatement(sql);
        ResultSet rs = null;
        List<Student> list = new ArrayList<Student>();
        try {
            rs = ps.executeQuery();
            while (rs.next()) {
                Student stu = new Student(
                        rs.getInt("Sid"),
                        rs.getString("Sname"),
                        rs.getString("Ssex"),
                        rs.getInt("Grade"),
                        rs.getInt("Eid"),
                        rs.getString("Ename")

                );
                list.add(stu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }

    @Override
    public boolean updateGrade(int a, int b) throws SQLException {
        boolean flag = false;
        String sql = "update student set Grade=? where Sid=? ";
        PreparedStatement ps = DButils.getPreparedStatement(sql);
        try {
            ps.setInt(1, a);
            ps.setInt(2, b);
            int row = ps.executeUpdate();
            if (row > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return flag;
        }
    }

    @Override
    public boolean updateStatus(int a, int b) {
        boolean flag = false;
        String sql = "update student set Rid=? where Sid=?";
        PreparedStatement ps = DButils.getPreparedStatement(sql);
        try {
            ps.setInt(1, a);
            ps.setInt(2, b);
            int row = ps.executeUpdate();
            if (row > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return flag;
        }
    }

    @Override
    public List<Student> showAll2() {
        String sql = "select student.Sid,student.Sname,student.Spwd,student.Ssex,student.Sphone,exam.Eid,exam.Ename,student.Aid,room.Rid,room.Tname,student.Grade\n" +
                "from student,exam,room where student.Eid = exam.Eid and student.Rid = room.Rid;";
        PreparedStatement ps = DButils.getPreparedStatement(sql);
        ResultSet rs = null;
        List<Student> list = new ArrayList<Student>();
        try {
            rs = ps.executeQuery();
            while (rs.next()) {
                Student stu = new Student(
                        rs.getInt("Sid"),
                        rs.getString("Sname"),
                        rs.getString("Spwd"),
                        rs.getString("Ssex"),
                        rs.getString("Sphone"),
                        rs.getInt("Eid"),
                        rs.getString("Ename"),
                        rs.getInt("Aid"),
                        rs.getInt("Rid"),
                        rs.getString("Tname"),
                        rs.getInt("Grade")
                );
                list.add(stu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    }
}
