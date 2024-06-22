package com.studentmanagermnet.dao;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import com.studentmanagermnet.config.DataSourceConfig;
import com.studentmanagermnet.model.User;

import java.sql.SQLException;

public class UserDao {
        private QueryRunner queryRunner = new QueryRunner(DataSourceConfig.getDs());

        public User getUserByUsername(String username, int role) throws SQLException {
                try {
                        return queryRunner.query("select * from user where username=? and role=?",new BeanHandler<>(User.class),username,role);
                } catch (SQLException e) {
                        e.printStackTrace();
                }
                return null;
        }
}
