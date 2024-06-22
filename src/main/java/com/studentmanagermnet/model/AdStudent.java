package com.studentmanagermnet.model;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdStudent {
    @ExcelIgnore
    private Integer id;
    @ExcelProperty("学号")
    private String studentId;
    @ExcelProperty("学生姓名")
    private String studentName;
    @ExcelProperty("所在专业班级")
    private String stuGrade;
    @ExcelIgnore
    private String stuPsd;

    @ExcelProperty("javaee")
    private Integer javaee;
    @ExcelProperty("响应式web开发")
    private Integer web;
    @ExcelProperty("数据库原理")
    private Integer mysql;
    @ExcelProperty("软工导论")
    private Integer soft;
    @ExcelProperty("总分")
    private Integer total;

    public AdStudent(Integer javaee, Integer web, Integer mysql, Integer soft) {
        this.javaee = javaee;
        this.web = web;
        this.mysql = mysql;
        this.soft = soft;
    }

    public Integer getTotal() {
        return javaee + web + mysql + soft;
    }

}
