package com.studentmanagermnet.servlet;

import com.studentmanagermnet.model.AdStudent;
import com.studentmanagermnet.service.TeaStudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/tea-student")
@MultipartConfig

public class tea_student extends HttpServlet {
    TeaStudentService teaStudentService = new TeaStudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        if ("GET".equals(req.getMethod())) {
            String grade = req.getParameter("grade");
            List<AdStudent> studentlist;
            if(grade!=null && grade.equals("全部专业")  ) {
                studentlist= teaStudentService.getAllStudent();
            }
            else {
                studentlist = teaStudentService.getStudent(grade);
            }

            req.setAttribute("studentlist", studentlist);
        }
        req.getRequestDispatcher("/WEB-INF/jsp/tea_student.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");
//编辑学生成绩
        String act = req.getParameter("act");
        if(act!=null && act.equals("edit")) {
            String id = req.getParameter("id");
            String javaee = req.getParameter("javaee");
            String web = req.getParameter("web");
            String mysql = req.getParameter("mysql");
            String soft = req.getParameter("soft");
            AdStudent adStudent = new AdStudent(Integer.valueOf(javaee), Integer.valueOf(web),Integer.valueOf(mysql),Integer.valueOf(soft));
            Integer total = adStudent.getTotal();
            teaStudentService.addScore(javaee, web, mysql, soft, Integer.parseInt(id),total);
        }

//搜索学生信息
        String studentName1 = req.getParameter("studentName1");
        List<AdStudent> studentlist;
        if(studentName1 ==null ){
            studentlist = teaStudentService.getAllStudent();
        }
        else {
            studentlist = teaStudentService.findStudent(studentName1);
            if(studentlist.size()==0){
                studentlist = teaStudentService.getAllStudent();
                req.setAttribute("msg","没有您要查找的学生！！");
            }
        }
        req.setAttribute("studentlist", studentlist);
        doGet(req,resp);
    }

}

