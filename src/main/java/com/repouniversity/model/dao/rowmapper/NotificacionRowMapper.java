package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Notificacion;

public class NotificacionRowMapper implements RowMapper<Notificacion> {

    @Override
    public Notificacion mapRow(ResultSet rs, int arg1) throws SQLException {
        Notificacion notificacion = new Notificacion();
        notificacion.setId(rs.getLong("idnotificacion"));
        notificacion.setTipoId(rs.getLong("tiponotificacion"));
        notificacion.setCursoId(rs.getLong("idcurso"));
        notificacion.setDocenteId(rs.getLong("iddocente"));
        notificacion.setAlumnoId(rs.getLong("idalumno"));

        return notificacion;
    }

}
