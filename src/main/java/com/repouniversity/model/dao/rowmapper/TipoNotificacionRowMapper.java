package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.TipoNotificacion;

public class TipoNotificacionRowMapper implements RowMapper<TipoNotificacion> {

    @Override
    public TipoNotificacion mapRow(ResultSet rs, int arg1) throws SQLException {
        TipoNotificacion result = new TipoNotificacion();
        
        result.setId(rs.getLong("idTipoNotificacion"));
        result.setDescripcion(rs.getString("descripcion"));
        
        return result;
    }

}
