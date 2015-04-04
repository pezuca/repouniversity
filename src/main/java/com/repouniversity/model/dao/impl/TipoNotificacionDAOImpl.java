package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.TipoNotificacionDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.TipoNotificacionRowMapper;
import com.repouniversity.model.entity.TipoNotificacion;

@Repository
public class TipoNotificacionDAOImpl extends GenericDAOImpl<TipoNotificacion> implements TipoNotificacionDAO {

    @Override
    protected Class<TipoNotificacion> getEntityClass() {
        return TipoNotificacion.class;
    }

    @Override
    protected String getTableName() {
        return "tiponotificacion";
    }

    @Override
    protected TipoNotificacion extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new TipoNotificacionRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final TipoNotificacion t) {
        return new InsertSQLStatement("INSERT INTO tiponotificacion (idTipoNotificacion, descripcion) values (?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getId());
                ps.setString(2, t.getDescripcion());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final TipoNotificacion t) {
        return new SQLStatement("UPDATE tiponotificacion SET descripcion = ? WHERE idTipoNotificacion = ?") {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getDescripcion());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "idTipoNotificacion";
    }
}
