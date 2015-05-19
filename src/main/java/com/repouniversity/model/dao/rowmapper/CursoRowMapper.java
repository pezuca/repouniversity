package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Curso;

public class CursoRowMapper implements RowMapper<Curso> {

    @Override
    public Curso mapRow(ResultSet rs, int arg1) throws SQLException {
        Curso result = new Curso();

        result.setId(rs.getLong("id_curso"));
        result.setNombre(rs.getString("nombre"));
        result.setCodigo(rs.getString("codigo"));
        result.setDescripcion(rs.getString("descripcion"));
        result.setActivo(rs.getBoolean("activo"));
        result.setDocenteId(rs.getLong("id_docente"));
        result.setMateriaId(rs.getLong("id_materia"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
