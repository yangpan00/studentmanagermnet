package com.studentmanagermnet.servlet;

import com.studentmanagermnet.model.Course;
import com.studentmanagermnet.service.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/course")
@MultipartConfig
public class admin_course extends HttpServlet {

    private CourseService courseService = new CourseService();



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html;charset=utf-8");
            String courseName1 = req.getParameter("courseName1");
            List <Course> courselist ;
            if(courseName1 ==null ||courseName1.equals("全部课程")){
                courselist = courseService.getAllCourse();
            }
            else{
                courselist =courseService.findCourse(courseName1);
                if(courselist.size() ==0){
                    courselist = courseService.getAllCourse();
                    req.setAttribute("msg","没有您要查找的课程！！");
                }
            }
        req.setAttribute("courselist", courselist);
        req.getRequestDispatcher("/WEB-INF/jsp/admin_course.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String act = req.getParameter("act");

        if(act != null && act.equals("add")){
            //添加课程：
            String courseName = req.getParameter("courseName");
            String teacher = req.getParameter("teacher");
            String grade = req.getParameter("grade");
            Integer result = courseService.addCourse(courseName,teacher,grade);


            if (result == -1) {
                req.setAttribute("msg","上课班级重复请重新添加！！");
            } else if (result == 1) {
                req.setAttribute("msg","课程添加成功");
            } else {
                req.setAttribute("msg","添加失败");
            }
        }


        if (act != null && (act.equals("delete") || act.equals("edit"))) {
            String id = req.getParameter("courseId");
             String courseName = req.getParameter("courseName");
             String teacher = req.getParameter("teacher");
             String grade = req.getParameter("grade");
            try {
                Integer result1 = courseService.deleteCourseById(Integer.parseInt(id));
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
            courseService.addCourse(courseName, teacher, grade);
        }
        doGet(req, resp);
    }

}


