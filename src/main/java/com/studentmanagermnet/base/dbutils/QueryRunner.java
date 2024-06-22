package com.studentmanagermnet.base.dbutils;

import org.apache.commons.dbutils.StatementConfiguration;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class QueryRunner extends org.apache.commons.dbutils.QueryRunner {

    public void fillStatement(PreparedStatement stmt, Object... params) throws SQLException {
        super.fillStatement(stmt, params);
        System.out.println(stmt.toString());
    }

    public QueryRunner() {
    }

    public QueryRunner(boolean pmdKnownBroken) {
        super(pmdKnownBroken);
    }

    public QueryRunner(DataSource ds) {
        super(ds);
    }

    public QueryRunner(StatementConfiguration stmtConfig) {
        super(stmtConfig);
    }

    public QueryRunner(DataSource ds, boolean pmdKnownBroken) {
        super(ds, pmdKnownBroken);
    }

    public QueryRunner(DataSource ds, StatementConfiguration stmtConfig) {
        super(ds, stmtConfig);
    }

    public QueryRunner(DataSource ds, boolean pmdKnownBroken, StatementConfiguration stmtConfig) {
        super(ds, pmdKnownBroken, stmtConfig);
    }
}
