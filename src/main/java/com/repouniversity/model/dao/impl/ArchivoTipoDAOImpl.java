package com.repouniversity.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.ArchivoTipoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.ArchivoTipoRowMapper;
import com.repouniversity.model.entity.ArchivoTipo;

@Repository
public class ArchivoTipoDAOImpl extends GenericDAOImpl<ArchivoTipo> implements ArchivoTipoDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final ArchivoTipo a) {
        return null;
    }

    @Override
    protected Class<ArchivoTipo> getEntityClass() {
        return ArchivoTipo.class;
    }

    @Override
    protected String getTableName() {
        return "archivo_tipo";
    }

    @Override
    protected ArchivoTipo extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new ArchivoTipoRowMapper()).mapRow(rs, line);
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(ArchivoTipo t) {
        return null;
    }

    @Override
    protected String getColumnIdName() {
        return "id_tipo";
    }
}
