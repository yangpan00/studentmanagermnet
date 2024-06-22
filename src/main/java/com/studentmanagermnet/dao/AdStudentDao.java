package com.studentmanagermnet.dao;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.studentmanagermnet.base.dbutils.QueryRunner;
import com.studentmanagermnet.config.DataSourceConfig;
import com.studentmanagermnet.model.AdStudent;

import java.sql.SQLException;
import java.util.List;

public class AdStudentDao {
    private QueryRunner queryRunner = new QueryRunner(DataSourceConfig.getDs());

    //添加学生
    public  Integer addStudent (String studentId ,String studentName,String stuGrade,String stuPsd ){
        try {
            return queryRunner.update("insert into adstudent(studentId,studentName,stuGrade,stuPsd) values (?,?,?,?)", studentId,studentName,stuGrade,stuPsd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

 //根据学生学号判断是否重复
    public AdStudent getStudentByStudentId(String studentId){
        try {
            return queryRunner.query("select * from adstudent where studentId=?",new BeanHandler<>(AdStudent.class),studentId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    //获取对应专业学生列表
    public List<AdStudent> getStudent(String grade) {
        try {
            return queryRunner.query("select * from adstudent where stuGrade like '"+grade+"%'", new BeanListHandler<>(AdStudent.class));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //获取全部学生列表
    public List<AdStudent> getAllStudent() {
        try {
            return queryRunner.query("select * from adstudent ", new BeanListHandler<>(AdStudent.class));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //删除学生
    public Integer deleteStudentByStudentId(int id) {
        try {
            return queryRunner.update("delete  from adstudent where id=?",id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    //查找学生
    public List<AdStudent> findStudent(String studentName) {
        try {
            return queryRunner.query("select * from adstudent where studentName=? ", new BeanListHandler<>(AdStudent.class),studentName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
