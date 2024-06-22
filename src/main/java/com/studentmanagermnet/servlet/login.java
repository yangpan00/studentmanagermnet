package com.studentmanagermnet.servlet;

import com.studentmanagermnet.model.RespBean;
import com.studentmanagermnet.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class login extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=utf-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String checkFlag = req.getParameter("checkFlag");
        Integer login;
        try {
            login = userService.login(username,password,Integer.parseInt(role));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RespBean respBean = null;

        if (login == -1 || login == -3) {
            respBean = respBean.error("用户名或密码错误，登录失败！");
        }
        else if( login==-2){
            respBean = respBean.error("账户被禁用，登录失败！");
        }
        else if( login==1){

            if(checkFlag.equals("1")) {
                checkFlag = String.valueOf(0);
                respBean = respBean.ok("登录成功！");

            }else
                respBean = respBean.error("验证码输入错误");
        }
        resp.getWriter().write(respBean.toString());
    }

}