package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.repouniversity.model.dao.AlumnoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Docente;

public class AlumnoDAOImpl extends GenericDAOImpl<Alumno> implements AlumnoDAO {
    
    protected static final String TABLE_NAME = "alumno";

    @Override
    public Alumno findAlumnoByPersonaId(Integer personaId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Docente findDocenteByPersonaId(Integer personaId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected Class<Alumno> getEntityClass() {
        return Alumno.class;
    }

    @Override
    protected String getTableName() {
        return TABLE_NAME;
    }

    @Override
    protected Alumno extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        Alumno result = new Alumno();
        
        result.setId(rs.getLong("id_alumno"));
        result.setIdPersona(rs.getLong("id_persona"));
        result.setIdCarrera(rs.getLong("Idcarrera"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Alumno t) {
        return new InsertSQLStatement("insert into alumno (id_perdona, Idcarrera, activo, fechasys) values (?, ?, ?, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdPersona());
                ps.setLong(2, t.getIdCarrera());
                ps.setBoolean(3, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Alumno t) {

        return new SQLStatement("update alumno set id_persona = ?, Idcarrera = ?, activo = ?, fechasys = now()  where id = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdPersona());
                ps.setLong(2, t.getIdCarrera());
                ps.setBoolean(3, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

}
