package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.LogArchivoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.LogArchivoRowMapper;
import com.repouniversity.model.dao.rowmapper.VwLogArchivoRowMapper;
import com.repouniversity.model.entity.LogArchivo;
import com.repouniversity.model.entity.VwLogArchivo;

/**
 * @author Federico Paradela
 */
@Repository
public class LogArchivoDAOImpl extends GenericDAOImpl<LogArchivo> implements LogArchivoDAO {

    @Override
    protected Class<LogArchivo> getEntityClass() {
        return LogArchivo.class;
    }

    @Override
    protected String getTableName() {
        return "log_archivo";
    }

    @Override
    protected LogArchivo extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new LogArchivoRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(LogArchivo t) {
    	return new InsertSQLStatement("INSERT INTO log_archivo (id_archivo, id_creador, id_persona, activo, fecsys) values (?, ?, ?, 1, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdArchivo());
                ps.setLong(2, t.getIdCreador());
                ps.setLong(3, t.getIdPersona());
                
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    public List<VwLogArchivo> findMisArchivosBajados(final Long personaId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM vw_logarchivo ");
        sql.append("WHERE id_creador = ? ");
        
        List<VwLogArchivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, personaId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new VwLogArchivoRowMapper(), "findMisArchivosBajados: " + personaId);

        if (list.isEmpty()) {
            return new ArrayList<VwLogArchivo>();
        }

        return list;
    }
    @Override
    public List<LogArchivo> findLogArchivoForArchivoId(final Long archivoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM log_archivo ");
        sql.append("WHERE id_archivo = ? ");
        
        List<LogArchivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, archivoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new LogArchivoRowMapper(), "findLogArchivoForArchivoId: " + archivoId);

        if (list.isEmpty()) {
            return new ArrayList<LogArchivo>();
        }

        return list;
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(LogArchivo t) {
        return null;
    }

    @Override
    protected String getColumnIdName() {
        return "id_logarchivo";
    }

}
