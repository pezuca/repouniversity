package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.Persona;

public class DocenteRowMapper implements RowMapper<Docente> {

    @Override
    public Docente mapRow(ResultSet rs, int arg1) throws SQLException {
        Docente docente = new Docente();
//        Persona persona = new Persona();

        docente.setId(rs.getLong("id_docente"));
        docente.setActivo(rs.getBoolean("activo"));
        docente.setFechasys(rs.getDate("fecsys"));
        
//        persona.setId(rs.getLong("id_persona"));
//        persona.setNombre(rs.getString("nombre"));
//        persona.setApellido(rs.getString("apellido"));
//        persona.setMail(rs.getString("mail"));
//        persona.setActivo(rs.getBoolean("activo"));
//        persona.setFechasys(rs.getDate("fecsys"));
        
        docente.setPersonaId(rs.getLong("id_persona"));

        return docente;
    }

}
