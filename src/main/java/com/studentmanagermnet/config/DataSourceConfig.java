package com.studentmanagermnet.config;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.util.Properties;

public class DataSourceConfig  {
    static Properties PROPERTIES = new Properties();
    private static DataSource ds = null;
    static {
        try {
            PROPERTIES.load(DataSourceConfig.class.getClassLoader().getResourceAsStream("db.properties"));
            ds = DruidDataSourceFactory.createDataSource(PROPERTIES);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static DataSource getDs(){
        return ds;
    }







}
