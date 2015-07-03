package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.ArchivoTipo;

public class ArchivoTipoRowMapper implements RowMapper<ArchivoTipo> {

    @Override
    public ArchivoTipo mapRow(ResultSet rs, int line) throws SQLException {
        ArchivoTipo archivo = new ArchivoTipo();
        
        archivo.setId(rs.getLong("id_tipo"));
        archivo.setNombre(rs.getString("nombre"));
        archivo.setActivo(rs.getBoolean("activo"));
        archivo.setFechasys(rs.getDate("fecsys"));
        
        return archivo;
    }
}
