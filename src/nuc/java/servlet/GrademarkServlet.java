package nuc.java.servlet;



import nuc.java.DaoInterface.IManDao;
import nuc.java.dao.Manimpl;
import nuc.java.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet("/GrademarkServlet")
public class GrademarkServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("发过去了");
        req.setCharacterEncoding("utf-8");

        String sid = req.getParameter("Sid");
        String grade = req.getParameter("Grade");

        int ssid = Integer.parseInt(sid);
        int ggrade = Integer.parseInt(grade);

        IManDao ma = new Manimpl();
        try {
            boolean flag = ma.updateGrade(ggrade,ssid);
            if (flag ==true){
                List<Student> lt= ma.showGrade();
                HttpSession ses = req.getSession();
                ses.setAttribute("s",lt);
                req.getRequestDispatcher("/grade.jsp").forward(req,resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            System.out.println("GrademarkServlet错了");
        }
    }
}
