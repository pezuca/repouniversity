package com.repouniversity.model.dao.query;

public abstract class InsertSQLStatement extends SQLStatement {

    public InsertSQLStatement(String query) {
        super(query);
    }

    public abstract void doAfterInsert(Long id);

}
