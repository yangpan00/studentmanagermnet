package com.studentmanagermnet.service;

import com.studentmanagermnet.dao.CourseDao;
import com.studentmanagermnet.model.Course;

import java.util.List;

public class CourseService {
    private CourseDao courseDao  = new CourseDao();
    public Integer addCourse (String courseName, String teacher,String grade){
        Course course = courseDao.getCourseByCourseName(grade);
        if(course !=null){
            //上课班级重复，添加失败
            return -1;
        }
        return courseDao.addCourse(courseName,teacher,grade);
    }

    public List<Course> getAllCourse(){
        return courseDao.getAllCourse();
    }


    public Integer deleteCourseById(int id) {
        return courseDao.deleteCourseById(id);
    }

    public List<Course> findCourse( String courseName){
        return courseDao.findCourse(courseName);
    }
}
