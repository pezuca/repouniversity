package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.VwArchivo;

public class VwArchivoRowMapper implements RowMapper<VwArchivo> {

    @Override
    public VwArchivo mapRow(ResultSet rs, int line) throws SQLException {
        VwArchivo vwarchivo = new VwArchivo();
        
        vwarchivo.setId(rs.getLong("id_archivo"));
        vwarchivo.setIdTipo(rs.getLong("id_tipo"));
        vwarchivo.setIdCurso(rs.getLong("id_Curso"));
        vwarchivo.setDescripcion(rs.getString("descripcion"));
        vwarchivo.setNombre(rs.getString("nombre"));
        vwarchivo.setActivo(rs.getBoolean("activo"));
        vwarchivo.setFechasys(rs.getDate("fecsys"));
        vwarchivo.setIdPersona(rs.getLong("persona_id_persona"));
        // result.setFechaDespublicacion(rs.getDate("fecha_despublicacion"));
        // result.setFechaPublicacion(rs.getDate("fecha_publicacion"));
        vwarchivo.setEstado(rs.getLong("estado"));
        vwarchivo.setPath(rs.getString("path"));
        vwarchivo.setTags(rs.getString("tags"));
        //  result.setGrupo(rs.getLong("grupo"));
        
        return vwarchivo;
    }

}
