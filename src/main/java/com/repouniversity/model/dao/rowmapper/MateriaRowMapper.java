package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Materia;

public class MateriaRowMapper implements RowMapper<Materia> {

    @Override
    public Materia mapRow(ResultSet rs, int arg1) throws SQLException {
        Materia materia = new Materia();
        
        materia.setId(rs.getLong("id_materia"));
        materia.setNombre(rs.getString("nombre"));
        materia.setDescripcion(rs.getString("descripcion"));
        materia.setActivo(rs.getBoolean("activo"));
        materia.setFechasys(rs.getDate("fecsys"));

        return materia;
    }

}
