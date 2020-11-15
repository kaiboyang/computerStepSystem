package nuc.java.servlet;
import nuc.java.dao.SelectZhunkaozhengDao;
import nuc.java.entity.Attendence;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/zhunkaozhengServlet")
public class zhunkaozhengServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 拿到需要查询的id
        String id = String.valueOf(req.getAttribute("id"));
        SelectZhunkaozhengDao selectZKZ = new SelectZhunkaozhengDao();
        Attendence attendence = selectZKZ.SelectZhunkaozhengDao(id);

        HttpSession hs = req.getSession();
        hs.setAttribute("attendance", attendence);

        req.getRequestDispatcher("/zhunkaozhen.jsp").forward(req,resp);
        resp.sendRedirect("zhunkaozhen.jsp");
    }
}
