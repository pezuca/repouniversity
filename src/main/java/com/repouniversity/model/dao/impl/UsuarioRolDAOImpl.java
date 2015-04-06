package com.repouniversity.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.UsuarioRolDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.entity.UsuarioRol;

/**
 * @author Federico Tray
 */
@Repository
public class UsuarioRolDAOImpl extends GenericDAOImpl<UsuarioRol> implements UsuarioRolDAO {

    @Override
    protected Class<UsuarioRol> getEntityClass() {
        return UsuarioRol.class;
    }

    @Override
    protected String getTableName() {
        return "roles";
    }

    @Override
    protected UsuarioRol extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        UsuarioRol result = new UsuarioRol();

        result.setId(rs.getLong("id_usuario"));
        result.setNombreUsuario(rs.getString("user"));
        result.setIdAluDoc(rs.getLong("id_alu_doc"));
        result.setRol(rs.getString("rol"));

        return result;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(UsuarioRol t) {
        return null;
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(UsuarioRol t) {
        return null;
    }

    @Override
    protected String getColumnIdName() {
        return "id_usuario";
    }
}
