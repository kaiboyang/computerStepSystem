package nuc.java.servlet;

import nuc.java.dao.IStuDao;
import nuc.java.dao.selectStudentById;
import nuc.java.entity.Login;
import nuc.java.entity.apply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
//        int sid = Integer.parseInt(req.getParameter("username"));
        String sid = req.getParameter("username");
        Login login = new Login();
        login.setSid(sid);
        IStuDao iStuDao= new IStuDao();
        Boolean boo = iStuDao.dozhun(login);
        // 将封装的对象存到session

        // 查询该用户
        selectStudentById ssbi = new selectStudentById();
        apply app = ssbi.selectStudentById(sid);
        HttpSession hs = req.getSession();
        hs.setAttribute("applyId", app);

        // 转发
        resp.getWriter().write(String.valueOf(boo));
    }
}
