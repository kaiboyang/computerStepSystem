package nuc.java.DaoInterface;
import nuc.java.entity.Student;
import java.sql.SQLException;
import java.util.List;

public interface IManDao {
    public List<Student> showAll();  //显示报考成功学生
    public List<Student> showGrade(); //显示成绩页面
    public boolean updateGrade(int a,int b) throws SQLException;//更新成绩信息
    public boolean updateStatus(int a, int b);//管理员分配考场等
    public List<Student> showAll2(); //显示更新后的信息
}