package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.CursoMateria;

public class CursoMateriaRowMapper implements RowMapper<CursoMateria> {

    @Override
    public CursoMateria mapRow(ResultSet rs, int line) throws SQLException {
        CursoMateria cursoMateria = new CursoMateria();
        
        cursoMateria.setId(rs.getLong("id_curso_materia"));
        cursoMateria.setIdCurso(rs.getLong("id_curso"));
        cursoMateria.setCodigoCurso(rs.getString("codigo"));
        cursoMateria.setDescripcionCurso(rs.getString("descripcion"));
        cursoMateria.setIdMateria(rs.getLong("id_materia"));
        cursoMateria.setNombreMateria(rs.getString("nombre"));
        cursoMateria.setTipoNotificacion(rs.getLong("tiponotificacion"));
        
        return cursoMateria;
    }

}
