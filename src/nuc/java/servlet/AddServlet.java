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

@WebServlet("/addServlet")
public class AddServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int Rid = Integer.parseInt((req.getParameter("Rid")));
        int Sid = Integer.parseInt(req.getParameter("Sid"));
        IManDao ma = new Manimpl();
        try {
            boolean flag = ma.updateStatus(Rid,Sid);
            if (flag ==true){
                List<Student> lt= ma.showAll2();
                HttpSession ses = req.getSession();
                ses.setAttribute("s",lt);
                req.getRequestDispatcher("/admin.jsp").forward(req,resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            System.out.println("AddServlet");
        }
    }
}