package com.studentmanagermnet.servlet;

import com.studentmanagermnet.model.AdStudent;
import com.studentmanagermnet.service.AdStudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-student")
@MultipartConfig
public class admin_student extends HttpServlet{
    AdStudentService adStudentService = new AdStudentService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        if ("GET".equals(req.getMethod())) {
            String grade = req.getParameter("grade");
            List<AdStudent> studentlist;
            if(grade!=null && grade.equals("全部专业")  ) {
                studentlist= adStudentService.getAllStudent();
            }
            else {
                studentlist = adStudentService.getStudent(grade);
            }

            req.setAttribute("studentlist", studentlist);
        }
        req.getRequestDispatcher("/WEB-INF/jsp/admin_student.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String act = req.getParameter("act");

//添加学生：
        if (act != null && act.equals("add")) {
            String studentId = req.getParameter("studentId");
            String studentName = req.getParameter("studentName");
            String stuGrade = req.getParameter("stuGrade");
            String stuPsd = req.getParameter("stuPsd");
            Integer result = adStudentService.addstudent(studentId, studentName, stuGrade, stuPsd);


            if (result == -1) {
                req.setAttribute("msg", "学生编号重复，请重新添加！！");
            } else if (result == 1) {
                req.setAttribute("msg", "学生添加成功");
            } else {
                req.setAttribute("msg", "添加失败");
            }
        }
//删除和编辑学生信息
        if (act != null && (act.equals("delete") || act.equals("edit"))) {
            String id = req.getParameter("id");
            String studentId = req.getParameter("studentId");
            String studentName = req.getParameter("studentName");
            String stuGrade = req.getParameter("stuGrade");
            String stuPsd = req.getParameter("stuPsd");
            try {
                Integer result1 = adStudentService.deleteStudentByStudentId(Integer.parseInt(id));
                if (result1 != null && result1 == 1) {
                    req.setAttribute("msg", "删除成功！");
                } else {
                    req.setAttribute("msg", "删除失败！");
                }
            } catch (NumberFormatException e) {
                req.setAttribute("msg", "参数格式错误！");
            } catch (Exception e) {
                req.setAttribute("msg", "发生了未知错误！");
            }
            adStudentService.addstudent(studentId, studentName, stuGrade, stuPsd);
        }

        String studentName1 = req.getParameter("studentName1");
        List<AdStudent> studentlist;
        if(studentName1 ==null ){
            studentlist = adStudentService.getAllStudent();
        }
        else {
            studentlist = adStudentService.findStudent(studentName1);
            if(studentlist.size()==0){
                studentlist = adStudentService.getAllStudent();
                req.setAttribute("msg","没有您要查找的学生！！");
            }
        }
        req.setAttribute("studentlist", studentlist);
        doGet(req,resp);
    }

}
