package com.studentmanagermnet.servlet;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.listener.PageReadListener;
import com.studentmanagermnet.model.Teacher;
import com.studentmanagermnet.service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-teacher")
@MultipartConfig
public class admin_teacher extends HttpServlet {

    TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String teacherName = req.getParameter("teacherName1");
        List<Teacher> teacherlist;
        if (teacherName == null || teacherName.equals("全部教师")) {
            teacherlist = teacherService.getAllTeacher();
        } else {
            teacherlist = teacherService.findTeacher(teacherName);
            if (teacherlist.size() == 0) {
                teacherlist = teacherService.getAllTeacher();
                req.setAttribute("msg", "没有您要查找到教师！！");
            }
        }

        req.setAttribute("teacherlist", teacherlist);
        req.getRequestDispatcher("/WEB-INF/jsp/admin_teacher.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String act = req.getParameter("act");


        if (act != null && act.equals("add")) {
            //添加老师：
            String teacherId = req.getParameter("teacherId");
            String teacherName = req.getParameter("teacherName");
            String phone = req.getParameter("phone");
            String psd = req.getParameter("psd");

            Integer result = teacherService.addTeacher(teacherId, teacherName, phone, psd);


            if (result == -1) {
                req.setAttribute("msg", "教师编号重复，请重新添加！！");
            } else if (result == 1) {
                req.setAttribute("msg", "教师添加成功");
            } else {
                req.setAttribute("msg", "添加失败");
            }
        }



        if (act != null && (act.equals("delete") || act.equals("edit"))) {
            String id = req.getParameter("id");
            String tid = req.getParameter("teacherId");
            String teacherName = req.getParameter("teacherName");
            String phone = req.getParameter("phone");
            String psd = req.getParameter("psd");
            try {
                Integer result1 = teacherService.deleteTeacherByTeacherId(Integer.parseInt(id));
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
            teacherService.addTeacher(tid, teacherName, phone, psd);
        }
//导入教师列表
        if (act != null && act.equals("import")) {
            this.importData(req, resp);
        }
        doGet(req, resp);

    }


    private void importData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EasyExcel.read(req.getPart("file").getInputStream(), Teacher.class,
                new PageReadListener<Teacher>(dataList ->
                        dataList.forEach(e ->
                                teacherService.addTeacher(e.getTeacherId(),
                                        e.getTeacherName(),
                                        e.getPhone(),
                                        e.getPsd())
                        )))
                .sheet().doRead();
    }
}
