package com.repouniversity.model.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.repouniversity.model.entity.Color;

public class ColorRowMapper implements RowMapper<Color> {

    @Override
    public Color mapRow(ResultSet rs, int paramInt) throws SQLException {
    	Color result = new Color();

        result.setId(rs.getLong("id_color"));
        result.setColor(rs.getString("color"));
        result.setActivo(rs.getBoolean("activo"));
        
        
        return result;
    }

}
