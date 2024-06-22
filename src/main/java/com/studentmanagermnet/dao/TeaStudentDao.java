package com.studentmanagermnet.dao;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.studentmanagermnet.base.dbutils.QueryRunner;
import com.studentmanagermnet.config.DataSourceConfig;
import com.studentmanagermnet.model.AdStudent;

import java.sql.SQLException;
import java.util.List;

public class TeaStudentDao {
    private QueryRunner queryRunner = new QueryRunner(DataSourceConfig.getDs());

    //添加学生成绩信息
    public Integer addScore(String javaee, String web, String mysql, String soft, int id,Integer total ) {

        try {
            return queryRunner.update("UPDATE adstudent SET javaee = ?, web = ?, mysql = ?, soft = ?, total=? WHERE id = ?", javaee, web, mysql, soft, total,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
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


    //查找学生
    public List<AdStudent> findStudent(String studentName) {
        try {
            return queryRunner.query("select * from adstudent where studentName=? ", new BeanListHandler<>(AdStudent.class),studentName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
