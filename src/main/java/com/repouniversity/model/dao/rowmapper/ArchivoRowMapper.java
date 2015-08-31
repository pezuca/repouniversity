package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Archivo;

public class ArchivoRowMapper implements RowMapper<Archivo> {

    @Override
    public Archivo mapRow(ResultSet rs, int line) throws SQLException {
        Archivo archivo = new Archivo();
        
        archivo.setId(rs.getLong("id_archivo"));
        archivo.setArchivoTipo(rs.getLong("id_tipo"));
        archivo.setCurso(rs.getLong("id_Curso"));
        archivo.setDescripcion(rs.getString("descripcion"));
        archivo.setNombre(rs.getString("nombre"));
        archivo.setActivo(rs.getBoolean("activo"));
        archivo.setFechasys(rs.getDate("fecsys"));
        archivo.setPersona(rs.getLong("persona_id_persona"));
        archivo.setFechaDespublicacion(rs.getDate("fecha_despublicacion"));
        archivo.setFechaPublicacion(rs.getDate("fecha_publicacion"));
        archivo.setEstado(rs.getLong("estado"));
        archivo.setPath(rs.getString("path"));
        archivo.setTags(rs.getString("tags"));
        archivo.setBinario(rs.getBlob("binario").getBinaryStream());
        return archivo;
    }

}
