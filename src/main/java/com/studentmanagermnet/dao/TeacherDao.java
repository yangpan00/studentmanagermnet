package com.studentmanagermnet.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.studentmanagermnet.config.DataSourceConfig;
import com.studentmanagermnet.model.Teacher;

import java.sql.SQLException;
import java.util.List;

public class TeacherDao {
    private QueryRunner queryRunner = new QueryRunner(DataSourceConfig.getDs());

//添加老师
    public  Integer addTeacher (String teacherId ,String teacherName,String phone,String psd ){
        try {
            return queryRunner.update("insert into teacher(teacherId,teacherName,phone,psd) values (?,?,?,?)", teacherId,teacherName,phone,psd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
//根据教师编号判断添加的教师是否重复

    public Teacher getTeacherByTeacherId(String teacherId){
        try {
            return queryRunner.query("select * from teacher where teacherId=?",new BeanHandler<>(Teacher.class),teacherId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

//获取全部教师列表
    public List<Teacher> getAllTeacher() {
        try {
            return queryRunner.query("select * from teacher", new BeanListHandler<>(Teacher.class));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //删除教师
    public Integer deleteTeacherByTeacherId(int id) {
        try {
            return queryRunner.update("delete from teacher where id=?",id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    //查询老师
    public List<Teacher> findTeacher(String teacherName) {
        try {
            return queryRunner.query("select * from teacher where teacherName=?", new BeanListHandler<>(Teacher.class),teacherName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
