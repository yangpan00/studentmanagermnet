package com.studentmanagermnet.service;

import com.studentmanagermnet.dao.AdStudentDao;
import com.studentmanagermnet.model.AdStudent;

import java.util.List;

public class AdStudentService {
    private AdStudentDao adStudentDao = new AdStudentDao();
    public Integer addstudent (String studentId ,String studentName,String stuGrade,String stuPsd){
        AdStudent adStudent = adStudentDao.getStudentByStudentId(studentId);
        if(adStudent !=null){
            //教师编号重复，添加失败
            return -1;
        }
        return adStudentDao.addStudent(studentId,studentName,stuGrade,stuPsd);
    }
    public Integer deleteStudentByStudentId(int id) {
        return adStudentDao.deleteStudentByStudentId(id);
    }
    public List<AdStudent> getStudent(String grade){
        return adStudentDao.getStudent(grade);
    }
    public List<AdStudent> getAllStudent(){
        return adStudentDao.getAllStudent();
    }

    public List<AdStudent> findStudent(String studentName){
        return adStudentDao.findStudent(studentName);
    }

}
