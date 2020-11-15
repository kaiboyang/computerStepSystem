package nuc.java.servlet;

import nuc.java.dao.RegisterDao;
import nuc.java.dao.SelectNewStudent;
import nuc.java.entity.Login;
import nuc.java.entity.Register;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String Sname = req.getParameter("Sname");
        String Spwd = req.getParameter("Spwd");
        String Ssex = req.getParameter("Ssex");
        String Sphone = req.getParameter("Sphone");
        Register register = new Register(Sname, Spwd, Ssex, Sphone);

        // 注册
        RegisterDao registerDao = new RegisterDao();
        int i = registerDao.registerUser(register);

        // 查找新注册进去的数据
        SelectNewStudent sns = new SelectNewStudent();
        List<Login> list = sns.selectNewStudent();
        System.out.println(list.get(0).getSid());

        req.setAttribute("id", list.get(0).getSid());
        req.setAttribute("name", list.get(0).getSname());
        req.setAttribute("phone", list.get(0).getSphone());

        // 状态
        req.setAttribute("statue", "1");

        req.getRequestDispatcher("/login.jsp").forward(req, resp);
        resp.sendRedirect("login.jsp");
    }
}
