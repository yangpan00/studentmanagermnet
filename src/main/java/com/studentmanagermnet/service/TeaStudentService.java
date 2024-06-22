package com.studentmanagermnet.service;

import com.studentmanagermnet.dao.TeaStudentDao;
import com.studentmanagermnet.model.AdStudent;

import java.util.List;

public class TeaStudentService {
    private TeaStudentDao teaStudentDao = new TeaStudentDao();
    public List<AdStudent> getStudent(String grade){
        return teaStudentDao.getStudent(grade);
    }
    public List<AdStudent> getAllStudent(){
        return teaStudentDao.getAllStudent();
    }
    public List<AdStudent> findStudent(String studentName){
        return teaStudentDao.findStudent(studentName);
    }

    public Integer addScore ( String javaee , String web, String mysql, String soft ,int id ,Integer total){
        return teaStudentDao.addScore(javaee, web, mysql, soft,id ,total);
    }

}
