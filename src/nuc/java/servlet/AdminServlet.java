package nuc.java.servlet;

import nuc.java.dao.AdLoginDao;
import nuc.java.entity.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String aid = req.getParameter("aid");
        String apwd = req.getParameter("apwd");

       // 封装为对象
        Admin admin = new Admin(aid,apwd);

        // 调用dao层
        AdLoginDao adD = new AdLoginDao();
        int i = adD.adLoginDao(admin);

        // 判断
        if (i==1){
            System.out.println("登陆成功");
            resp.sendRedirect("admin.jsp");
        } else{
            System.out.println("登录失败");
            resp.sendRedirect("login.jsp");
        }
    }
}
