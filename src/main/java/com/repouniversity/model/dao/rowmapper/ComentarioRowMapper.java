package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Comentario;

public class ComentarioRowMapper implements RowMapper<Comentario> {

    @Override
    public Comentario mapRow(ResultSet rs, int paramInt) throws SQLException {
    	Comentario result = new Comentario();
        
        result.setId(rs.getLong("id_comentario"));
        result.setDescripcion(rs.getString("descripcion"));
        result.setIdPersona(rs.getLong("id_persona"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
