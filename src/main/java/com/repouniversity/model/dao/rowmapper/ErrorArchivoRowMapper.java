package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.ErrorArchivo;

public class ErrorArchivoRowMapper implements RowMapper<ErrorArchivo> {

    @Override
    public ErrorArchivo mapRow(ResultSet rs, int paramInt) throws SQLException {
    	ErrorArchivo result = new ErrorArchivo();
        
        result.setId(rs.getLong("iderror_archivo"));
        result.setDescripcion(rs.getString("descripcion"));
        result.setIdPersona(rs.getLong("id_persona"));
        result.setIdArchivo(rs.getLong("id_archivo"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        
        return result;
    }

}
