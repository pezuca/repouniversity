package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Alumno;

public class AlumnoRowMapper implements RowMapper<Alumno> {

    @Override
    public Alumno mapRow(ResultSet rs, int arg1) throws SQLException {
        Alumno result = new Alumno();
        
        result.setId(rs.getLong("id_alumno"));
        result.setIdPersona(rs.getLong("id_persona"));
        result.setIdCarrera(rs.getLong("Idcarrera"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
