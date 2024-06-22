package com.studentmanagermnet.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.studentmanagermnet.config.DataSourceConfig;
import com.studentmanagermnet.model.Course;

import java.sql.SQLException;
import java.util.List;

public class CourseDao {

    private QueryRunner queryRunner = new QueryRunner(DataSourceConfig.getDs());


    public  Integer addCourse (String courseName ,String teacher,String grade ){
        try {
            int update = queryRunner.update("insert into course(courseName,teacher,grade) values (?,?,?)", courseName,teacher,grade);
            return update;
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return 0;
    }

    //根据上课班级查询是否重复
    public Course getCourseByCourseName(String grade){
        try {
            return queryRunner.query("select * from course where grade=?",new BeanHandler<>(Course.class),grade);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    //获取全部课程内容

    public List<Course> getAllCourse() {
        try {
            return queryRunner.query("select * from course", new BeanListHandler<>(Course.class));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //删除课程
    public Integer deleteCourseById(int id) {
        try {
            return queryRunner.update("delete from course where id=?",id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    //查询课程
    public List<Course> findCourse(String courseName){
        try {
            return queryRunner.query("select * from course where courseName=?", new BeanListHandler<>(Course.class),courseName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}


