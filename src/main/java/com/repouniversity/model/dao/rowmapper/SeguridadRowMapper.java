package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Seguridad;

public class SeguridadRowMapper implements RowMapper<Seguridad> {

    @Override
    public Seguridad mapRow(ResultSet rs, int paramInt) throws SQLException {
    	Seguridad result = new Seguridad();

        result.setId(rs.getLong("id_seguridad"));
        result.setMayusculas(rs.getLong("mayusculas"));
        result.setMinusculas(rs.getLong("minusculas"));
        result.setEspeciales(rs.getLong("especiales"));
        result.setLongMinima(rs.getLong("longMinima"));
        result.setNumeros(rs.getLong("numeros"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fesys"));
        result.setVigencia(rs.getLong("vigencia"));
        
        return result;
    }

}
