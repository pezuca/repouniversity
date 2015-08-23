package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.SeguridadDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.RoleRowMapper;
import com.repouniversity.model.dao.rowmapper.SeguridadRowMapper;
import com.repouniversity.model.entity.Role;
import com.repouniversity.model.entity.Seguridad;

/**
 * @author Federico Tray
 */
@Repository
public class SeguridadDAOImpl extends GenericDAOImpl<Seguridad> implements SeguridadDAO {

    @Override
    protected Class<Seguridad> getEntityClass() {
        return Seguridad.class;
    }

    @Override
    protected String getTableName() {
        return "seguridad";
    }

    @Override
    protected Seguridad extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new SeguridadRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(Seguridad t) {
        return null;
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(Seguridad t) {
        return null;
    }

    @Override
    protected String getColumnIdName() {
        return "id_seguridad";
    }

}
