package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.ErrorArchivoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.ErrorArchivoRowMapper;
import com.repouniversity.model.entity.Comentario;
import com.repouniversity.model.entity.ErrorArchivo;

@Repository
public class ErrorArchivoDAOImpl extends GenericDAOImpl<ErrorArchivo> implements ErrorArchivoDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected Class<ErrorArchivo> getEntityClass() {
        return ErrorArchivo.class;
    }

    @Override
    protected String getTableName() {
        return "error_archivo";
    }

    @Override
    protected ErrorArchivo extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
    	ErrorArchivo result = new ErrorArchivo();
        
        result.setId(rs.getLong("iderror_archivo"));
        result.setDescripcion(rs.getString("descripcion"));
        result.setIdPersona(rs.getLong("id_persona"));
        result.setIdArchivo(rs.getLong("id_archivo"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
         
         return result;
    }


    @Override
    protected String getColumnIdName() {
        return "iderror_archivo";
    }
    
    @Override
    public List<ErrorArchivo> findErroresForAchivo(final long idArchivo) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM error_archivo ");
        sql.append("WHERE activo = 1 AND id_archivo = ? ");
        
        List<ErrorArchivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idArchivo);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new ErrorArchivoRowMapper(), "findErroresForAchivo: " + idArchivo);

        if (list.isEmpty()) {
            return new ArrayList<ErrorArchivo>();
        }

        return list;
    }
    
    @Override
    public List<ErrorArchivo> findErrores() {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM error_archivo ");
        sql.append("WHERE activo = 1");
        
        List<ErrorArchivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
             //   ps.setLong(1, idArchivo);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new ErrorArchivoRowMapper(), "findErrores");

        if (list.isEmpty()) {
            return new ArrayList<ErrorArchivo>();
        }

        return list;
    }
    protected InsertSQLStatement buildInsertSQLStatement(final ErrorArchivo t) {
        return new InsertSQLStatement("INSERT INTO error_archivo (descripcion, id_archivo, id_persona, activo) VALUES (?, ?, ?, 1)") {
        	
            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getDescripcion());
                ps.setLong(2, t.getIdArchivo());
                ps.setLong(3, t.getIdPersona());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    
    @Override
    protected SQLStatement buildUpdateSQLStatement(final ErrorArchivo t) {
        return new SQLStatement("UPDATE tp_grupo SET id_grupo = ?, id_archivo = ?, descripcion = ?, nota = ?, activo = ?, fecsys = now() WHERE idtp_grupo = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
         
                ps.setBoolean(5, t.isActivo());
                ps.setLong(6, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }


}
