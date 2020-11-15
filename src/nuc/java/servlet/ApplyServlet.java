package nuc.java.servlet;

import nuc.java.dao.ApplyDao;
import nuc.java.dao.SelectEid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        // 获取信息
        String Sid = request.getParameter("Sid");
        String Ename = request.getParameter("Scourse");

        // 根据考试名称获取到考试id
        SelectEid seid = new SelectEid();
        String Eid = seid.selectEid(Ename);

        // 获取dao层方法
        ApplyDao apd = new ApplyDao();
        int result = apd.ApplyDao(Sid,Eid);

        if (result==1){
            System.out.println("报名成功");
            request.setAttribute("result","success");
            request.getRequestDispatcher("welcome.jsp").forward(request,response);
        } else {
            System.out.println("您已报名，请勿重复报考");
            request.setAttribute("result","fai");
            request.getRequestDispatcher("welcome.jsp").forward(request,response);
        }

    }
}
