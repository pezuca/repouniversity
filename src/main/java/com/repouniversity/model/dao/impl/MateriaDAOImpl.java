package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.MateriaDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.MateriaRowMapper;
import com.repouniversity.model.entity.Materia;

@Repository
public class MateriaDAOImpl extends GenericDAOImpl<Materia> implements MateriaDAO {

    @Override
    protected Class<Materia> getEntityClass() {
        return Materia.class;
    }

    @Override
    protected String getTableName() {
        return "materia";
    }

    @Override
    protected Materia extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new MateriaRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Materia t) {
        return new InsertSQLStatement("INSERT INTO materia (nombre, descripcion, activo, fecsys) values (?, ?, 1, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getDescripcion());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Materia t) {
        return new SQLStatement("UPDATE materia SET nombre = ?, descripcion = ?, fecsys = now()  WHERE " + getColumnIdName() + " = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getDescripcion());
                ps.setLong(3, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "id_materia";
    }

}
