package com.studentmanagermnet.servlet;

import com.alibaba.excel.EasyExcel;
import com.studentmanagermnet.model.AdStudent;
import com.studentmanagermnet.service.TeaStudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet("/tea-score")
@MultipartConfig

public class tea_score extends HttpServlet {
    TeaStudentService teaStudentService = new TeaStudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String act = req.getParameter("act");
        if ("GET".equals(req.getMethod())) {
            String grade = req.getParameter("grade");
            List<AdStudent> studentlist;
            if (grade != null && grade.equals("全部专业")) {
                studentlist = teaStudentService.getAllStudent();
            } else {
                studentlist = teaStudentService.getStudent(grade);
            }
            // 对学生列表按照总分进行排序
            studentlist.sort((student1, student2) -> Integer.compare(student2.getTotal(), student1.getTotal()));
            req.setAttribute("studentlist", studentlist);

            if (act != null && act.equals("daochu")) {
                resp.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                String fileName = URLEncoder.encode(grade, "UTF-8").replaceAll("\\+", "%20");
                resp.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
                EasyExcel.write(resp.getOutputStream(), AdStudent.class).sheet("Sheet1").doWrite(studentlist);
                return;
            }
        }

        req.getRequestDispatcher("/WEB-INF/jsp/tea_score.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");
//搜索学生信息
        String studentName1 = req.getParameter("studentName1");
        List<AdStudent> studentlist;
        if (studentName1 == null) {
            studentlist = teaStudentService.getAllStudent();
        } else {
            studentlist = teaStudentService.findStudent(studentName1);
            if (studentlist.size() == 0) {
                studentlist = teaStudentService.getAllStudent();
                req.setAttribute("msg", "没有您要查找的学生！！");
            }
        }
        req.setAttribute("studentlist", studentlist);
        doGet(req, resp);
    }

}

