package com.studentmanagermnet.model;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;

public class Teacher {
    @ExcelIgnore
    private Integer id;
    @ExcelProperty("教师编号")
    private String teacherId;
    @ExcelProperty("教师姓名")
    private String teacherName;
    @ExcelProperty("联系电话")

    private String phone;
    @ExcelProperty("登录密码")
    String psd;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }




    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getPsd() {
        return psd;
    }

    public void setPsd(String psd) {
        this.psd = psd;
    }
}
