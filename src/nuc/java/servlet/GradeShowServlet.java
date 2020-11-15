package nuc.java.servlet;

import nuc.java.dao.GradeShowDao;
import nuc.java.entity.GradeShow;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/GradeShowServlet")
public class GradeShowServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String id = (String) req.getAttribute("id");

        // 执行Dao层
        GradeShowDao gsd = new GradeShowDao();
        GradeShow gs = gsd.gradeShowDao(id);

        HttpSession ses = req.getSession();
        ses.setAttribute("s", gs);
        req.getRequestDispatcher("/gradeShow.jsp").forward(req, resp);
        resp.sendRedirect("gradeShow.jsp");

    }
}
