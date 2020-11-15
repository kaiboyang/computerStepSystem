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

@WebServlet("/shownewServlet")
public class ShownewServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IManDao ma = new Manimpl();
        List<Student> lt= ma.showAll2();
        if (lt.size()!=0){
            HttpSession ses = req.getSession();
            ses.setAttribute("s",lt);
            req.getRequestDispatcher("/user2.jsp").forward(req,resp);
            resp.sendRedirect("user2.jsp");
        }
    }
}
