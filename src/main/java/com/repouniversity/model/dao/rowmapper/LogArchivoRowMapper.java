package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.LogArchivo;

public class LogArchivoRowMapper implements RowMapper<LogArchivo> {

    @Override
    public LogArchivo mapRow(ResultSet rs, int paramInt) throws SQLException {
    	LogArchivo result = new LogArchivo();

        result.setId(rs.getLong("id_logarchivo"));
        result.setIdArchivo(rs.getLong("id_archivo"));
        result.setIdCreador(rs.getLong("id_creador"));
        result.setIdPersona(rs.getLong("id_persona"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));

        return result;
    }

}
