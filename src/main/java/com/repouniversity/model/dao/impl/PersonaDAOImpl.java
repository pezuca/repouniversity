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
        return new InsertSQLStatement("INSERT INTO persona (id_perdona, nombre, apellido, mail, activo, fecsys) values (?, ?, ?, ?, ?, now())") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getId());
                ps.setString(2, t.getNombre());
                ps.setString(3, t.getApellido());
                ps.setString(4, t.getMail());
                ps.setBoolean(5, t.isActivo());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(Persona t) {
        return null;
    }

	
}
