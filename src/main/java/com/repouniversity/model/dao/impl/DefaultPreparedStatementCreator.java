package com.repouniversity.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.PreparedStatementCreator;

import com.repouniversity.model.dao.query.SQLStatement;

final class DefaultPreparedStatementCreator implements PreparedStatementCreator {

    private SQLStatement sqlStatement;

    DefaultPreparedStatementCreator(SQLStatement sqlStatement) {
        this.sqlStatement = sqlStatement;
    }

    @Override
    public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
        PreparedStatement ps = connection.prepareStatement(sqlStatement.getQuery());
        sqlStatement.buildPreparedStatement(ps);
        return ps;
    }

}
