package com.repouniversity.model.dao.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public abstract class SQLStatement {

    private String query;

    public SQLStatement(String query) {
        this.query = query;
    }

    public String getQuery() {
        return query;
    }

    public abstract void buildPreparedStatement(PreparedStatement ps) throws SQLException;
    public abstract void doAfterTransaction(int result);

}
