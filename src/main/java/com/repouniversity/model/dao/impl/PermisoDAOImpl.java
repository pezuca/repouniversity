package com.repouniversity.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.PermisoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.PermisoRowMapper;
import com.repouniversity.model.entity.Permiso;

/**
 * @author Federico Paradela
 */
@Repository
public class PermisoDAOImpl extends GenericDAOImpl<Permiso> implements PermisoDAO {

    @Override
    protected Class<Permiso> getEntityClass() {
        return Permiso.class;
    }

    @Override
    protected String getTableName() {
        return "permiso";
    }

    @Override
    protected Permiso extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new PermisoRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(Permiso t) {
        return null;
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(Permiso t) {
        return null;
    }

    @Override
    protected String getColumnIdName() {
        return "id_permiso";
    }

   
}
