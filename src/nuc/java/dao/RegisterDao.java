package nuc.java.dao;

import nuc.java.entity.Register;
import nuc.java.utils.DButils;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDao {

    public int registerUser(Register register){
            
        String sql = "insert into Student(Sname,Spwd,Ssex,Sphone) values(?,?,?,?)";
        PreparedStatement pstmt = DButils.getPreparedStatement(sql,register.getSname(),register.getSpwd(),register.getSsex(),register.getSphone());
        try {
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
