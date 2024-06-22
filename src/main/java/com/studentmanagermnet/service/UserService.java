package com.studentmanagermnet.service;

import com.studentmanagermnet.dao.UserDao;
import com.studentmanagermnet.model.User;

import java.sql.SQLException;

public class UserService {
    private UserDao userDao = new UserDao();
    /*
    验证用户登陆
    username 登陆用户名
    password 登陆用户密码
    return -1 用户不存在
    -2 账户禁用
    -3 密码输入错误
     */
    public  Integer login(String username,String password ,int role) throws SQLException {
        User user = userDao.getUserByUsername(username,role);
        if(user == null){
            return -1;
            //用户不存在
        }
        if(!user.getEnabled()){
            return -2;
            //用户被禁用
        }
        if(!password.equals(user.getPassword())){
            return -3;
            //密码不正确
        }
        return 1;
    }

}
