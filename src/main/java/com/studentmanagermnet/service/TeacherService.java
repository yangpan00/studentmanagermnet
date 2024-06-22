package com.studentmanagermnet.service;

import com.studentmanagermnet.dao.TeacherDao;
import com.studentmanagermnet.model.Teacher;

import java.util.List;

public class TeacherService {
    private TeacherDao teacherDao  = new TeacherDao();
    public Integer addTeacher (String teacherId ,String teacherName,String phone,String psd){
        Teacher teacher = teacherDao.getTeacherByTeacherId(teacherId);
        if(teacher !=null){
            //教师编号重复，添加失败
            return -1;
        }
        return teacherDao.addTeacher(teacherId,teacherName,phone,psd);
    }


    public List<Teacher> getAllTeacher(){
        return teacherDao.getAllTeacher();
    }

    public Integer deleteTeacherByTeacherId(int id) {
        return teacherDao.deleteTeacherByTeacherId(id);
    }
    public List<Teacher> findTeacher(String teacherName){
        return teacherDao.findTeacher(teacherName);
    }

}
