package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.CarreraDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.CarreraRowMapper;
import com.repouniversity.model.entity.Carrera;

@Repository
public class CarreraDAOImpl extends GenericDAOImpl<Carrera> implements CarreraDAO {
    
    protected static final String TABLE_NAME = "carrera";

    @Override
    protected Class<Carrera> getEntityClass() {
        return Carrera.class;
    }

    @Override
    protected String getTableName() {
        return TABLE_NAME;
    }

    @Override
    protected Carrera extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new CarreraRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Carrera t) {
        return new InsertSQLStatement("insert into alumno (nombre) values (?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Carrera t) {

        return new SQLStatement("update alumno set nombre = ? where id = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setLong(1, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "idcarrera";
    }

    @Override
    public List<Carrera> findByMateriaId(final Long materiaId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT c.* from carrera c JOIN carrera_materia cm ON cm.idcarrera = c.idcarrera ");
        sql.append("WHERE ac.id_alumno = ? ");
        sql.append("AND c.activo = 1");

        List<Carrera> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, materiaId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new CarreraRowMapper(), "findByCursoId: " + materiaId);
        
        return list;
    }
}
