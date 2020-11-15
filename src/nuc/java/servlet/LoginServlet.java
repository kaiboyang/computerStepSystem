package nuc.java.servlet;

import nuc.java.dao.LoginDao;
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


@WebServlet(value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入了loginservlet");
        // 处理登录请求
        request.setCharacterEncoding("utf-8");
        String Sid = request.getParameter("id");
        String Spwd = request.getParameter("pwd");

        Login login = new Login(Sid,Spwd);

        // 调用登录功能
        int result = LoginDao.login(login);

        // 查询该用户
        selectStudentById ssbi = new selectStudentById();
        apply app = ssbi.selectStudentById(Sid);


        if (result==1){//登陆成功
            // 将封装的对象存到session
            HttpSession hs = request.getSession();
            hs.setAttribute("applyId", app);

            request.getRequestDispatcher("/welcome.jsp").forward(request,response);
            response.sendRedirect("welcome.jsp");
        } else{
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
