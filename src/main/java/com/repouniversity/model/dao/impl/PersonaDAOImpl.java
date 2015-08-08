package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.PersonaDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.entity.Persona;

@Repository
public class PersonaDAOImpl extends GenericDAOImpl<Persona> implements
		PersonaDAO {

    @Override
    protected Class<Persona> getEntityClass() {
        return Persona.class;
    }

    @Override
    protected String getTableName() {
        return "persona";
    }

    @Override
    protected Persona extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        Persona result = new Persona();
        
        result.setId(rs.getLong("id_persona"));
        result.setNombre(rs.getString("nombre"));
        result.setApellido(rs.getString("apellido"));
        result.setMail(rs.getString("mail"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Persona t) {
        return new InsertSQLStatement("INSERT INTO persona (nombre, apellido, mail, activo, fecsys) values (?, ?, ?, 1, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getApellido());
                ps.setString(3, t.getMail());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Persona t) {
        return new SQLStatement("UPDATE persona SET nombre = ?, apellido = ?, mail = ?, activo = ?, fecsys = now()  WHERE id_persona = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getApellido());
                ps.setString(3, t.getMail());
                ps.setBoolean(4, t.isActivo());
                ps.setLong(5, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "id_persona";
    }
}
